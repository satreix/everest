package luhn

import "testing"

func TestCheck(t *testing.T) {
	valid := Check(4111111111111111)
	if !valid {
		t.Errorf("Expected 4111111111111111 to be valid, but got invalid")
	}

	invalid := Check(4111111111111112)
	if invalid {
		t.Errorf("Expected 4111111111111112 to be invalid, but got valid")
	}
}
