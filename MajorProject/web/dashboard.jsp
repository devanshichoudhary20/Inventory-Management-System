<%@page import="model.User"%>
<%@ page session="true" %>
<%= session.getAttribute("username") != null ? session.getAttribute("username") : "" %>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
}
%>
<%
    
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<h1>Welcome to Dashboard</h1>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        /* Reset and Base */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar */
        .navbar {
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar-left {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333;
        }

        .navbar-center ul {
            display: flex;
            gap: 20px;
            list-style: none;
            padding-left: 0;
        }

        .navbar-center ul li {
            position: relative;
        }

        .navbar-center ul li a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
            font-size: 1.1rem;
            transition: all 0.3s ease-in-out;
        }

        .navbar-center ul li a:hover {
            color: #0056b3;
            text-decoration: underline;
            font-size: 1.2rem; /* Increase font size on hover */
        }

        .dropdown {
            display: none;
            position: absolute;
            background-color: #fff;
            top: 40px;
            left: 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 200px;
            border-radius: 5px;
            z-index: 10;
        }

        .navbar-center ul li:hover .dropdown {
            display: block;
        }

        .dropdown a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: background-color 0.3s ease-in-out;
        }

        .dropdown a:hover {
            background-color: #f1f1f1;
            color: #007bff;
        }

        /* Hamburger */
        .navbar-right {
            position: relative;
        }

        .hamburger {
            font-size: 30px;
            cursor: pointer;
            display: block;
            color: #333;
        }

        .hamburger-menu {
            display: none;
            position: absolute;
            top: 40px;
            right: 0;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            width: 200px;
            border-radius: 5px;
            padding: 10px 0;
        }

        .hamburger-menu a {
            display: block;
            padding: 12px 20px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: all 0.3s ease-in-out;
        }

        .hamburger-menu a:hover {
            background-color: #f1f1f1;
            color: #007bff;
        }

        /* Main Content */
        .dashboard-content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
            padding: 50px 20px;
            flex-grow: 1;
        }

        .dashboard-content h2 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .dashboard-content img {
            max-width: 500px;
            width: 90%;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            transition: transform 0.3s ease-in-out;
        }

        .dashboard-content img:hover {
            transform: scale(1.05);
        }

        .dashboard-content p {
            font-size: 1.2rem;
            color: #333;
            max-width: 900px;
            margin: auto;
            line-height: 1.8;
            margin-top: 20px;
        }

        /* Mobile Adjustments */
        @media (max-width: 768px) {
            .navbar-center ul {
                display: none;
            }

            .hamburger {
                display: block;
            }

            .dashboard-content {
                padding: 30px 10px;
            }

            .dashboard-content h2 {
                font-size: 2rem;
            }

            .dashboard-content p {
                font-size: 1rem;
            }

            .hamburger-menu {
                display: block;
            }

            .navbar-center ul li {
                margin: 0;
            }
        }

    </style>

    <script>
        function toggleHamburger() {
            const menu = document.getElementById('hamburgerMenu');
            menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
        }

        document.addEventListener("click", function(event) {
            const menu = document.getElementById("hamburgerMenu");
            const burger = document.getElementById("hamburgerIcon");
            if (!menu.contains(event.target) && !burger.contains(event.target)) {
                menu.style.display = "none";
            }
        });
    </script>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-left">
            Welcome<%= session.getAttribute("username") != null ? session.getAttribute("username") : "" %>!
        </div>
        <div class="navbar-center">
            <ul>
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li>
                    <a href="#">Product Management</a>
                    <div class="dropdown">
                        <a href="add_product.jsp">Add Product</a>
                        <a href="edit_delete_product.jsp">Edit/Delete Product</a>
                        <a href="ViewProductServlet">View Product</a>
                        <a href="search_products.jsp">Search Product</a>
                    </div>
                </li>
                <li>
                    <a href="#">Customer Management</a>
                    <div class="dropdown">
                        <a href="addCustomer.jsp">Add Customer</a>
                        <a href="editDeleteCustomer.jsp">Edit/Delete Customer</a>
                        <a href="viewCustomers">View Customer</a>
                        <a href="viewCustomerHistory.jsp">View Customer History</a>
                    </div>
                </li>
                <li>
                    <a href="#">Stock Management</a>
                    <div class="dropdown">
                        <a href="ViewStockServlet">View Stock</a>
                        <a href="generateReport.jsp">Generate Product Report</a>
                        <a href="LowStockServlet">Low Stock Alert</a>
                        <a href="InventoryValueServlet">Total Inventory Value</a>
                        <a href="ProductReportServlet">Financial Reports</a>
                    </div>
                </li>
                <li>
    <a href="#">Employee Management</a>
    <div class="dropdown">
        <a href="addEmployee.jsp">Add New Employee</a>
        <a href="viewEmployees.jsp">View All Employees</a>
        <a href="editDeleteEmployee.jsp">Edit/Delete Employee Details</a>
        <a href="attendance.jsp">Attendance Tracking</a>
        <a href="payroll.jsp">Payroll / Salary Details</a>
    </div>
</li>
       </ul>
        </div>
        <div class="navbar-right">
            <span class="hamburger" id="hamburgerIcon" onclick="toggleHamburger()">?</span>
            <div class="hamburger-menu" id="hamburgerMenu">
                <a href="ProfileServlet">My Profile</a>
                <a href="EditProfileServlet">Edit Profile</a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="dashboard-content">
        <h2>Welcome to Your Inventory Management System</h2>
        <img src="images/inventory-dashboard.jpg" alt="Inventory Dashboard Image">
        <p>
            This powerful web-based application allows you to efficiently manage your products, customers, and stock levels. 
            Easily add or update products, monitor inventory in real time, and generate insightful financial reports. 
            With features like billing, alerts for low stock, and detailed sales tracking, this system empowers small businesses 
            to run their operations smoothly and smartly. Use the navigation menu above to explore the modules and streamline your inventory workflow.
        </p>
    </div>

</body>
</html>
