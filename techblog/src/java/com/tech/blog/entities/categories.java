/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author gauta
 */
public class categories {
    private int cid;
    private String name;
    private String discription;

    public categories(int cid, String name, String discription) {
        this.cid = cid;
        this.name = name;
        this.discription = discription;
    }

    public categories(String name, String discription) {
        this.name = name;
        this.discription = discription;
    }

    public categories() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

}
