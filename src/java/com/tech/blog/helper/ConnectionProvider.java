/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Nishant Singh
 */
public class ConnectionProvider {
    
    public static Connection con;
    public static Connection getConnection(){
		
		try {
                        //Load the driver
			Class.forName("com.mysql.jdbc.Driver");
			String user="root";
			String password="root";
			String url="jdbc:mysql://localhost:3306/technicalblog";
                        con=DriverManager.getConnection(url,user,password);
 	
                        
		} catch (Exception e) {
 			e.printStackTrace();
		}
		return con;
		
	}

}
