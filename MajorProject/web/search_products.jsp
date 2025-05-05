<%@ page import="java.util.*, model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 40px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .search-form {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-form input[type="text"] {
            padding: 8px;
            width: 300px;
            font-size: 14px;
        }
        .search-form input[type="submit"] {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .search-form input[type="submit"]:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #eee;
        }
        .no-products {
            text-align: center;
            font-size: 16px;
            color: #888;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Search Products</h2>

    <!-- Search Form -->
    <form action="searchProduct" method="post" class="search-form">
        <input type="text" name="name" placeholder="Enter product name" required>
        <input type="submit" value="Search">
    </form>

    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products == null || products.isEmpty()) {
    %>
        <p class="no-products">No products found.</p>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Supplier</th>
                    <th>Manufacture Date</th>
                    <th>Receive Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (Product p : products) { %>
                    <tr>
                        <td><%= p.getName() %></td>
                        <td><%= p.getDescription() %></td>
                        <td><%= p.getPrice() %></td>
                        <td><%= p.getQuantity() %></td>
                        <td><%= p.getSupplier() %></td>
                        <td><%= p.getManufactureDate() %></td>
                        <td><%= p.getReceiveDate() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <%
        }
    %>
</div>
</body>
</html>
