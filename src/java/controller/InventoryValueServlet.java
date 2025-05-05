/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import util.DBConnection;

/**
 *
 * @author Devanshi
 */
@WebServlet("/InventoryValueServlet")
public class InventoryValueServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer shopkeeperId = (Integer) session.getAttribute("shopkeeperId");

        if (shopkeeperId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            ProductDAO productDAO = new ProductDAO(conn);
            List<Product> products = productDAO.getProductsByShopkeeperId(shopkeeperId);

            double totalValue = 0;
            for (Product p : products) {
                totalValue += p.getQuantity() * p.getPrice();
            }

            request.setAttribute("products", products);
            request.setAttribute("totalValue", totalValue);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inventoryValue.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
