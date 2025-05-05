<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page session="true" %>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f4f4f4; }
        .form-container {
            width: 400px; margin: auto; padding: 20px;
            background: white; border-radius: 10px; box-shadow: 0 0 10px gray;
        }
        input, textarea { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; }
        input[type=submit] {
            background: #007bff; color: white; border: none; cursor: pointer;
        }
        input[type=submit]:hover { background: #0056b3; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add Customer</h2>
        <form action="addCustomer" method="post">
            <input type="text" name="name" placeholder="Name" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="text" name="phone" placeholder="Phone" required />
            <textarea name="address" placeholder="Address" required></textarea>
            <input type="submit" value="Add Customer" />
        </form>
    </div>
</body>
</html>
