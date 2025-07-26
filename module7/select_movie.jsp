<%@ page import="beans.MovieBean, java.sql.*" %>
<%-- Carmen Mendoza - CSD430 Module 7 --%>
<!DOCTYPE html>
<html>
<head>
    <title>Select a Movie</title>
</head>
<body>
    <h1>Select a Movie ID to View Details</h1>

    <form action="display_movie.jsp" method="get">
        <label for="movie_id">Choose a Movie ID:</label>
        <select name="movie_id" id="movie_id">
            <%
                try {
                    MovieBean bean = new MovieBean();
                    ResultSet rs = bean.getAllMovies();
                    while (rs.next()) {
                        int id = rs.getInt("movie_id");
                        out.println("<option value='" + id + "'>" + id + "</option>");
                    }
                    rs.getStatement().getConnection().close();
                } catch (Exception e) {
                    out.println("<option>Error: " + e.getMessage() + "</option>");
                }
            %>
        </select>
        <input type="submit" value="View Movie">
    </form>

    <p><a href="index.jsp">← Back to Home</a></p>
</body>
</html>
