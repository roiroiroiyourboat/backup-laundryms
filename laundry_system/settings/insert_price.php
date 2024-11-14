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
            $check_sql = "SELECT COUNT(*) as count FROM service_category_price WHERE service_id = ? AND category_id = ?";
            $check_stmt = $conn->prepare($check_sql);

            if ($check_stmt) {
                $check_stmt->bind_param("ii", $service_id, $categ_id);
                $check_stmt->execute();
                $check_result = $check_stmt->get_result();
                $row = $check_result->fetch_assoc();
                
                if ($row['count'] > 0) {
                    echo json_encode(["status" => "error", "message" => "This category already exists for the selected service."]);
                } else {
                    //no duplicates, proceed
                    $insert_sql = "INSERT INTO service_category_price (service_id, category_id, price) VALUES (?, ?, ?)";
                    $insert_stmt = $conn->prepare($insert_sql);

                    if ($insert_stmt) {
                        $insert_stmt->bind_param("iid", $service_id, $categ_id, $categ_price);
                        
                        if ($insert_stmt->execute()) {
                            echo json_encode(["status" => "success", "message" => "Price added successfully!"]);
                        } else {
                            echo json_encode(["status" => "error", "message" => "Failed to insert data: " . $insert_stmt->error]);
                        }
                        
                        $insert_stmt->close();
                    } else {
                        echo json_encode(["status" => "error", "message" => "Failed to prepare statement: " . $conn->error]);
                    }
                }

                $check_stmt->close();
            } else {
                echo json_encode(["status" => "error", "message" => "Failed to prepare check statement: " . $conn->error]);
            }
        } else {
            echo json_encode(["status" => "error", "message" => "Validation error: Missing required fields"]);
        }
        
        $conn->close();
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid request method"]);
    }
?>
