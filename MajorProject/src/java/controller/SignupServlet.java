package controller;

import dao.UserDAO;
import model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(fullName, email, password);
        UserDAO userDAO = new UserDAO();

        // Check if email already exists
        if (userDAO.emailExists(email)) {
            response.sendRedirect("signup.jsp?error=emailExists");
            return;
        }

        // Register user
        boolean result = userDAO.registerUser(user);

        if (result) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("signup.jsp?error=true");
        }
    }
}
