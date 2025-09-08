package test.java.com.example;
import org.junit.Test;

import main.java.com.example.HelloWorld;

import static org.junit.Assert.*;

public class HelloWorldTest {
    @Test
    public void testGreet() {
        assertEquals("Hello, World!", HelloWorld.greet("World"));
        assertEquals("Hello, Alice!", HelloWorld.greet("Alice"));
    }
}
