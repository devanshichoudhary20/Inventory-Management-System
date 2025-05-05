package controller;

import dao.CustomerDAO;
import model.OrderHistory;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/viewCustomerHistory")
public class CustomerHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = (int) request.getSession().getAttribute("userId");

        try {
            Connection conn = DBConnection.getConnection();
            CustomerDAO dao = new CustomerDAO(conn);
            List<OrderHistory> historyList = dao.getCustomerOrderHistory(customerId);

            // Check if historyList is null or empty before setting it
            if (historyList == null || historyList.isEmpty()) {
                request.setAttribute("history", new ArrayList<OrderHistory>());
            } else {
                request.setAttribute("history", historyList);
            }

            // Forward to the JSP page
            RequestDispatcher rd = request.getRequestDispatcher("viewCustomerHistory.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching customer history.");
        }
    }
}

