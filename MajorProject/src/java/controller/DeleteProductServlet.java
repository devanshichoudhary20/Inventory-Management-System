package controller;

import dao.ProductDAO;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.annotation.WebServlet;
@WebServlet("/deleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection con = DBConnection.getConnection();
            ProductDAO dao = new ProductDAO(con);

            if (dao.deleteProduct(id)) {
                response.sendRedirect("edit_delete_product.jsp?deleted=1");
            } else {
                response.sendRedirect("edit_delete_product.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit_delete_product.jsp?error=1");
        }
    }
}
