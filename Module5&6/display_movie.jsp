<%@ page import="beans.MovieBean, java.sql.*" %>
<%-- Carmen Mendoza - CSD430 Module 5&6 --%>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Record Display</title>
</head>
<body>
    <h1>Movie Record</h1>

    <%
        String movieIdStr = request.getParameter("movie_id");

        if (movieIdStr != null) {
            try {
                int movieId = Integer.parseInt(movieIdStr);
                MovieBean bean = new MovieBean();
                ResultSet rs = bean.getMovieById(movieId);

                if (rs.next()) {
    %>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Director</th>
                <th>Release Year</th>
                <th>Genre</th>
                <th>Rating</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= rs.getInt("movie_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("director") %></td>
                <td><%= rs.getInt("release_year") %></td>
                <td><%= rs.getString("genre") %></td>
                <td><%= rs.getDouble("rating") %></td>
            </tr>
        </tbody>
    </table>

    <p><strong>Record successfully retrieved from the database.</strong></p>

    <%
                } else {
                    out.println("<p>No movie found with ID: " + movieId + "</p>");
                }
                rs.getStatement().getConnection().close();
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p>No movie ID selected.</p>");
        }
    %>

    <p><a href="select_movie.jsp">← Go back and select another movie</a></p>
</body>
</html>
