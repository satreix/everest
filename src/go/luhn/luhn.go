package luhn

func Check(n int64) bool {
	var digits []int
	for n > 0 {
		digits = append([]int{int(n % 10)}, digits...)
		n /= 10
	}

	var checksum int
	for i, d := range digits {
		if i%2 == len(digits)%2 {
			d *= 2
			if d > 9 {
				d -= 9
			}
		}
		checksum += d
	}

	return checksum%10 == 0
}
