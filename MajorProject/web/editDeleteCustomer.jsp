<%@ page import="java.util.*, model.Customer, util.DBConnection, dao.CustomerDAO" %>
<%@ page session="true" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp"); // redirect to login if not logged in
        return;
    }

    CustomerDAO customerDAO = new CustomerDAO(DBConnection.getConnection());
    List<Customer> customers = customerDAO.getAllCustomers(userId);
%>


<html>
<head>
    <title>Edit/Delete Customers</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #007bff; color: white; }
        a.button {
            padding: 6px 10px; color: white; text-decoration: none;
            background: #28a745; border-radius: 4px;
        }
        a.delete { background: #dc3545; }
    </style>
</head>
<body>
    <h2>All Customers</h2>
    <table>
        <tr><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Actions</th></tr>
        <%
            for (Customer c : customers) {
        %>
        <tr>
            <td><%= c.getName() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getPhone() %></td>
            <td><%= c.getAddress() %></td>
            <td>
                <a class="button" href="editCustomerForm.jsp?id=<%= c.getId() %>">Edit</a>

                <a class="button delete" href="deleteCustomer?id=<%= c.getId() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
