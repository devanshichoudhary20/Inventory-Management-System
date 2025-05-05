package dao;

import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;

public class ProductDAO {
    private Connection conn;

    // Constructor now accepts a Connection object
    public ProductDAO(Connection conn) {
        this.conn = conn;
    }

    // Get products by shopkeeper ID
    public List<Product> getProductsByShopkeeperId(int shopkeeperId) throws SQLException {
    List<Product> list = new ArrayList<>();
    String sql = "SELECT * FROM products WHERE shopkeeper_id = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, shopkeeperId);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setQuantity(rs.getInt("quantity"));
            p.setPrice(rs.getDouble("price"));
            // Set other fields if needed
            list.add(p);
        }
    }
    return list;
}


    // Add product
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products (name, description, quantity, price, manufacture_date, receive_date, supplier, shopkeeper_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setInt(3, product.getQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getManufactureDate());
            ps.setString(6, product.getReceiveDate());
            ps.setString(7, product.getSupplier());
            ps.setInt(8, product.getShopkeeperId());

            int i = ps.executeUpdate();
            return i == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update product
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET name=?, description=?, quantity=?, price=?, manufacture_date=?, receive_date=?, supplier=? WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setInt(3, product.getQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getManufactureDate());
            ps.setString(6, product.getReceiveDate());
            ps.setString(7, product.getSupplier());
            ps.setInt(8, product.getId());
            

            int i = ps.executeUpdate();
            return i == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete product
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            return i == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all products (for view all)
    public List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products"; // Modify based on your query requirements
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getDouble("price"));
        
                product.setSupplier(rs.getString("supplier"));
                product.setShopkeeperId(rs.getInt("shopkeeper_id"));

                productList.add(product);
            }
        }
        return productList;
    }


    // Get product by ID (for editing)
    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT * FROM products WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = extractProductFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    // Helper method to extract product from ResultSet
    private Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        return new Product(
            rs.getInt("id"),
            rs.getString("name"),
            rs.getString("description"),
            rs.getInt("quantity"),
            rs.getDouble("price"),
            rs.getString("manufacture_date"),
            rs.getString("receive_date"),
            rs.getString("supplier"),
            rs.getInt("shopkeeper_id")
        );
    }

    // Search by name for logged-in shopkeeper
    public List<Product> searchProductByName(String keyword, int shopkeeperId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ? AND shopkeeper_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, shopkeeperId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = extractProductFromResultSet(rs);
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    // Get low stock products (quantity less than threshold)
public List<Product> getLowStockProducts(int shopkeeperId, int threshold) {
    List<Product> lowStock = new ArrayList<>();
    String sql = "SELECT * FROM products WHERE quantity < ? AND shopkeeper_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, threshold);
        ps.setInt(2, shopkeeperId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product product = extractProductFromResultSet(rs);
            lowStock.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return lowStock;
}

}
