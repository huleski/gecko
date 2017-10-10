package com.myself.gecko.test;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.myself.gecko.util.C3P0Utils;

public class Test {

	@org.junit.Test
	public void test() {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());

		String sql = "sb";
		StringBuilder sb = new StringBuilder(sql);
		sb.append("1");
		sb.append("2");
	}

}
