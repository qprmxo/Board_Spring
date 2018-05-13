package com.util.page;

import static org.junit.Assert.*;
import org.junit.Test;

public class TestClass {
	@Test
	public void testNull(){
		Calculator cal = new Calculator();
		assertNotNull(cal.add(1, 2)); // cal�� NULL���� �˻�
	}
}
