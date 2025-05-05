package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Attempting login for email: " + email);

        UserDAO userDAO = new UserDAO();

        try {
            User user = userDAO.validateUser(email, password);

            if (user != null) {
                System.out.println("Login successful for: " + user.getEmail());

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getId());

                response.sendRedirect("dashboard.jsp"); // ✅ REDIRECT TO DASHBOARD
            } else {
                System.out.println("Login failed. Redirecting back to login page.");
                response.sendRedirect("login.jsp?error=true"); // 🚫 Wrong credentials
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp"); // Optional: handle GET request
    }
}
