<%@ page import="beans.MovieBean, java.sql.*" %>
<%-- Carmen Mendoza - CSD430 Module 9 - Delete Movie Record --%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Movie Record</title>
</head>
<body>
    <h1>Delete a Movie Record</h1>

    <%
        // Handle deletion if submitted
        String deleteId = request.getParameter("movie_id");
        if (deleteId != null && !deleteId.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
                PreparedStatement ps = conn.prepareStatement("DELETE FROM mendoza_movies_data WHERE movie_id=?");
                ps.setInt(1, Integer.parseInt(deleteId));
                ps.executeUpdate();
                conn.close();
                out.println("<p style='color:green;'>Record with ID " + deleteId + " deleted.</p>");
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error deleting movie: " + e.getMessage() + "</p>");
            }
        }
    %>

    <form action="delete_movie.jsp" method="get">
        <label for="movie_id">Select Movie ID to Delete:</label>
        <select name="movie_id" id="movie_id">
            <%
                try {
                    MovieBean bean = new MovieBean();
                    ResultSet rs = bean.getAllMovies();
                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
                        int id = rs.getInt("movie_id");
                        out.println("<option value='" + id + "'>" + id + "</option>");
                    }
                    rs.getStatement().getConnection().close();
                    if (!hasData) {
                        out.println("<option disabled>No records available</option>");
                    }
                } catch (Exception e) {
                    out.println("<option disabled>Error: " + e.getMessage() + "</option>");
                }
            %>
        </select>
        <input type="submit" value="Delete">
    </form>

    <h2>Current Movie Records:</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th><th>Title</th><th>Director</th><th>Year</th><th>Genre</th><th>Rating</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    MovieBean bean = new MovieBean();
                    ResultSet rs = bean.getAllMovies();
                    boolean found = false;
                    while (rs.next()) {
                        found = true;
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
                    if (!found) {
                        out.println("<tr><td colspan='6'>No records found.</td></tr>");
                    }
                    rs.getStatement().getConnection().close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>

    <p><a href="index.jsp">← Back to Home</a></p>
</body>
</html>
