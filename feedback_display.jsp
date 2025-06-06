<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Summary</title>
</head>
<body>
    <h1>Thank You for Your Feedback!</h1>
    <p>Below is a summary of your experience:</p>

    <table border="1" cellpadding="10">
        <tr>
            <th>Field</th>
            <th>Response</th>
        </tr>
        <%
            // Retrieve data from the request object
            String name = request.getParameter("name");
            String mealEnjoyable = request.getParameter("mealEnjoyable");
            String rating = request.getParameter("rating");
            String comments = request.getParameter("comments");
            String visitDate = request.getParameter("visitDate");
        %>
        <tr>
            <td>Name</td>
            <td><%= name %></td>
        </tr>
        <tr>
            <td>Meal Enjoyable?</td>
            <td><%= mealEnjoyable %></td>
        </tr>
        <tr>
            <td>Overall Rating</td>
            <td><%= rating %></td>
        </tr>
        <tr>
            <td>Additional Comments</td>
            <td><%= comments != null && !comments.trim().isEmpty() ? comments : "No comments provided." %></td>
        </tr>
        <tr>
            <td>Date of Visit</td>
            <td><%= visitDate %></td>
        </tr>
    </table>
</body>
</html>
