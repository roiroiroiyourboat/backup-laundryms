<?php
require_once('users_db.php');

$query = "SELECT * FROM users";
$result = mysqli_query($con, $query);

if (!$result) {
    die("Query error: " . mysqli_error($con));
}

// Generate table rows
while ($row = mysqli_fetch_assoc($result)) {
    $current_time = new DateTime();
    $last_active_time = new DateTime($row['last_active']);
    $interval = $current_time->diff($last_active_time);
    $user_status = ($interval->days < 30) ? 'Active' : 'Inactive';

    echo "<tr>";
    echo "<td>" . htmlspecialchars($row['user_id']) . "</td>";
    echo "<td>" . htmlspecialchars($row['username']) . "</td>";
    echo "<td>" . htmlspecialchars($row['first_name']) . "</td>";
    echo "<td>" . htmlspecialchars($row['last_name']) . "</td>";
    echo "<td>" . htmlspecialchars($row['user_role']) . "</td>";
    echo "<td>" . htmlspecialchars($row['last_active']) . "</td>";
    echo "<td>" . htmlspecialchars($row['user_status']) . "</td>";
    echo "<td>" . htmlspecialchars($row['date_created']) . "</td>";
    echo "<td><a href='javascript:void(0);' class='edit-btn' data-id='" . htmlspecialchars($row['user_id']) . "' data-username='" . htmlspecialchars($row['username']) . "' data-firstname='" . htmlspecialchars($row['first_name']) . "' data-lastname='" . htmlspecialchars($row['last_name']) . "' data-userrole='" . htmlspecialchars($row['user_role']) . "'><i class='bx bxs-edit'></i></a></td>";
    echo "<td><a href='javascript:void(0);' class='archive-btn' data-id='" . htmlspecialchars($row['user_id']) . "'><i class='bx bxs-archive-in'></i></a></td>";
    echo "</tr>";
}

$con->close();
?>