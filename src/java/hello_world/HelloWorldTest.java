package hello_world;

import org.junit.Assert;
import org.junit.Test;

public class HelloWorldTest {
    @Test
    public void testGreet() {
        Assert.assertEquals("Hello, World!", HelloWorld.greet("World"));
    }
}
