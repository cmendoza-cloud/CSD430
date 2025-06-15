<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Favorite Movies</title> 
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h1>My Favorite Movies</h1>
    <p>This table shows a list of movies I've enjoyed, grouped by category.</p>

    <%
        String[][] movies = {
            {"Inception", "Christopher Nolan", "Science Fiction"},
            {"The Dark Knight", "Christopher Nolan", "Action"},
            {"Gran Torino", "Clint Eastwood", "Thiller"},
            {"Interstellar", "Christopher Nolan", "Science Fiction"},
            {"Marley and Me", "David Frankel", "Family Comedy"}
        };
    %>

    <table>
        <tr>
            <th>Title</th>
            <th>Director</th>
            <th>Genre</th>
        </tr>
        <%
            for (int i = 0; i < movies.length; i++) {
        %>
        <tr>
            <td><%= movies[i][0] %></td>
            <td><%= movies[i][1] %></td>
            <td><%= movies[i][2] %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
