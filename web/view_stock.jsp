<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Stock Management</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }
        h2 {
            color: #003366;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background: white;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #003366;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #eef3fa;
        }
        .no-data {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Available Stock</h2>
    <%
        if (productList != null && !productList.isEmpty()) {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Supplier</th>
            <th>Manufacture Date</th>
            <th>Received Date</th>
        </tr>
        <%
            for (Product p : productList) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getDescription() %></td>
            <td><%= p.getQuantity() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getSupplier() %></td>
            <td><%= p.getManufactureDate() %></td>
            <td><%= p.getReceiveDate() %></td>
        </tr>
        <% } %>
    </table>
    <%
        } else {
    %>
    <p class="no-data">No stock available.</p>
    <%
        }
    %>
</body>
</html>
