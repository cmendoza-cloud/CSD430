<%@ page import="beans.MovieBean, java.sql.*" %>
<%-- Carmen Mendoza - Module 8 Update Result --%>
<!DOCTYPE html>
<html>
<head><title>Updated Movie Record</title></head>
<body>
<h1>Movie Updated Successfully</h1>
<%
    String movieId = request.getParameter("movie_id");
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    String year = request.getParameter("release_year");
    String genre = request.getParameter("genre");
    String rating = request.getParameter("rating");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        PreparedStatement ps = conn.prepareStatement(
            "UPDATE mendoza_movies_data SET title=?, director=?, release_year=?, genre=?, rating=? WHERE movie_id=?"
        );
        ps.setString(1, title);
        ps.setString(2, director);
        ps.setInt(3, Integer.parseInt(year));
        ps.setString(4, genre);
        ps.setDouble(5, Double.parseDouble(rating));
        ps.setInt(6, Integer.parseInt(movieId));

        ps.executeUpdate();

        // Display the updated record
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM mendoza_movies_data WHERE movie_id=" + movieId);
        if (rs.next()) {
%>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th><th>Title</th><th>Director</th><th>Year</th><th>Genre</th><th>Rating</th>
            </tr>
        </thead>
        <tr>
            <td><%= rs.getInt("movie_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getInt("release_year") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getDouble("rating") %></td>
        </tr>
    </table>
<%
        }
        conn.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
