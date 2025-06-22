<%@ page import="java.sql.*" %>
<html>
<head><title>Module 5 - View Movies</title></head>
<body>
<h1>Movie Records</h1>

<%
String url = "jdbc:mysql://localhost:3306/CSD430";
String username = "student1";
String password = "pass";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, username, password);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM data");
%>

<table border="1">
    <tr>
        <th>ID</th><th>Title</th><th>Director</th><th>Year</th><th>Genre</th><th>Rating</th>
    </tr>

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
} catch(Exception e) {
    out.println("Database error: " + e.getMessage());
}
%>

</table>
</body>
</html>
