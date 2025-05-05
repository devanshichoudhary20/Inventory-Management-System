<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
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
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 5px;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 1.1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 15px;
        }

        /* Mobile Adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                max-width: 90%;
            }

            h2 {
                font-size: 1.6rem;
            }

            label, input[type="text"], input[type="email"], input[type="date"] {
                font-size: 1rem;
            }

            .btn-submit {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add New Employee</h2>

        <!-- Form to add employee -->
        <form action="AddEmployeeServlet" method="POST">
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="contact">Contact:</label>
                <input type="text" id="contact" name="contact" required>
            </div>

            <div class="form-group">
                <label for="designation">Designation:</label>
                <input type="text" id="designation" name="designation" required>
            </div>

            <div class="form-group">
                <label for="joiningDate">Joining Date:</label>
                <input type="date" id="joiningDate" name="joiningDate" required>
            </div>

            <button type="submit" class="btn-submit">Add Employee</button>

            <!-- Display error message if any -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
        </form>
    </div>

</body>
</html>
