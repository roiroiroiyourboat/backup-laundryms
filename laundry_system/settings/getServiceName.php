<?php
if (isset($_GET['service_id'])) {
    $serviceId = $_GET['service_id'];
    $conn = new mysqli('localhost', 'root', '', 'laundry_db');

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT laundry_service_option FROM service WHERE service_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $serviceId);
    $stmt->execute();
    $result = $stmt->get_result();
    $service = $result->fetch_assoc();

    echo json_encode($service);
}
?>
