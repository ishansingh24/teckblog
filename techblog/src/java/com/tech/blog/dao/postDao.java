/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.mysql.cj.xdevapi.Statement;
import com.tech.blog.entities.categories;
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
    
    public ArrayList<categories> getcategories()
    {
        ArrayList<categories> categ = new ArrayList<>();
        try{
            
        String query = "select * from categories";
        
        java.sql.Statement st = this.con.createStatement();
        ResultSet set = st.executeQuery(query);
        
        while(set.next())
        {
                categories c = new categories();
                c.setCid(set.getInt("cid"));
                c.setName(set.getString("name"));
                c.setDiscription(set.getString("discription"));
                categ.add(c);
        }
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
       return categ;
    }
}
