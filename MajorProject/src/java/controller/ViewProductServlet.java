package controller;

import dao.ProductDAO;
import model.Product;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import util.DBConnection;

@WebServlet("/ViewProductServlet")
public class ViewProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the existing session; do not create a new one if it doesn't exist
        HttpSession session = request.getSession(false);

        // If no session or no shopkeeper ID, redirect to login page
        if (session == null || session.getAttribute("shopkeeperId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get shopkeeper ID from session
            int shopkeeperId = (int) session.getAttribute("shopkeeperId");

            // Get a valid connection from DBConnection
            Connection conn = DBConnection.getConnection(); // Get connection

            // Pass the connection to ProductDAO
            ProductDAO productDAO = new ProductDAO(conn);
            List<Product> products = productDAO.getProductsByShopkeeperId(shopkeeperId);

            // Check if products list is null or empty
            if (products == null || products.isEmpty()) {
                request.setAttribute("noProducts", "No Products Available");
            } else {
                request.setAttribute("productList", products);  // Set product list in request scope
            }

            // Forward to view_product.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("view_product.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Optional: redirect to error page
        }
    }
}
