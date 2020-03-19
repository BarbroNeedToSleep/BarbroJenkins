import org.junit.Test;

import static org.junit.Assert.*;

public class FooTest {

    @Test
    public void myDeath() {
        Foo myFoo = new Foo();
        assertTrue(myFoo.MyDeath());
    }
}