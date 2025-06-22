<%@ page import="java.sql.*" %>
<html>
<head><title>Module 6 - Add Movie</title></head>
<body>

<h1>Add a New Movie</h1>
<form method="post">
    Title: <input type="text" name="title"><br/>
    Director: <input type="text" name="director"><br/>
    Year: <input type="number" name="year"><br/>
    Genre: <input type="text" name="genre"><br/>
    Rating: <input type="text" name="rating"><br/>
    <input type="submit" value="Add Movie">
</form>

<%
if (request.getMethod().equals("POST")) {
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    String year = request.getParameter("year");
    String genre = request.getParameter("genre");
    String rating = request.getParameter("rating");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
        String sql = "INSERT INTO data (title, director, release_year, genre, rating) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, director);
        ps.setInt(3, Integer.parseInt(year));
        ps.setString(4, genre);
        ps.setDouble(5, Double.parseDouble(rating));
        ps.executeUpdate();
        out.println("<p style='color:green;'>Movie added successfully!</p>");
        conn.close();
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>
