package controller;

import dao.CustomerDAO;
import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/deleteCustomer")
public class DeleteCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        System.out.println("Deleting customer with ID: " + idParam);

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is missing.");
            return;
        }

        try {
            int id = Integer.parseInt(idParam.trim());
            Connection conn = DBConnection.getConnection();
            CustomerDAO dao = new CustomerDAO(conn);
            dao.deleteCustomer(id);
            response.sendRedirect("editDeleteCustomer.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Customer ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error occurred.");
        }
    }
}
