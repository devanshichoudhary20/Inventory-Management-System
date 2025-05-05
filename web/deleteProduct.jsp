<%@ page import="java.sql.*, dao.ProductDAO, util.DBConnection" %>
<%
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection con = DBConnection.getConnection();
        ProductDAO dao = new ProductDAO(con);
        boolean deleted = dao.deleteProduct(id);

        if (deleted) {
            response.sendRedirect("edit_delete_product.jsp?deleted=1");
        } else {
            response.sendRedirect("edit_delete_product.jsp?error=1");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("edit_delete_product.jsp?error=exception");
    }
%>
