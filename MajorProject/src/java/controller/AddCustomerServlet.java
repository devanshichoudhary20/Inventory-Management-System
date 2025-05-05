package controller;

import dao.CustomerDAO;
import model.Customer;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shopkeeperId = (int) request.getSession().getAttribute("userId");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setPhone(phone);
        customer.setAddress(address);
        customer.setShopkeeperId(shopkeeperId);

        try {
            Connection conn = DBConnection.getConnection();
            CustomerDAO dao = new CustomerDAO(conn);
            dao.addCustomer(customer);
            request.setAttribute("message", "Customer added successfully!");
            request.getRequestDispatcher("addCustomerSuccess.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: Customer could not be added.");
            request.getRequestDispatcher("addCustomerSuccess.jsp").forward(request, response);
        }
    }
}
