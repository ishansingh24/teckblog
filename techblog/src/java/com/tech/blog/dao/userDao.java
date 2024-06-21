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
            pstmt.setString(3,user.getEmail());
            pstmt.setString(4,user.getPassword());
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
    
    //get user by useremail and userpassword:
    public user getUserByEmail(String email) {
        user user = null;

        try {

            String query = "select * from user where email =?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new user();

//             data from db
                String name = set.getString("name");
//             set to user object
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
    
    public user authenticate(String username, String password) {
        user user = getUserByEmail(username);
        
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        
        return null;
    }

    public boolean updateUser(user user) {

        boolean f = false;
        try {

            String query = "update user set name=? , email=? , password=? , gender=? ,about=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public user getUserByUserId(int userId) {
        user user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new user();

//             data from db
                String name = set.getString("name");
//             set to user object
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
