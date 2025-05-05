<%@ page import="java.util.List, model.OrderHistory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Order History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        h2 {
            text-align: center;
            margin-top: 30px;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2>Order History for Customer</h2>

<%
    List<OrderHistory> historyList = (List<OrderHistory>) request.getAttribute("history");
    if (historyList != null && !historyList.isEmpty()) {
%>

<table>
    <tr>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Order Date</th>
    </tr>
    <%
        for (OrderHistory history : historyList) {
    %>
    <tr>
        <td><%= history.getProductName() %></td>
        <td><%= history.getQuantity() %></td>
        <td><%= history.getOrderDate() %></td>
    </tr>
    <%
        }
    %>
</table>

<%
    } else {
%>
    <p>No order history found for this customer.</p>
<%
    }
%>

</body>
</html>
