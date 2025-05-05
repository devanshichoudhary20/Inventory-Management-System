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
import java.util.*;

@WebServlet("/DownloadExcelServlet")
public class DownloadExcelServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type for Excel file
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=inventory_report.xls");

        try (Connection conn = DBConnection.getConnection()) {
            ProductDAO productDAO = new ProductDAO(conn);
            List<Product> productList = productDAO.getAllProducts();  // Fetch all products from the database

            // Get PrintWriter to write the Excel content
            PrintWriter out = response.getWriter();

            // Write the header row for the Excel file
            out.println("ID\tProduct Name\tDescription\tQuantity\tPrice\tManufacture Date\tReceive Date\tSupplier\tShopkeeper ID");

            // Loop through product list and write each product to the Excel file
            for (Product product : productList) {
                out.println(product.getId() + "\t" +
                            product.getName() + "\t" +
                            product.getDescription() + "\t" +
                            product.getQuantity() + "\t" +
                            product.getPrice() + "\t" +
                            product.getManufactureDate() + "\t" +
                            product.getReceiveDate() + "\t" +
                            product.getSupplier() + "\t" +
                            product.getShopkeeperId());
            }

            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error generating report: " + e.getMessage());
        }
    }
}
