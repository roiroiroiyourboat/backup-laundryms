<?php
session_start();
$conn = new mysqli('localhost', 'root', '', 'laundry_db');

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

if(!isset($_SESSION['user_role'])) {
    header('location: /laundry_system/homepage/homepage.php');
    exit();
}

$user_role = $_SESSION['user_role'];

if ($_SESSION['user_role'] !== 'admin') {
    header('location: /laundry_system/homepage/homepage.php');
    exit();
} 

$search = "";
if(isset($_POST['search'])) {
    $search = $con->real_escape_string($_POST['search']);
    $query = "SELECT * FROM transaction WHERE customer_name LIKE '%$search%'
    OR transaction_id LIKE '%$search%' 
    OR laundry_service_option LIKE '%$search%' 
    OR laundry_category_option LIKE '%$search%'";
} else {
    $query = "SELECT * FROM transaction";
}

$result = mysqli_query($conn, $query);

if (!$result) {
    die("Query error: " . mysqli_error($con));
}

//table
$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="transaction.css">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="progress"></div>
    <div class="wrapper">
    <aside id="sidebar">
            <div class="d-flex">
                <button id="toggle-btn" type="button">
                    <i class="bx bx-menu-alt-left"></i>
                </button>

                <div class="sidebar-logo">
                    <a href="/laundry_system/dashboard/dashboard.php">Azia Skye</a>
                </div>
            </div>

            <ul class="sidebar-nav">
                <?php if($user_role === 'admin') : ?>
                    <li class="sidebar-item">
                        <a href="/laundry_system/dashboard/dashboard.php" class="sidebar-link" 
                            data-bs-toggle="tooltip"
                            data-bs-placement="right" 
                            data-bs-title="Dashboard">
                            <i class="lni lni-grid-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="/laundry_system/profile/profile.php" class="sidebar-link"
                            data-bs-toggle="tooltip"
                            data-bs-placement="right" 
                            data-bs-title="Profile">
                            <i class="lni lni-user"></i>
                            <span>Profile</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="/laundry_system/users/users.php" class="sidebar-link"
                            data-bs-toggle="tooltip"
                            data-bs-placement="right" 
                            data-bs-title="Users">
                            <i class="lni lni-users"></i>
                            <span>Users</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link has-dropdown collapsed" data-bs-toggle="collapse"
                            data-bs-target="#records" aria-expanded="false" aria-controls="records">
                            <i class="lni lni-files"></i>
                            <span>Records</span>
                        </a>

                        <ul id="records" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="/laundry_system/records/customer.php" class="sidebar-link">Customer</a>
                            </li>

                            <li class="sidebar-item">
                                <a href="/laundry_system/records/service.php" class="sidebar-link">Service</a>
                            </li>

                            <li class="sidebar-item">
                                <a href="/laundry_system/records/category.php" class="sidebar-link">Category</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item">
                        <a href="/laundry_system/transaction/transaction.php" class="sidebar-link"
                            data-bs-toggle="tooltip"
                            data-bs-placement="right" 
                            data-bs-title="Transactions">
                            <i class="lni lni-coin"></i>
                            <span>Transaction</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="/laundry_system/sales_report/report.php" class="sidebar-link"
                            data-bs-toggle="tooltip"
                            data-bs-placement="right" 
                            data-bs-title="Sales Report">
                            <i class='bx bx-line-chart'></i>
                            <span>Sales Report</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="/laundry_system/settings/settings.php" class="sidebar-link"
                            data-bs-toggle="tooltip"
                            data-bs-placement="right" 
                            data-bs-title="Settings">
                            <i class="lni lni-cog"></i>
                            <span>Settings</span>
                        </a>
                    </li>

                    <hr style="border: 1px solid #b8c1ec; margin: 8px">

                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link has-dropdown collapsed" data-bs-toggle="collapse"
                        data-bs-target="#archived" aria-expanded="false" aria-controls="archived">
                            <i class='bx bxs-archive-in'></i>
                            <span>Archived</span>
                        </a>

                        <ul id="archived" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="/laundry_system/archived/archive_users.php" class="sidebar-link">Archived Users</a>
                            </li>

                            <li class="sidebar-item">
                                <a href="/laundry_system/archived/archive_customer.php" class="sidebar-link">Archived Customer</a>
                            </li>

                            <li class="sidebar-item">
                                <a href="/laundry_system/archived/archive_service.php" class="sidebar-link">Archived Service</a>
                            </li>

                            <li class="sidebar-item">
                                <a href="/laundry_system/archived/archive_category.php" class="sidebar-link">Archived Category</a>
                            </li>
                        </ul>
                    </li>
                <?php endif; ?>
            </ul>

            <div class="sidebar-footer">
                <a href="javascript:void(0)" class="sidebar-link" id="btn_logout"
                    data-bs-toggle="tooltip"
                    data-bs-placement="right" 
                    data-bs-title="Logout">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
        
        <!-------------MAIN CONTENT------------->
        <div class="main-content">
            <nav>
                <div class="d-flex justify-content-between" id="navbar">
                    <h1>Transaction</h1>

                    <div class="search_bar" m-1>
                        <input class="form-control" type="text" id="filter_transaction" placeholder="Search transaction...">
                    </div>    
                </div>
            </nav>

            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-dark text-white">
                            <th>Transaction ID</th>
                            <th>Customer Name</th>
                            <th>Customer Address</th>
                            <th>Service Option Name</th>
                            <th>Laundry Cycle</th>
                            <th>Total Amount</th>
                            <th>Delivery Fee</th>
                            <th>Rush Fee</th>
                            <th>Amount Tendered</th>
                            <th>Change</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="transaction_table">
                        <?php
                        if (!empty($data)) {
                            foreach ($data as $row) {
                                echo "<tr>";
                                echo "<td>{$row['transaction_id']}</td>";
                                echo "<td>{$row['customer_name']}</td>";
                                echo "<td>{$row['customer_address']}</td>";
                                echo "<td>{$row['service_option_name']}</td>";
                                echo "<td>{$row['laundry_cycle']}</td>";
                                echo "<td>{$row['total_amount']}</td>";
                                echo "<td>{$row['delivery_fee']}</td>";
                                echo "<td>{$row['rush_fee']}</td>";
                                echo "<td>{$row['amount_tendered']}</td>";
                                echo "<td>{$row['money_change']}</td>";
                                echo "<td>
                                    <a href='javascript:void(0);' class='archive-btn' data-id='{$row['customer_id']}'>
                                    <i class='bx bxs-archive-in'></i></a>
                                </td>";
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='11'>No transactions found.</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>

            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center" id="pagination">
                    <!--PAGINATION LINK-->
                </ul>
            </nav>

            <div class="Archvmodal" id="archiveModal">
                <div class="modal-cnt">
                    <span class="close" id="closeArchiveModal">&times;</span>
                    <p>Do you want to archive this customer?</p>
                    <button type="button" id="confirmArchiveButton" class="btn btn-success">Yes</button>
                    <button type="button" id="cancelArchiveButton" class="btn btn-danger">No</button>
                </div>
            </div>

            <div class="Archvmodal" id="successModal">
                <div class="modal-cnt">
                    <span class="close" id="closeSuccessModal">&times;</span>
                    <p>You have successfully archived this customer's details.</p>
                    <button id="closeSuccessButton" class="btn btn-primary">OK</button>
                </div>
            </div>

            <div id="logoutModal" class="modal" style="display: none;">
                <div class="modal-cont">
                    <span class="close">&times;</span>
                    <h2 id="logoutText">Do you want to logout?</h2>
                    <div class="modal-buttons">
                        <button class="btn btn-no">No</button>
                        <a href="/laundry_system/homepage/logout.php" class="btn btn-yes">Yes</a>
                    </div>
                </div>
            </div>

        </div> <!-- closing tag of main content -->
    </div>
</body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="transaction.js"></script>

</html>