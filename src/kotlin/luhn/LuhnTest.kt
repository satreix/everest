package luhn

import org.junit.Assert
import org.junit.Test

class LuhnTest {
    @Test
    fun testValidNumber() {
        Assert.assertTrue(check(4111111111111111))
    }

    @Test
    fun testInvalidNumber() {
        Assert.assertFalse(check(4111111111111112))
    }
}
