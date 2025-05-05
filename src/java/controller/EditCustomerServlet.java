package controller;

import dao.CustomerDAO;
import model.Customer;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/editCustomer")
public class EditCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            HttpSession session = request.getSession();
            int shopkeeperId = (int) session.getAttribute("userId");

            Customer customer = new Customer();
            customer.setId(id);
            customer.setName(name);
            customer.setEmail(email);
            customer.setPhone(phone);
            customer.setAddress(address);
            customer.setShopkeeperId(shopkeeperId);

            Connection conn = DBConnection.getConnection();
            CustomerDAO dao = new CustomerDAO(conn);
            dao.updateCustomer(customer);
            response.sendRedirect("editDeleteCustomer.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating customer: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET not supported. Use POST to update customer.");
    }
}
