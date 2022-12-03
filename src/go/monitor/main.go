package main

import (
	"flag"
	"fmt"
	"net"
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"github.com/rs/zerolog/log"
	"github.com/satreix/everest/src/go/logging"
)

// serviceMetrics holds metrics for a service
type serviceMetrics struct {
	VisitTotal prometheus.Counter
}

// newServiceMetrics registers metrics
func newServiceMetrics(prefix string) serviceMetrics {
	return serviceMetrics{
		VisitTotal: promauto.NewCounter(prometheus.CounterOpts{
			Name: fmt.Sprintf("%v_visit_total", prefix),
			Help: "The total number of visits",
		}),
	}
}

// Service of the app
type Service struct {
	metrics serviceMetrics
}

// NewService returns a new service.
func NewService(serviceName string) Service {
	return Service{
		metrics: newServiceMetrics(serviceName),
	}
}

// Handler return a HTTP handler for the service.
func (s Service) Handler() http.Handler {
	mux := http.NewServeMux()
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { w.Write([]byte("ok")) })
	mux.Handle("/metrics", promhttp.Handler())
	return s.middleware(mux)
}

// middleware to log and record metrics
func (s Service) middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		s.metrics.VisitTotal.Inc()
		next.ServeHTTP(w, r)
	})
}

func main() {
	addr := flag.String("addr", "127.0.0.1:1234", "address")
	debug := flag.Bool("debug", false, "sets log level to debug")
	serviceName := flag.String("service-name", "myapp", "service name")
	flag.Parse()

	logger, err := logging.SetupLogger(*debug)
	if err != nil {
		log.Fatal().Err(err).Msg("Logger setup error")
	}

	svc := NewService(*serviceName)

	ln, err := net.Listen("tcp", *addr)
	if err != nil {
		log.Error().Err(err).Msg("Listen error")
	}
	defer ln.Close()

	log.Info().Str("addr", fmt.Sprintf("http://%s", *addr)).Msg("Server listening")

	handler := logging.HTTPMiddleware(logger)(svc.Handler())
	if err := http.Serve(ln, handler); err != nil {
		log.Error().Err(err).Msg("Server error")
	}
}
