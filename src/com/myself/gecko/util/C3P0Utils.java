package com.myself.gecko.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Utils {

	static ComboPooledDataSource ds = new ComboPooledDataSource();

	// 获得数据源
	public static DataSource getDataSource() {
		return ds;
	}

	// 获取连接
	public static Connection getConnection() throws SQLException {
		Connection connection = ds.getConnection();
		return connection;
	}



}
