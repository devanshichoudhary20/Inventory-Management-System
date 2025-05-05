<%@ page import="java.util.List" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="util.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%
    String message = request.getParameter("message");
    if (message != null) {
        out.println("<p>" + message + "</p>");
    }
%>


<%
    // Get the logged-in user's ID from session
    HttpSession sess = request.getSession(false);
    Integer shopkeeperId = (Integer) sess.getAttribute("userId");

    if (shopkeeperId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = DBConnection.getConnection();
    ProductDAO productDAO = new ProductDAO(con);
    List<Product> products = productDAO.getProductsByShopkeeperId(shopkeeperId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit/Delete Product</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Edit/Delete Product</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Supplier</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Product product : products) {
            %>
            <tr>
                <td><%= product.getName() %></td>
                <td><%= product.getDescription() %></td>
                <td><%= product.getQuantity() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getSupplier() %></td>
                <td>
                    <a href="editProduct.jsp?id=<%= product.getId() %>">Edit</a> |
                    <a href="deleteProduct.jsp?id=<%= product.getId() %>">Delete</a>
                </td>
            </tr>
            <%
                } // ? closing the for loop properly
            %>
        </tbody>
    </table>
</body>
</html>
