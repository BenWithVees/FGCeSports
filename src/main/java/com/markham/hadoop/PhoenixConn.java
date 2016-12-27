package com.markham.hadoop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class PhoenixConn {

	// Phoenix connection example for later
	public static void main(String args[]) throws Exception {
		Class.forName("org.apache.phoenix.jdbc.PhoenixDriver");

		Connection conn = DriverManager.getConnection("jdbc:phoenix:192.168.217.138:2181:/hbase-unsecure");

		System.out.println("got connection");
		conn.close();
		ResultSet rst = conn.createStatement().executeQuery("list tables");
		while (rst.next()) {
			System.out.println(rst.getString(1) + " " + rst.getString(2));
		}
		
		conn.commit();
	}
}
