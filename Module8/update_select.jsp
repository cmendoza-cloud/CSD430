<%@ page import="beans.MovieBean, java.sql.*" %>
<%-- Carmen Mendoza - CSD430 Module 8 - Select Record to Update --%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Movie - Select Record</title>
</head>
<body>
    <h1>Update a Movie Record</h1>

    <form action="update_form.jsp" method="get">
        <label for="movie_id">Select a Movie ID to Update:</label>
        <select name="movie_id" id="movie_id">
            <%
                try {
                    MovieBean bean = new MovieBean();
                    ResultSet rs = bean.getAllMovies();
                    boolean found = false;
                    while (rs.next()) {
                        found = true;
                        int id = rs.getInt("movie_id");
                        out.println("<option value='" + id + "'>" + id + "</option>");
                    }
                    rs.getStatement().getConnection().close();
                    if (!found) {
                        out.println("<option disabled>No records available</option>");
                    }
                } catch (Exception e) {
                    out.println("<option disabled>Error: " + e.getMessage() + "</option>");
                }
            %>
        </select>
        <input type="submit" value="Edit Movie">
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
                    boolean hasRows = false;
                    while (rs.next()) {
                        hasRows = true;
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
                    if (!hasRows) {
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
