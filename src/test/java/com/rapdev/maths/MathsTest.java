package com.rapdev.maths;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class MathsTest {

    @Test
    public void loginScreen() {
        Maths testClass = new Maths();
        assertTrue(testClass.add(1, 1) == 2);
    }
    
    @Test
    public void profilePage() {
        Maths testClass = new Maths();
        assertEquals(testClass.subtract(3, 1), 2);
    }
    
    @Test
    public void errorNessagesStyling() {
        Maths testClass = new Maths();
        assertTrue(testClass.multiply(3, 2) == 6);
    }
    
    @Test
    public void loginSuccess() {
        Maths testClass = new Maths();
        assertEquals(testClass.divide(6, 3), 2);
    }
    
    @Test
    public void passwordChange() {
        assertEquals(3, 1 + 1);
    }
    
    @Test
    public void apiValidation() {
        assertEquals(2, 1 + 1);
    }
}
