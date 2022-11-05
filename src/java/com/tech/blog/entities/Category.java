/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;
/**
 *
 * @author Nishant Singh
 */
public class Category {
    
    private int cId;
    private String cName;
    private String cDescription;

    public Category(int cId, String cName, String cDescription) {
        this.cId = cId;
        this.cName = cName;
        this.cDescription = cDescription;
    }

    public Category(String cName, String cDescription) {
        this.cName = cName;
        this.cDescription = cDescription;
    }

    public Category() {
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDescription() {
        return cDescription;
    }

    public void setcDescription(String cDescription) {
        this.cDescription = cDescription;
    }
   
}
