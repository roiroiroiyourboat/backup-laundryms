<?php
// Connect to the database
$conn = mysqli_connect("localhost", "root", "", "laundry_db");

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Check if option_id and d_categoryID are provided
if (isset($_GET['option_id']) && isset($_GET['d_categoryID'])) {
  $serviceOptionId = $_GET['option_id'];
  $deliveryCategoryId = $_GET['d_categoryID'];

  // Prepare the SQL statement to fetch price based on option_id and d_categoryID
  $stmt = mysqli_prepare($conn, "SELECT price FROM service_option_price WHERE option_id = ? AND d_categoryID = ?");
  mysqli_stmt_bind_param($stmt, "ii", $serviceOptionId, $deliveryCategoryId);
  mysqli_stmt_execute($stmt);
  $result = mysqli_stmt_get_result($stmt);

  // Check if a row was found
  if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $price = $row['price'];
    echo json_encode(['price' => $price, 'error' => 0]);
  } else {
    echo json_encode(['error' => 1, 'message' => 'Price not found']);
  }
} else {
  echo json_encode(['error' => 1, 'message' => 'Service or category ID not provided']);
}

// Close the database connection
mysqli_close($conn);
?>