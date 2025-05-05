<%@ page import="java.util.*, model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee List</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f4f4;
            padding: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a.button {
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
        }
        a.button:hover {
            background-color: #0056b3;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<h2>All Employees</h2>

<c:if test="${not empty param.message}">
    <p class="success">${param.message}</p>
</c:if>

<c:if test="${not empty param.error}">
    <p class="error">${param.error}</p>
</c:if>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Designation</th>
        <th>Joining Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="emp" items="${employeeList}">
        <tr>
            <td>${emp.id}</td>
            <td>${emp.fullName}</td>
            <td>${emp.email}</td>
            <td>${emp.contact}</td>
            <td>${emp.designation}</td>
            <td>${emp.joiningDate}</td>
            <td>
                <a href="EditEmployeeFormServlet?id=${emp.id}" class="button">Edit</a>
                <a href="DeleteEmployeeServlet?id=${emp.id}" class="button" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
