<?php
session_start();
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Establish database connection
        $conn = new mysqli('localhost', 'root', '', 'laundry_db');
        if ($conn->connect_error) {
            echo json_encode(['success' => false, 'title' => 'Connection Error', 'message' => 'Failed to connect to database.']);
            exit();
        }

        // Fetch user by username
        $stmt = $conn->prepare("SELECT * FROM user WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt_result = $stmt->get_result();

        if ($stmt_result->num_rows > 0) {
            $data = $stmt_result->fetch_assoc();

            // Verify the password
            if (password_verify($password, $data['password'])) {
                $_SESSION['user_role'] = $data['user_role'];
                $_SESSION['username'] = $data['username'];
                $_SESSION['user_id'] = $data['user_id'];

                // Update last_active on successful login
                $updateStmt = $conn->prepare("UPDATE user SET last_active = NOW(), user_status = 'active' WHERE user_id = ?");
                $updateStmt->bind_param("i", $data['user_id']);
                $updateStmt->execute();
                $updateStmt->close();

                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'title' => 'Mismatch password', 'message' => 'The password you entered is incorrect!']);
            }
        } else {
            echo json_encode(['success' => false, 'title' => 'Invalid username or password', 'message' => 'No user found with that username!']);
        }

        $stmt->close();
        $conn->close();
    } else {
        echo json_encode(['success' => false, 'title' => 'Incomplete data', 'message' => 'Please enter both username and password!']);
    }
} else {
    echo json_encode(['success' => false, 'title' => 'Invalid access', 'message' => 'Please use the login form to access this page.']);
}
?>
