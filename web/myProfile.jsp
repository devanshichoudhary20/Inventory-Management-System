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
    <title>My Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
        }

        .container {
            max-width: 800px;
            margin: 60px auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .profile-info {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .profile-info .field {
            width: 48%;
            margin-bottom: 20px;
        }

        .profile-info label {
            font-weight: 700;
            color: #444;
            display: block;
            margin-bottom: 6px;
        }

        .profile-info p {
            font-size: 16px;
            color: #222;
            margin: 0;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .button-container a {
            padding: 12px 24px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            transition: 0.3s ease-in-out;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }

        .button-container a:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 15px rgba(0, 86, 179, 0.4);
        }

        @media (max-width: 600px) {
            .profile-info .field {
                width: 100%;
            }

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
    <h2>My Profile</h2>

    <div class="profile-info">
        <div class="field">
            <label>Full Name:</label>
            <p><%= user.getFullName() %></p>
        </div>
        <div class="field">
            <label>Email:</label>
            <p><%= user.getEmail() %></p>
        </div>
    </div>

    <div class="button-container">
        <a href="editProfile.jsp">Edit Profile</a>
    </div>
</div>

</body>
</html>
