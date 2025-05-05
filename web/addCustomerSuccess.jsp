<%@ page session="true" %>
<html>
<head>
    <title>Customer Added</title>
    <style>
        body { font-family: Arial; text-align: center; background-color: #f4f4f4; padding-top: 50px; }
        .message-box {
            display: inline-block;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
        }
        .message-box h2 { color: green; }
    </style>
</head>
<body>
    <div class="message-box">
        <h2><%= request.getAttribute("message") %></h2>
        <a href="dashboard.jsp">Go Back to Dashboard</a>
    </div>
</body>
</html>
