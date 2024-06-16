/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.user;
import java.sql.*;

/**
 *
 * @author gauta
 */
public class userDao {
    private Connection con;

    public userDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user in database

    /**
     *
     * @return boolean
     */
    
    public boolean saveUser(user user)
    {
        boolean f = false;
        try{
            String query = "insert into user(id,name,email,password,gender,about) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1,user.getId());
            pstmt.setString(2,user.getName());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getEmail());
            pstmt.setString(5,user.getGender());
            pstmt.setString(6,user.getAbout());
            
            pstmt.execute();
            f= true;
        }
        catch(Exception e){
           e.printStackTrace();
        }
        return f;
    }
    
}
