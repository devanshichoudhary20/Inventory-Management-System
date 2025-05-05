<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Product> lowStockList = (List<Product>) request.getAttribute("lowStockList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Low Stock Alert</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }
        h2 {
            color: #cc0000;
            text-align: center;
        }
        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background-color: #cc0000;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #ffe6e6;
        }
        .no-low-stock {
            text-align: center;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Low Stock Products (Below 10)</h2>
    <%
        if (lowStockList != null && !lowStockList.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Name</th>
            <th>Quantity</th>
            <th>Supplier</th>
            <th>Price</th>
        </tr>
        <% for (Product p : lowStockList) { %>
        <tr>
            <td><%= p.getName() %></td>
            <td><%= p.getQuantity() %></td>
            <td><%= p.getSupplier() %></td>
            <td><%= p.getPrice() %></td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
    <p class="no-low-stock">All stocks are sufficient 🎉</p>
    <% } %>
</body>
</html>
