<?php
$servername = "localhost";
$username = "root";
$password = "";


$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$createDatabase = "CREATE DATABASE IF NOT EXISTS movie_app";
$conn->query($createDatabase);
$conn->select_db("movie_app");

$createTable = "CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imdb_id VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    year VARCHAR(10),
    genre VARCHAR(255),
    director VARCHAR(255),
    plot TEXT,
    poster VARCHAR(255),
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);";
$conn->query($createTable);


$movieName = isset($_GET['q']) ? $conn->real_escape_string($_GET['q']) : "Inception";


$conn->query("DELETE FROM movies WHERE TIMESTAMPDIFF(HOUR, date_time, NOW()) > 24");

$checkRecentData = "SELECT * FROM movies WHERE title LIKE '%$movieName%' AND TIMESTAMPDIFF(HOUR, date_time, NOW()) <= 24";
$result = $conn->query($checkRecentData);

if ($result->num_rows == 0) {
    $apiKey = "2e693b36"; 
    $url = "http://www.omdbapi.com/?apikey=$apiKey&t=" . urlencode($movieName);

    $response = @file_get_contents($url);
    if ($response === FALSE) {
        die(json_encode(["error" => "Failed to fetch data from OMDb API."]));
    }

    $data = json_decode($response, true);
    if (!isset($data['Title'])) {
        die(json_encode(["error" => "Movie not found."]));
    }

    $imdbId = $data['imdbID'];
    $title = $conn->real_escape_string($data['Title']);
    $year = $data['Year'];
    $genre = $conn->real_escape_string($data['Genre']);
    $director = $conn->real_escape_string($data['Director']);
    $plot = $conn->real_escape_string($data['Plot']);
    $poster = $data['Poster'] !== "N/A" ? $data['Poster'] : null;

    $insertData = "INSERT INTO movies (imdb_id, title, year, genre, director, plot, poster) 
                   VALUES ('$imdbId', '$title', '$year', '$genre', '$director', '$plot', '$poster')";
    $conn->query($insertData);

    $movieData = [
        "imdb_id" => $imdbId,
        "title" => $title,
        "year" => $year,
        "genre" => $genre,
        "director" => $director,
        "plot" => $plot,
        "poster" => $poster
    ];

    echo json_encode($movieData);
    exit;
}

$row = $result->fetch_assoc();
$movieData = [
    "imdb_id" => $row['imdb_id'],
    "title" => $row['title'],
    "year" => $row['year'],
    "genre" => $row['genre'],
    "director" => $row['director'],
    "plot" => $row['plot'],
    "poster" => $row['poster']
];

header('Content-Type: application/json');
echo json_encode($movieData);

$conn->close();
?>
