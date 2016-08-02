package com.markham.hadoop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class PhoenixConn {
	
	//Phoenix connection example for later
	public static void main(String args[]) throws Exception {
		Class.forName("org.apache.phoenix.jdbc.PhoenixDriver");

		Connection conn = DriverManager.getConnection("jdbc:phoenix:1.215.236.28:2181:/hbase-unsecure");

		System.out.println("got connection");
		ResultSet rst = conn.createStatement().executeQuery("select * from stock_symbol");
		while (rst.next()) {
			System.out.println(rst.getString(1) + " " + rst.getString(2));
		}
		System.out.println(conn.createStatement().executeUpdate("delete from stock_symbol"));
		conn.commit();
		rst = conn.createStatement().executeQuery("select * from stock_symbol");
		while (rst.next()) {
			System.out.println(rst.getString(1) + " " + rst.getString(2));
		}
		System.out.println(conn.createStatement()
				.executeUpdate("upsert into stock_symbol values('IBM','International Business Machines')"));
		conn.commit();
	}
}
