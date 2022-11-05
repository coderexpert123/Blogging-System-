/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
 import java.sql.*;

/**
 *
 * @author Nishant Singh
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //function for saving the user;
    public boolean saveUser(User user){
        boolean f=false;
        try {
            //Query to store the value into the db
            
            String Query="insert into user_tables(name,email,password,gender,about) values(? ,? , ? ,? ,?)";
            PreparedStatement pstmt=this.con.prepareStatement(Query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            f=true;
            
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
         return f;
    }
    //function for Fetching the user from DB;
    
    public User getUserByEMailId(String email,String password){
        
    User user=null;
    
        try {
            
            
            String query="select * from user_tables where email =? and password=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
           
            ResultSet set=pstmt.executeQuery();
            if (set.next()) {
                user=new User();
                String name=set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                
                
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        return user;
        
    
    }
    

    
    
    
    //function for update the Profile 
    
    public boolean userUpdate(User user){
      boolean f=false;
      
        try {
            
            String query="update user_tables set name=? , email=? , password=? ,gender=? ,about=? , profile=? where id=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            p.executeUpdate();
            f=true;
            
            
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        return f;
        
        
    }
   
    public User getUserByPostId(int userid){
        User user=null;
        String q="select * from user_tables where id=?";
        
        try {
             
             PreparedStatement p=this.con.prepareStatement(q);
             p.setInt(1, userid);
  
             ResultSet set=p.executeQuery();
             if (set.next()) {
             
                user=new User();
                String name=set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
        
        
    }
}
