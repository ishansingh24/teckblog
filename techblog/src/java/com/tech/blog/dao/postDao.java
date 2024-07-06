/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.categories;
import com.tech.blog.entities.posts;
import com.tech.blog.entities.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gauta
 */
public class postDao {

    private Connection con;

    public postDao(Connection con) {
        this.con = con;
    }

    public ArrayList<categories> getcategories() {
        ArrayList<categories> categ = new ArrayList<>();
        try {

            String query = "select * from categories";

            java.sql.Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);

            while (set.next()) {
                categories c = new categories();
                c.setCid(set.getInt("cid"));
                c.setName(set.getString("name"));
                c.setDiscription(set.getString("discription"));
                categ.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categ;
    }

    public boolean savePost(posts p) {
        boolean f = false;
        try {
            
            String query = "insert into posts (pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt= con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f= true;
        } 
        catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public ArrayList<posts> getAllPosts()
    {
        ArrayList<posts> data = new ArrayList<>();
        try{
            String query = "select * from posts";

            PreparedStatement st = this.con.prepareStatement(query);
            ResultSet set = st.executeQuery();

            while (set.next()) {
                
                
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                java.sql.Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int uId = set.getInt("userId");
                
                posts c = new posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, uId);
                data.add(c);
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return data;
    }
    public ArrayList<posts> getPostsByCatid(int catId)
    {
        ArrayList<posts> d = new ArrayList<>();
        try{
            String query = "select * from posts where catId = ?";

            PreparedStatement st = this.con.prepareStatement(query);
            st.setInt(1, catId);
            ResultSet set = st.executeQuery();

            while (set.next()) {
                
                
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                java.sql.Timestamp pDate = set.getTimestamp("pDate");
                int uId = set.getInt("userId");
                
                posts c = new posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, uId);
                d.add(c);
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return d;
    }
    
    public posts getPostByPostId(int postId)
    {   
        posts p = null;
        try{
            String query = "select * from Posts where pid = ?";  
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                java.sql.Timestamp pDate = set.getTimestamp("pDate");
                int uId = set.getInt("userId");
                int catId = set.getInt("catId");
                
                p = new posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, uId);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return p;
    }
}
