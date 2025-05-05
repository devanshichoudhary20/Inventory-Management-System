package dao;

import java.sql.*;
import java.util.*;
import model.Customer;
import util.DBConnection;
import model.OrderHistory;

public class CustomerDAO {
    private Connection conn;

    public CustomerDAO(Connection conn) {
        this.conn = conn;
    }

    // Add new customer
    public void addCustomer(Customer customer) {
    String sql = "INSERT INTO customers (name, email, phone, address, shopkeeper_id) VALUES (?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, customer.getName());
        stmt.setString(2, customer.getEmail());
        stmt.setString(3, customer.getPhone());
        stmt.setString(4, customer.getAddress());
        stmt.setInt(5, customer.getShopkeeperId());
        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}



    // Get all customers for a shopkeeper
    public List<Customer> getAllCustomers(int shopkeeperId) {
    List<Customer> list = new ArrayList<>();
    try {
        String sql = "SELECT * FROM customers WHERE shopkeeper_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, shopkeeperId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Customer c = new Customer();
            c.setId(rs.getInt("id")); // ✅ MAKE SURE THIS LINE EXISTS
            c.setName(rs.getString("name"));
            c.setEmail(rs.getString("email"));
            c.setPhone(rs.getString("phone"));
            c.setAddress(rs.getString("address"));
            c.setShopkeeperId(shopkeeperId);
            list.add(c);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}



    // Get a customer by ID
    public Customer getCustomerById(int id) throws SQLException {
    String sql = "SELECT * FROM customers WHERE id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setPhone(rs.getString("phone"));
                c.setAddress(rs.getString("address"));
                c.setShopkeeperId(rs.getInt("shopkeeper_id"));
                return c;
            } else {
                System.out.println("No customer found with ID: " + id);
            }
        }
    }
    return null;
}


    // Update existing customer
    public boolean updateCustomer(Customer customer) {
    String sql = "UPDATE customers SET name = ?, email = ?, phone = ?, address = ? WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, customer.getName());
        stmt.setString(2, customer.getEmail());
        stmt.setString(3, customer.getPhone());
        stmt.setString(4, customer.getAddress());
        stmt.setInt(5, customer.getId());

        int rowsUpdated = stmt.executeUpdate();
        System.out.println("Rows updated: " + rowsUpdated);
        return rowsUpdated > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}


    // Delete customer
    public void deleteCustomer(int id) throws SQLException {
    String sql = "DELETE FROM customers WHERE id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, id);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }

}


    // Get customer order/history list
    public List<OrderHistory> getCustomerOrderHistory(int customerId) throws SQLException {
        List<OrderHistory> orderHistoryList = new ArrayList<>();
        String query = "SELECT * FROM order_history WHERE customer_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderHistory history = new OrderHistory(
                        rs.getInt("id"),
                        rs.getInt("customer_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantity"),
                        rs.getDate("order_date")
                );
                orderHistoryList.add(history);
            }
        }
        return orderHistoryList;
    }
    public void addOrderHistory(int customerId, String productName, int quantity) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO order_history (customer_id, product_name, quantity, order_date) VALUES (?, ?, ?, NOW())";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, customerId);
                stmt.setString(2, productName);
                stmt.setInt(3, quantity);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


