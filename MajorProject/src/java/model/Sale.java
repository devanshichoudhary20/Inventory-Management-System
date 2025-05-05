package model;

import java.sql.Date;

public class Sale {
    private int id;
    private int productId;
    private int quantitySold;
    private double sellingPrice;
    private Date date;            // Use java.sql.Date for database date
    private int shopkeeperId;

    // Default constructor
    public Sale() {}

    // Constructor with all fields
    public Sale(int id, int productId, int quantitySold, double sellingPrice, Date date, int shopkeeperId) {
        this.id = id;
        this.productId = productId;
        this.quantitySold = quantitySold;
        this.sellingPrice = sellingPrice;
        this.date = date;
        this.shopkeeperId = shopkeeperId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getShopkeeperId() {
        return shopkeeperId;
    }

    public void setShopkeeperId(int shopkeeperId) {
        this.shopkeeperId = shopkeeperId;
    }

    // Optional: ToString method for easy printing
    @Override
    public String toString() {
        return "Sale{" +
                "id=" + id +
                ", productId=" + productId +
                ", quantitySold=" + quantitySold +
                ", sellingPrice=" + sellingPrice +
                ", date=" + date +
                ", shopkeeperId=" + shopkeeperId +
                '}';
    }
}
