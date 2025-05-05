<%@ page import="java.util.*, model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Total Inventory Value</title>
    <style>
        body { font-family: Arial; margin: 20px; background-color: #f4f4f4; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #007bff; color: white; }
        .total { font-weight: bold; color: green; font-size: 18px; margin-top: 15px; }
    </style>
</head>
<body>
    <h2>Total Inventory Value</h2>
    <table>
        <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price Per Unit</th>
            <th>Total Value</th>
        </tr>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
        %>
            <tr>
                <td><%= p.getName() %></td>
                <td><%= p.getQuantity() %></td>
                <td>₹<%= p.getPrice() %></td>
                <td>₹<%= p.getQuantity() * p.getPrice() %></td>
            </tr>
        <% 
                }
            } else {
        %>
            <tr><td colspan="4">No products found.</td></tr>
        <% } %>
    </table>

    <div class="total">
        Total Inventory Value: ₹<%= request.getAttribute("totalValue") %>
    </div>
</body>
</html>
