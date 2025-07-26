<%@ page import="beans.MovieBean, java.sql.*" %>
<%-- Carmen Mendoza - Module 8 Update Select --%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Movie to Update</title>
</head>
<body>
    <h1>Select a Movie to Update</h1>
    <form action="update_form.jsp" method="get">
        <label for="movie_id">Choose Movie ID:</label>
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
        <input type="submit" value="Edit Movie">
    </form>
</body>
</html>
