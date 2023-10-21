pub fn check(n: u64) -> bool {
    let digits: Vec<u32> = n
        .to_string()
        .chars()
        .map(|d| d.to_digit(10).unwrap())
        .collect();

    let mut checksum = 0;

    for i in 0..digits.len() {
        let d = digits[i];
        if i % 2 == digits.len() % 2 {
            let digit = if d * 2 > 9 { d * 2 - 9 } else { d * 2 };
            checksum += digit;
        } else {
            checksum += d;
        }
    }

    checksum % 10 == 0
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_valid_number() {
        assert_eq!(check(4111111111111111), true);
    }

    #[test]
    fn test_invalid_number() {
        assert_eq!(check(4111111111111112), false);
    }
}
