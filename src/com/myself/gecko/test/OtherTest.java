package com.myself.gecko.test;

import java.util.ArrayList;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import com.myself.gecko.util.C3P0Utils;

public class OtherTest {

	@Test
	public void test() {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());

		String sql = "sb";
		StringBuilder sb = new StringBuilder(sql);
		sb.append("1");
		sb.append("2");
	}
	
	@Test
	public void test2() {
		ArrayList<String> list = null;
		for (String string : list) {
			System.out.println(string);
			
		}
	}

}
