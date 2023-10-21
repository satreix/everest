package luhn

fun check(n: Long): Boolean {
    val digits = n.toString().map { it.toString().toInt() }.reversed()
    var checksum = 0
    var even = false

    for (d in digits) {
        val digit = d * if (even) 2 else 1
        checksum += if (digit > 9) digit - 9 else digit
        even = !even
    }

    return checksum % 10 == 0
}
