package controller;

import dao.ProductDAO;
import model.Product;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // ✅ Validate session
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("userId") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // ✅ Read form data
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String manufactureDate = request.getParameter("manufacture_date");
            String receiveDate = request.getParameter("receive_date");
            String supplier = request.getParameter("supplier");

            // ✅ Get shopkeeper ID from session
            int shopkeeperId = (int) session.getAttribute("userId");

            // ✅ Create product object
            Product product = new Product(0, name, description, quantity, price, manufactureDate, receiveDate, supplier, shopkeeperId);

            // ✅ Save product using DAO
            Connection con = DBConnection.getConnection();
            ProductDAO dao = new ProductDAO(con);

            if (dao.addProduct(product)) {
                response.sendRedirect("add_product.jsp?success=1");
            } else {
                response.sendRedirect("add_product.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();  // optional: log to file for production
            response.sendRedirect("add_product.jsp?error=1");
        }
    }
}
