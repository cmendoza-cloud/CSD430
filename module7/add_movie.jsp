<%-- Carmen Mendoza - CSD430 Module 8 --%>
<!DOCTYPE html>
<html>
<head>
    <title>Add a New Movie</title>
</head>
<body>
    <h1>Add a Movie Record</h1>
    <form action="add_movie_result.jsp" method="post">
        <label>Title:</label><br>
        <input type="text" name="title" required><br><br>

        <label>Director:</label><br>
        <input type="text" name="director" required><br><br>

        <label>Release Year:</label><br>
        <input type="number" name="release_year" required><br><br>

        <label>Genre:</label><br>
        <input type="text" name="genre" required><br><br>

        <label>Rating:</label><br>
        <input type="number" step="0.1" name="rating" min="0" max="10" required><br><br>

        <input type="submit" value="Add Movie">
    </form>

    <p><a href="index.jsp">← Back to Home</a></p>
</body>
</html>
