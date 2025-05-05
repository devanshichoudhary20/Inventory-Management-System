package controller;

import dao.ProductDAO;
import model.Product;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/searchProduct") // Must match form action
public class SearchProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String keyword = request.getParameter("name");
            HttpSession session = request.getSession();
            Integer shopkeeperId = (Integer) session.getAttribute("userId");

            if (shopkeeperId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Connection con = DBConnection.getConnection();
            ProductDAO dao = new ProductDAO(con);

            List<Product> productList = dao.searchProductByName(keyword, shopkeeperId);
            request.setAttribute("products", productList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("search_products.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp");
        }
    }
}
