<%@ page import="model.Product" %>
<%@ page import="java.util.*, model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            margin: 40px auto;
            background: #fff;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background: #f5f5f5;
        }
        tr:nth-child(even) {
            background: #f9f9f9;
        }
        .product-details {
            font-size: 16px;
            color: #333;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Product List</h2>

        <%
            // Check if there are any products to display
            List<Product> products = (List<Product>) request.getAttribute("productList");
            String noProductsMessage = (String) request.getAttribute("noProducts");

            if (noProductsMessage != null) {
        %>
            <p style="text-align:center; font-size:18px; color:#888;"><%= noProductsMessage %></p>
        <%
            } else if (products != null && !products.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Supplier</th>
                    <th>Manufacture Date</th>
                    <th>Issue Date</th>
                </tr>
                <%
                    for (Product product : products) {
                %>
                    <tr>
                        <td><%= product.getName() %></td>
                        <td><%= product.getDescription() %></td>
                        <td><%= product.getPrice() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td><%= product.getSupplier() %></td>
                        <td><%= product.getManufactureDate() %></td>
                        <td><%= product.getReceiveDate() %></td>
                    </tr>
                <%
                    }
                %>
            </table>
        <%
            }
        %>
    </div>
</body>
</html>
