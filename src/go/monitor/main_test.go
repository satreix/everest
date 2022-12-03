package main

import (
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"

	promclt "github.com/prometheus/client_model/go"
	"github.com/prometheus/common/expfmt"
)

func TestVisitTotal(t *testing.T) {
	s := NewService("foobar")

	request, err := http.NewRequest(http.MethodGet, "/metrics", nil)
	if err != nil {
		t.Fatal("creating request:", err)
	}

	const expected = 1

	response := httptest.NewRecorder()
	s.Handler().ServeHTTP(response, request)

	actual, err := parseMetricCounter(response.Body, "foobar_visit_total")
	if err != nil {
		t.Fatalf("parsing metrics: %v", err)
	}
	if actual != float64(expected) {
		t.Fatalf("expected %v got %v", expected, actual)
	}
}

func parseMetricCounter(in io.Reader, key string) (float64, error) {
	var parser expfmt.TextParser
	mf, err := parser.TextToMetricFamilies(in)
	if err != nil {
		return 0.0, fmt.Errorf("parsing response: %w", err)
	}

	value := mf[key]

	if value.Type.String() != promclt.MetricType_COUNTER.String() {
		return 0.0, fmt.Errorf("expected a counter for metric '%v'", key)
	}

	if len(value.Metric) != 1 {
		return 0.0, fmt.Errorf("expected a single value for metric '%v'", key)
	}

	if value.Metric[0].Counter.Value == nil {
		return 0.0, fmt.Errorf("nil value")
	}

	return *value.Metric[0].Counter.Value, nil
}
