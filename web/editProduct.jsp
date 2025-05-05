<%@ page import="java.sql.*, dao.ProductDAO, model.Product, util.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DBConnection.getConnection();
    ProductDAO dao = new ProductDAO(con);
    Product product = dao.getProductById(id); // You must have this method in your ProductDAO

    if (product == null) {
        response.sendRedirect("edit_delete_product.jsp?error=notfound");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    
</head>
<body>

<h2>Edit Product</h2>
<form action="UpdateProductServlet" method="post">
    <input type="hidden" name="id" value="<%= product.getId() %>">
    Name: <input type="text" name="name" value="<%= product.getName() %>" required><br>
    Description: <textarea name="description"><%= product.getDescription() %></textarea><br>
    Quantity: <input type="number" name="quantity" value="<%= product.getQuantity() %>" required><br>
    Price: <input type="number" step="0.01" name="price" value="<%= product.getPrice() %>" required><br>
    Manufacture Date: <input type="date" name="manufactureDate" value="${product.manufactureDate}"><br>
    Receive Date: <input type="date" name="receiveDate" value="${product.receiveDate}"><br>
    Supplier: <input type="text" name="supplier" value="<%= product.getSupplier() %>" required><br>
    <button type="submit">Update Product</button>
</form>

</body>
</html>