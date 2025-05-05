package model;

import java.sql.Date;

public class OrderHistory {
    private int id;
    private int customerId;
    private String productName;
    private int quantity;
    private Date orderDate;

    // Constructor
    public OrderHistory(int id, int customerId, String productName, int quantity, Date orderDate) {
        this.id = id;
        this.customerId = customerId;
        this.productName = productName;
        this.quantity = quantity;
        this.orderDate = orderDate;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
