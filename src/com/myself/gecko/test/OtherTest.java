package com.myself.gecko.test;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.myself.gecko.util.C3P0Utils;

public class OtherTest {

	@Test
	public void test() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());

		String sql = "select id from answer where uid = 2";
        Object[] s = queryRunner.query(sql, new ArrayHandler());
        System.out.println(s.length);
        System.out.println(Arrays.toString(s));
	}
	
	@Test
	public void test2() {
		List<String> list = null;
		for (String string : list) {
			System.out.println(string);
			
		}
	}
	
	@Test
	public void test3() {
	    Date date = new Date();
	    date.setHours(0);
	    date.setMinutes(0);
	    date.setSeconds(0);
	    System.out.println(date.toLocaleString());
	}

}
