<?php
session_start();
include 'includes/conn.php';

if (isset($_POST['login'])) {
	$username = $_POST['username'];
	$password = $_POST['password'];

	$sql = "SELECT * FROM admin WHERE username = ?";
	$stmt = $conn->prepare($sql);
	$stmt->bind_param("s", $username);
	$stmt->execute();
	$query = $stmt->get_result();

	if ($query->num_rows < 1) {
		$_SESSION['error'] = 'Cannot find account with the username';
	} else {
		$row = $query->fetch_assoc();

		if ($password == $row['password']) {
			$_SESSION['admin'] = $row['id'];
		} else {
			$_SESSION['error'] = 'Incorrect password';
		}
	}
} else {
	$_SESSION['error'] = 'Input admin credentials first';
}

header('location: index.php');
exit();
