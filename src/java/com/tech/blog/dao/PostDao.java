/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author Nishant Singh
 */
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
     
    public ArrayList<Category> getAllCategories(){
        
        ArrayList<Category> list=new ArrayList<>();
        
        try {
            
             String q="select * from categories";
             Statement st=this.con.createStatement();
             ResultSet set=st.executeQuery(q);
             
             while(set.next()){
                 
                 int cid=set.getInt("cid");
                 String name=set.getString("cname");
                 String desc=set.getString("cdescription");
                 Category c=new Category(cid, name, desc);
                 list.add(c);
                 
                 
             }
             
             
             
        } catch (Exception e) {
         
            e.printStackTrace();
        }
        return list; 
    }
    
    
    // Function for saving the Post 
    
    public boolean savePost(Post p){
        
        boolean f=false;
        try {
            
            String q="insert into post(pTittle, pContent ,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1, p.getpTittle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f=true;
            
            
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
        
        
    }
    
    //fetch all the post
    
    public List<Post> getAllPost(){
        List<Post> list=new ArrayList<>();
        
        try {
            
            PreparedStatement p=con.prepareStatement("select * from post");
            ResultSet set=p.executeQuery();
            while(set.next()){
                
                int pid=set.getInt("pId");
                String pTittle=set.getString("pTittle");
                String pCotent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userid=set.getInt("userid");
                 
                Post post=new Post(pid, pTittle, pCotent, pCode, pPic, date, catId, userid);
                
                list.add(post);
                
                
                
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    //fetch all the post by ID
      
    public List<Post> getAllPostbyCatId(int catId){
        List<Post> list=new ArrayList<>();
        try {
              PreparedStatement p=con.prepareStatement("select * from post where catId=?");
              p.setInt(1, catId);
              ResultSet set=p.executeQuery();
  
            while(set.next()){      
                int pid=set.getInt("pId");
                String pTittle=set.getString("pTittle");
                String pCotent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
             
                int userid=set.getInt("userid");
                 
                Post post=new Post(pid, pTittle, pCotent, pCode, pPic, date, catId, userid);
                
                list.add(post);
                
                
                
            }
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        
        return list;
        
    }
    
    
    //fetch single post  by post ID
    public Post getpostbypostId(int postId){
        Post post=null;
        
       String q="select * from post where pId=?";
        try {
        
            
            PreparedStatement p=this.con.prepareStatement(q);
             p.setInt(1, postId);
  
             ResultSet set=p.executeQuery();
             
             if (set.next()) {
                
                int pid=set.getInt("pId");
                String pTittle=set.getString("pTittle");
                String pCotent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
             
                int userid=set.getInt("userid");
                int catId=set.getInt("catId");
                   
                post=new Post(pid, pTittle, pCotent, pCode, pPic, date, catId, userid);
                
                
            }
  
            
            
           
        } catch (Exception e) {            
            e.printStackTrace();
        }
    return post;
    
        
        
    }
    
    
  
    
}
