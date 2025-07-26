<%@ page import="beans.MovieBean, java.sql.*" %>
<%-- Carmen Mendoza - Module 8 Update Form --%>
<!DOCTYPE html>
<html>
<head><title>Update Movie Record</title></head>
<body>
<h1>Edit Movie Details</h1>
<%
    String movieId = request.getParameter("movie_id");
    try {
        MovieBean bean = new MovieBean();
        ResultSet rs = bean.getMovieById(Integer.parseInt(movieId));
        if (rs.next()) {
%>
    <form action="update_result.jsp" method="post">
        <input type="hidden" name="movie_id" value="<%= rs.getInt("movie_id") %>">
        <p><strong>Movie ID:</strong> <%= rs.getInt("movie_id") %></p>

        Title: <input type="text" name="title" value="<%= rs.getString("title") %>"><br>
        Director: <input type="text" name="director" value="<%= rs.getString("director") %>"><br>
        Release Year: <input type="number" name="release_year" value="<%= rs.getInt("release_year") %>"><br>
        Genre: <input type="text" name="genre" value="<%= rs.getString("genre") %>"><br>
        Rating: <input type="number" step="0.1" name="rating" value="<%= rs.getDouble("rating") %>"><br><br>

        <input type="submit" value="Update Record">
    </form>
<%
        } else {
            out.println("<p>No movie found with ID " + movieId + "</p>");
        }
        rs.getStatement().getConnection().close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
