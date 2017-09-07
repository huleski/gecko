package com.myself.gecko.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ConnectionManager {
	private static ThreadLocal<Connection> t = new ThreadLocal<>();
	
	private ConnectionManager() {
	}
	
	public static Connection getConnectionByThreadLocal() throws SQLException {
		Connection connection = t.get();
		if(connection == null) {
			connection = new ComboPooledDataSource().getConnection();
		}
		t.set(connection);
		return connection;
	}
}
