<%@ page import="java.util.*, model.Customer" %>
<%@ page session="true" %>
<html>
<head>
    <title>View Customers</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #007bff; color: white; }
    </style>
</head>
<body>
    <h2>Customer List</h2>

    <%
        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
        if (customers == null || customers.isEmpty()) {
    %>
        <p>No customers found.</p>
    <%
        } else {
    %>
    <table>
        <tr><th>Name</th><th>Email</th><th>Phone</th><th>Address</th></tr>
        <%
            for (Customer c : customers) {
        %>
        <tr>
            <td><%= c.getName() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getPhone() %></td>
            <td><%= c.getAddress() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }
    %>
</body>
</html>
