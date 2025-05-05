package controller;

import dao.ProductDAO;
import model.Product;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

@WebServlet("/ProductReportServlet")
public class ProductReportServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
            ProductDAO productDAO = new ProductDAO(conn);
            List<Product> productList = productDAO.getAllProducts();  // Fetch all products

            // Set response type and headers for downloading Excel
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=products_report.xls");

            PrintWriter out = response.getWriter();
            out.println("ID\tName\tDescription\tQuantity\tPrice\tManufacture Date\tReceive Date\tSupplier");

            // Loop through the products and print them in tab-separated values
            for (Product product : productList) {
                out.println(product.getId() + "\t" +
                            product.getName() + "\t" +
                            product.getDescription() + "\t" +
                            product.getQuantity() + "\t" +
                            product.getPrice() + "\t" +
                           
                            product.getSupplier());
            }

            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error generating report: " + e.getMessage());
        }
    }
}
