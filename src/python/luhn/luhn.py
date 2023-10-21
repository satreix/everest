def check(n):
    digits = [int(x) for x in str(n)]
    checksum = sum(digits[-1::-2] + [sum(divmod(2 * d, 10)) for d in digits[-2::-2]])
    return checksum % 10 == 0
