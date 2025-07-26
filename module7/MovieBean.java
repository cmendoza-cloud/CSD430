package beans;

import java.sql.*;

public class MovieBean {
    private String dbURL = "jdbc:mysql://localhost:3306/CSD430";
    private String username = "student1";
    private String password = "pass";

    public Connection connect() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    public ResultSet getAllMovies() throws Exception {
        Connection conn = connect();
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT movie_id FROM mendoza_movies_data");
    }

    public ResultSet getMovieById(int id) throws Exception {
        Connection conn = connect();
        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM mendoza_movies_data WHERE movie_id = ?");
        ps.setInt(1, id);
        return ps.executeQuery();
    }
}
