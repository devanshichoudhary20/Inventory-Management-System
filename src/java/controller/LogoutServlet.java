package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the current session to log the user out
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();  // This invalidates the session
        }
        
        // Redirect to the login page after logging out
        response.sendRedirect("login.jsp");  // Redirect to login page
    }
}
