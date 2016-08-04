package com.markham.FGCeSports;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.imageio.ImageIO;

public class AppTest {
	public static void main(String[] args) throws SQLException, ClassNotFoundException, IOException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://xiilab.mynetgear.com:1106/test", "root",
				"xii1lab2");

		PreparedStatement ps;
		BufferedImage originalImage = ImageIO.read(new File("/Users/ben//Downloads/1417949689-sfv-logo-r.png"));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(originalImage, "png", baos);
		baos.flush();
		byte[] imageInByte = baos.toByteArray();
		ps = conn.prepareStatement("INSERT INTO thumbnail (picture, name) VALUES (?, ?)");
		ps.setBytes(1, imageInByte);
		ps.setString(2, "Street Figther");
		ps.executeUpdate();
		conn.close();
		System.out.println("Done");
	}
}
