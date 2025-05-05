<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Financial Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f7f8fa, #d7e1ec);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 80px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #2c3e50;
            margin-bottom: 30px;
        }
        .btn-download {
            display: inline-block;
            padding: 12px 24px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .btn-download:hover {
            background-color: #2980b9;
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h2 {
                font-size: 22px;
            }

            .btn-download {
                font-size: 14px;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Financial Report</h2>
        <p>Click the button below to download the report in Excel format.</p>
        <a href="DownloadExcelServlet" class="btn-download" target="_blank">Download Excel Report</a>
    </div>
</body>
</html>
