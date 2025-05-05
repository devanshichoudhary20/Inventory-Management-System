<%@ page import="model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Employee</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 600px;
            width: 100%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: 600;
            display: block;
        }
        input[type="text"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Employee</h2>
    <form action="EditEmployeeServlet" method="post">
        <input type="hidden" name="id" value="${employee.id}">
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" name="fullName" id="fullName" value="${employee.fullName}" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" value="${employee.email}" required>
        </div>
        <div class="form-group">
            <label for="contact">Contact:</label>
            <input type="text" name="contact" id="contact" value="${employee.contact}" required>
        </div>
        <div class="form-group">
            <label for="designation">Designation:</label>
            <input type="text" name="designation" id="designation" value="${employee.designation}" required>
        </div>
        <div class="form-group">
            <label for="joiningDate">Joining Date:</label>
            <input type="date" name="joiningDate" id="joiningDate" value="${employee.joiningDate}" required>
        </div>
        <button type="submit" class="btn-submit">Update Employee</button>
    </form>
</div>
</body>
</html>
