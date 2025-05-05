package dao;

import model.Stock;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StockDAO {

    public List<Stock> getAllStock() {
        List<Stock> stockList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM stock");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Stock s = new Stock();
                s.setProductId(rs.getInt("product_id"));
                s.setProductName(rs.getString("product_name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPurchasePrice(rs.getDouble("purchase_price"));
                s.setSellingPrice(rs.getDouble("selling_price"));
                s.setLastUpdated(rs.getString("last_updated"));
                stockList.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stockList;
    }

    public Stock getStockById(int productId) {
        Stock s = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM stock WHERE product_id = ?")) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                s = new Stock();
                s.setProductId(rs.getInt("product_id"));
                s.setProductName(rs.getString("product_name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPurchasePrice(rs.getDouble("purchase_price"));
                s.setSellingPrice(rs.getDouble("selling_price"));
                s.setLastUpdated(rs.getString("last_updated"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }

    public boolean updateStockQuantity(int productId, int newQuantity) {
        boolean updated = false;
        String query = "UPDATE stock SET quantity = ?, last_updated = CURRENT_TIMESTAMP WHERE product_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, newQuantity);
            stmt.setInt(2, productId);
            updated = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

    public boolean insertStock(Stock s) {
        String sql = "INSERT INTO stock (product_id, product_name, quantity, purchase_price, selling_price, last_updated) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, s.getProductId());
            stmt.setString(2, s.getProductName());
            stmt.setInt(3, s.getQuantity());
            stmt.setDouble(4, s.getPurchasePrice());
            stmt.setDouble(5, s.getSellingPrice());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
