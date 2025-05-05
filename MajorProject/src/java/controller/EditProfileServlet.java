/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Devanshi
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the updated information from the form
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Get the current logged-in user (from session)
        User user = (User) request.getSession().getAttribute("user");

        // Update the user details
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);

        // Update user information in the database
        UserDAO userDAO = new UserDAO();
        boolean updated = userDAO.updateUserProfile(user);

        if (updated) {
            request.getSession().setAttribute("user", user); // Update session
            response.sendRedirect("myProfile.jsp"); // Redirect to profile page
        } else {
            response.getWriter().println("Error updating profile.");
        }
    }
}
