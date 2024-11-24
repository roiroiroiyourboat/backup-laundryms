<?php
ini_set('display_errors', 0);
ini_set('log_errors', 1);
error_log("Entering update_user.php"); // Log when script starts

require_once('users_db.php');
header('Content-Type: application/json');

$response = array('success' => false);

if ($con->connect_error) {
    error_log("Database connection error: " . $con->connect_error);
    $response['error'] = 'Database connection error. Please try again later.';
    echo json_encode($response);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_POST['user_id'] ?? null;
    $username = $_POST['username'] ?? null;
    $first_name = $_POST['first_name'] ?? null;
    $last_name = $_POST['last_name'] ?? null;
    $user_role = $_POST['user_role'] ?? null;

    // Validate input
    if (empty($user_id) || empty($username) || empty($first_name) || empty($last_name) || empty($user_role)) {
        $response['error'] = 'All fields are required.';
        echo json_encode($response);
        exit();
    }

    // Update user in the database
    $stmt = $con->prepare("UPDATE users SET username = ?, first_name = ?, last_name = ?, user_role = ? WHERE user_id = ?");
    if (!$stmt) {
        error_log("Prepare failed: " . $con->error);
        $response['error'] = 'Query preparation failed. Please try again later.';
        echo json_encode($response);
        exit();
    }

    $stmt->bind_param("ssssi", $username, $first_name, $last_name, $user_role, $user_id);

    if ($stmt->execute()) {
        $response['success'] = true;
    } else {
        error_log("Execution failed: " . $stmt->error);
        $response['error'] = 'Update failed. Please try again later.';
    }

    $stmt->close();
    echo json_encode($response);
    exit();
} else {
    $response['error'] = 'Invalid request method.';
    echo json_encode($response);
    exit();
}
?>