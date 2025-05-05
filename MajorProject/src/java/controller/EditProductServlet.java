package controller;

import dao.ProductDAO;
import model.Product;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class EditProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String manufactureDate = request.getParameter("manufacture_date");
            String receiveDate = request.getParameter("receive_date");
            String supplier = request.getParameter("supplier");

            Product product = new Product(id, name, description, quantity, price, manufactureDate, receiveDate, supplier, 0);

            Connection con = DBConnection.getConnection();
            ProductDAO dao = new ProductDAO(con);

            if (dao.updateProduct(product)) {
                response.sendRedirect("edit_delete_product.jsp?updated=1");
            } else {
                response.sendRedirect("edit_delete_product.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit_delete_product.jsp?error=1");
        }
    }
}
