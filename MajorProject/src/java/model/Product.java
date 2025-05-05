/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Devanshi
 */
public class Product {
    

    private int id;
    private String name;
    private String description;
    private int quantity;
    private double price;
    private String manufactureDate;
    private String receiveDate;
    private String supplier;
    private int shopkeeperId;
    private double sellingPrice;

    // Constructors
    public Product() {}

    public Product(int id, String name, String description, int quantity, double price,
                   String manufactureDate, String receiveDate, String supplier, int shopkeeperId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.manufactureDate = manufactureDate;
        this.receiveDate = receiveDate;
        this.supplier = supplier;
        this.shopkeeperId = shopkeeperId;
        this.sellingPrice = sellingPrice;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getManufactureDate() {
        return manufactureDate;
    }

    public void setManufactureDate(String manufactureDate) {
        this.manufactureDate = manufactureDate;
    }

    public String getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(String receiveDate) {
        this.receiveDate = receiveDate;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public int getShopkeeperId() {
        return shopkeeperId;
    }

    public void setShopkeeperId(int shopkeeperId) {
        this.shopkeeperId = shopkeeperId;
    }
    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    // Optional: toString() method for debugging
    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", description=" + description +
               ", quantity=" + quantity + ", price=" + price + ", manufactureDate=" + manufactureDate +
               ", receiveDate=" + receiveDate + ", supplier=" + supplier + ", shopkeeperId=" + shopkeeperId + "]";
    }

    
}
