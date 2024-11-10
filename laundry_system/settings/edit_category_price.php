<?php
// edit_category.php

if (isset($_GET['service_id'])) {
    $serviceId = $_GET['service_id'];

    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'laundry_db');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM service_category_price scp
            INNER JOIN category c ON scp.category_id = c.category_id 
            WHERE service_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $serviceId);
    $stmt->execute();
    $result = $stmt->get_result();

    // Display service categories for editing
    while ($row = $result->fetch_assoc()) {
        // Output HTML for each category with editable fields
        echo "<div>{$row['laundry_category_option']} - Price: <input type='number' value='{$row['price']}' /></div>";
    }

    $stmt->close();
    $conn->close();
} else {
    echo "No service selected.";
}
?>
