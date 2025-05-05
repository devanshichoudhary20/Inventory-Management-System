<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Added</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .success-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 30px 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }

        h2 {
            font-size: 2rem;
            color: #28a745;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 30px;
        }

        .btn-dashboard {
            padding: 12px 24px;
            font-size: 1rem;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-dashboard:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .success-container {
                padding: 20px;
            }

            h2 {
                font-size: 1.6rem;
            }

            p {
                font-size: 1rem;
            }

            .btn-dashboard {
                font-size: 0.95rem;
            }
        }
    </style>
</head>
<body>

    <div class="success-container">
        <h2>Employee Added Successfully!</h2>
        <p>The new employee has been registered in the system.</p>
        <a href="dashboard.jsp" class="btn-dashboard">Go to Dashboard</a>
    </div>

</body>
</html>
