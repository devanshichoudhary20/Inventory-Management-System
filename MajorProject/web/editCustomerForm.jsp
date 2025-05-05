<%@ page import="model.Customer, dao.CustomerDAO, util.DBConnection" %>
<%
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
        response.sendError(400, "Customer ID is missing.");
        return;
    }

    int id = Integer.parseInt(idParam);
    CustomerDAO dao = new CustomerDAO(DBConnection.getConnection());
    Customer customer = dao.getCustomerById(id);
    if (customer == null) {
        response.sendError(404, "Customer not found.");
        return;
    }
%>
<html>
<head>
    <title>Edit Customer</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 20px; }
        .form-container {
            width: 400px; margin: auto; padding: 20px; background: white;
            border-radius: 10px; box-shadow: 0 0 10px gray;
        }
        input, textarea { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; }
        input[type=submit] {
            background: #007bff; color: white; border: none; cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Customer</h2>
        <form action="editCustomer" method="post">
            <input type="hidden" name="id" value="<%= customer.getId() %>" />
            <input type="text" name="name" value="<%= customer.getName() %>" required />
            <input type="email" name="email" value="<%= customer.getEmail() %>" required />
            <input type="text" name="phone" value="<%= customer.getPhone() %>" required />
            <textarea name="address"><%= customer.getAddress() %></textarea>
            <input type="submit" value="Update Customer" />
        </form>
    </div>
</body>
</html>
