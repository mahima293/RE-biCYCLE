/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage_entities;


public class Product {
    private int id;
    private String title;
    private String color;
    private int price;
    private String purchase_date;
    private String description;
    private String image;
    public Product(){
        
    }
    public Product(int id,String title,String color,int price,String purchase_date,String description,String image){
        this.id=id;
        this.title=title;
        this.color=color;
        this.price=price;
        this.purchase_date=purchase_date;
        this.description=description;
        this.image=image;
    }
    public void setId(int id){
    this.id=id;
    }
    public void setTitle(String title){
    this.title=title;
    } 
    public void setColor(String color){
    this.color=color;
    } 
    public void setPrice(int price){
    this.price=price;
    } 
    public void setPurchase_date(String purchase_date){
    this.purchase_date=purchase_date;
    } 
    public void setDescription(String description){
    this.description=description;
    } 
    public void setImage(String image){
    this.image=image;
    } 
    public int getId(){
    return id;
    }
    public String getTitle(){
    return title;
    } 
    public String getColor(){
    return color;
    } 
    public int getPrice(){
    return price;
    } 
    public String getPurchase_date(){
    return purchase_date;
    } 
    public String getDescription(){
    return description;
    } 
    public String getImage(){
    return image;
    } 
}
