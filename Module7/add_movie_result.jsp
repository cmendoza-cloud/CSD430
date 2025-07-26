<%@ page import="java.sql.*" %>
<%-- Carmen Mendoza - CSD430 Module 8 --%>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Added</title>
</head>
<body>
    <h1>All Movies (After Insert)</h1>

    <%
        // Get form values
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        String releaseYear = request.getParameter("release_year");
        String genre = request.getParameter("genre");
        String rating = request.getParameter("rating");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

            // Insert new movie
            PreparedStatement insert = conn.prepareStatement(
                "INSERT INTO mendoza_movies_data (title, director, release_year, genre, rating) VALUES (?, ?, ?, ?, ?)");
            insert.setString(1, title);
            insert.setString(2, director);
            insert.setInt(3, Integer.parseInt(releaseYear));
            insert.setString(4, genre);
            insert.setDouble(5, Double.parseDouble(rating));
            insert.executeUpdate();

            // Display all records
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM mendoza_movies_data");
    %>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th><th>Title</th><th>Director</th>
                <th>Year</th><th>Genre</th><th>Rating</th>
            </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("movie_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("director") %></td>
                <td><%= rs.getInt("release_year") %></td>
                <td><%= rs.getString("genre") %></td>
                <td><%= rs.getDouble("rating") %></td>
            </tr>
        <%
            }
            conn.close();
        %>
        </tbody>
    </table>

    <%
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>

    <p><a href="add_movie.jsp">← Add Another Movie</a></p>
</body>
</html>
