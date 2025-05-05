<%@ page import="dao.UserDAO" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%
    // ? Check if user is logged in
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<% if (request.getParameter("success") != null) { %>
    <div class="alert success">Product added successfully!</div>
<% } else if (request.getParameter("error") != null) { %>
    <div class="alert error">Error: Could not add product. Please try again.</div>
<% } %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f2f4f7;
        }

        .navbar {
            background-color: #1f2937;
            padding: 10px 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .navbar a {
            color: #ffffff;
            padding: 10px 15px;
            text-decoration: none;
            margin: 5px;
        }

        .navbar a:hover {
            background-color: #374151;
            border-radius: 5px;
        }

        .container {
            max-width: 500px;
            background-color: #ffffff;
            margin: 30px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }

        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            background-color: #2563eb;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1d4ed8;
        }

        .alert {
            max-width: 500px;
            margin: 20px auto;
            padding: 12px;
            border-radius: 5px;
            text-align: center;
            font-weight: 600;
        }

        .alert.success {
            background-color: #d1fae5;
            color: #065f46;
        }

        .alert.error {
            background-color: #fee2e2;
            color: #991b1b;
        }

        @media (max-width: 600px) {
            .container, .alert {
                width: 90%;
                margin: 20px auto;
            }

            .navbar {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="add_product.jsp">Add Product</a>
        <a href="edit_delete_product.jsp">Edit/Delete Product</a>
        <a href="ViewProductServlet">View All Products</a>
        <a href="search_products.jsp">Search Product</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <div class="container">
        <h2>Add New Product</h2>
        <form action="AddProductServlet" method="POST">
            <label for="name">Product Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="3" required></textarea>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required>

            <label for="supplier">Supplier:</label>
            <input type="text" id="supplier" name="supplier" required>

            <label for="manufacture_date">Manufacture Date:</label>
            <input type="date" id="manufacture_date" name="manufacture_date" required>

            <label for="receive_date">Receive Date:</label>
            <input type="date" id="receive_date" name="receive_date" required>

            <input type="submit" value="Add Product">
        </form>
    </div>

</body>
</html>
