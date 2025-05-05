<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String error = request.getParameter("error"); %>

<html>
<head>
    <title>Sign Up</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .form-box {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 320px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        p {
            margin-top: 15px;
            font-size: 14px;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-box">
            <h2>Sign Up</h2>

            <% if ("true".equals(error)) { %>
                <div class="error">Signup failed. Please try again later.</div>
            <% } else if ("emailExists".equals(error)) { %>
                <div class="error">Email already registered. Please use another one.</div>
            <% } %>

            <form action="SignupServlet" method="post">
                <input type="text" name="fullName" placeholder="Full Name" required />
                <input type="email" name="email" placeholder="Email" required />
                <input type="password" name="password" placeholder="Password" required />
                <button type="submit">Sign Up</button>
            </form>

            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>
