package main

import (
	"flag"
	"log"
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

// serviceMetrics holds metrics for a service
type serviceMetrics struct {
	VisitTotal prometheus.Counter
}

// newServiceMetrics registers metrics
func newServiceMetrics() serviceMetrics {
	return serviceMetrics{
		VisitTotal: promauto.NewCounter(prometheus.CounterOpts{
			Name: "myapp_visit_total",
			Help: "The total number of visits",
		}),
	}
}

// Service of the app
type Service struct {
	metrics serviceMetrics
}

// NewService returns a new service.
func NewService() Service {
	return Service{
		metrics: newServiceMetrics(),
	}
}

// Handler return a HTTP handler for the service.
func (s Service) Handler() http.Handler {
	mux := http.NewServeMux()
	mux.Handle("/metrics", promhttp.Handler())
	return s.middleware(mux)
}

// middleware to log and record metrics
func (s Service) middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Println(r.Method, r.RequestURI)
		s.metrics.VisitTotal.Inc()
		next.ServeHTTP(w, r)
	})
}

func main() {
	addr := flag.String("addr", "127.0.0.1:1234", "address")
	flag.Parse()

	service := NewService()

	serv := http.Server{
		Addr:    *addr,
		Handler: service.Handler(),
	}

	log.Printf("Listenning on %s", *addr)
	log.Fatal(serv.ListenAndServe())
}
