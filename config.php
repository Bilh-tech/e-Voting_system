<?php
$servername = "localhost"; // Change if using a remote database
$username = "root";        // Default for XAMPP/WAMP
$password = "";            // Default is empty
$database = "votesystem"; // The database you created

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
