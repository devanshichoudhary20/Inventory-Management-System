package controller;

import dao.CustomerDAO;
import model.Customer;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/viewCustomers")
public class ViewCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); // user not logged in
            return;
        }

        int shopkeeperId = (int) session.getAttribute("userId");

        try {
            Connection conn = DBConnection.getConnection();
            CustomerDAO dao = new CustomerDAO(conn);
            List<Customer> customers = dao.getAllCustomers(shopkeeperId);
            request.setAttribute("customers", customers);
            RequestDispatcher rd = request.getRequestDispatcher("viewCustomer.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch customers.");
        }
    }
}
