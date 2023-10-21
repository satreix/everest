package luhn;

import org.junit.Assert;
import org.junit.Test;

public class LuhnAlgorithmTest {
    @Test
    public void testValidNumber() {
        Assert.assertTrue(LuhnAlgorithm.check(4111111111111111L));
    }

    @Test
    public void testInvalidNumber() {
        Assert.assertFalse(LuhnAlgorithm.check(4111111111111112L));
    }
}
