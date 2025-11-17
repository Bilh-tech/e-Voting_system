<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('location: login.php');
    exit();
}
include 'config_save.php'; // Database connection
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<?php include 'navbar.php'; // Optional: your navigation bar ?>

<div class="container mt-4">
    <h2 class="mb-4">Admin Dashboard</h2>

    <div class="row">
        <!-- Total Elections -->
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Elections</h5>
                    <p class="card-text">
                        <?php
                        $election = $conn->query("SELECT COUNT(*) AS total FROM positions");
                        echo $election->fetch_assoc()['total'];
                        ?>
                    </p>
                </div>
            </div>
        </div>

        <!-- Total Candidates -->
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Candidates</h5>
                    <p class="card-text">
                        <?php
                        $candidates = $conn->query("SELECT COUNT(*) AS total FROM candidates");
                        echo $candidates->fetch_assoc()['total'];
                        ?>
                    </p>
                </div>
            </div>
        </div>

        <!-- Total Voters -->
        <div class="col-md-3">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Voters</h5>
                    <p class="card-text">
                        <?php
                        $voters = $conn->query("SELECT COUNT(*) AS total FROM voters");
                        echo $voters->fetch_assoc()['total'];
                        ?>
                    </p>
                </div>
            </div>
        </div>

        <!-- Total Votes -->
        <div class="col-md-3">
            <div class="card text-white bg-danger mb-3">
                <div class="card-body">
                    <h5 class="card-title">Votes Cast</h5>
                    <p class="card-text">
                        <?php
                        $votes = $conn->query("SELECT COUNT(*) AS total FROM votes");
                        echo $votes->fetch_assoc()['total'];
                        ?>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Links -->
    <div class="row mt-4">
        <div class="col">
            <a href="positions.php" class="btn btn-outline-primary me-2">Manage Elections</a>
            <a href="candidates.php" class="btn btn-outline-success me-2">Manage Candidates</a>
            <a href="voters.php" class="btn btn-outline-warning me-2">Manage Voters</a>
            <a href="ballot.php" class="btn btn-outline-info me-2">View Ballot</a>
            <a href="votes_reset.php" class="btn btn-outline-danger">Reset Votes</a>
        </div>
    </div>
</div>

</body>
</html>
