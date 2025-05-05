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

@WebServlet("/ViewStockServlet")
public class ViewStockServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer shopkeeperId = (Integer) session.getAttribute("shopkeeperId");

        if (shopkeeperId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            ProductDAO dao = new ProductDAO(conn);
            List<Product> productList = dao.getProductsByShopkeeperId(shopkeeperId);
            request.setAttribute("productList", productList);
            RequestDispatcher rd = request.getRequestDispatcher("view_stock.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
