package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

const tag = "myapp"

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
func NewService() Service {
	return Service{
		metrics: newServiceMetrics(tag),
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
	flag.Parse()

	service := NewService()

	serv := http.Server{
		Addr:    *addr,
		Handler: service.Handler(),
	}

	log.Printf("Listenning on http://%s", *addr)
	log.Fatal(serv.ListenAndServe())
}
