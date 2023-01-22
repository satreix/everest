package math;

import org.junit.Assert;
import org.junit.Test;

public class NativeMathTest {
    @Test
    public void testNativeMath() {
        Assert.assertEquals(2, NativeMath.increment(1));
        Assert.assertEquals(5, NativeMath.add(2, 3));
    }
}
