<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="model.User" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background-color: #fff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-size: 28px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 700;
            margin-bottom: 8px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px 14px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            border-color: #007bff;
            outline: none;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .button-container button {
            background-color: #007bff;
            color: #fff;
            padding: 12px 26px;
            font-size: 16px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.3);
        }

        .button-container button:hover {
            background-color: #0056b3;
            box-shadow: 0 8px 15px rgba(0, 86, 179, 0.4);
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Profile</h2>
    <form action="EditProfileServlet" method="POST">
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="<%= user.getFullName() %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
        </div>

        <div class="button-container">
            <button type="submit">Update Profile</button>
        </div>
    </form>
</div>

</body>
</html>
