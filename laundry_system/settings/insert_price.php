<?php
header('Content-Type: application/json'); // Set header for JSON response
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$conn = new mysqli('localhost', 'root', '', 'laundry_db');

if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Database connection failed: " . $conn->connect_error]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $service_id = $_POST['service_id'] ?? null;
    $categ_id = $_POST['categ_id'] ?? null;
    $categ_price = $_POST['categ_price'] ?? null;

    if ($service_id && $categ_id && $categ_price) {
        $sql = "INSERT INTO service_category_price (service_id, category_id, price) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);

        if ($stmt) {
            $stmt->bind_param("iid", $service_id, $categ_id, $categ_price);
            
            // Execute and check if successful
            if ($stmt->execute()) {
                echo json_encode(["status" => "success", "message" => "Price added successfully!"]);
            } else {
                echo json_encode(["status" => "error", "message" => "Failed to insert data: " . $stmt->error]);
            }
            
            $stmt->close();
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to prepare statement: " . $conn->error]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Validation error: Missing required fields"]);
    }
    
    $conn->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method"]);
}
?>
