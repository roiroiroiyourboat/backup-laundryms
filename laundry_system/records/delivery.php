 <?php
session_start();
require_once('delivery_db.php');

if(!isset($_SESSION['user_role'])) {
    header('location: /laundry_system/homepage/homepage.php');
    exit();
}

$user_role = $_SESSION['user_role'];

if ($_SESSION['user_role'] !== 'admin') {
    header('location: /laundry_system/homepage/homepage.php');
    exit();
} 

// queries
$query = "SELECT t.transaction_id, c.customer_id, c.customer_name, sr.laundry_service_option, sr.laundry_category_option,
          sr.quantity, sr.service_request_date, c.address, sr.request_date, sr.order_status, sr.remarks
          FROM transaction t JOIN customer c ON t.customer_id = c.customer_id
          JOIN service_request sr ON t.request_id = sr.request_id
          WHERE t.service_option_name = 'delivery' AND sr.remarks IN ('delivered', 'undelivered', 'pending')
          ORDER BY sr.request_date DESC";

$result = mysqli_query($con, $query);
?> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Records - Delivery</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="delivery.css">
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
                    <a href="#">Azia Skye</a>
                </div>
            </div>

            <ul class="sidebar-nav">
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

                <?php if ($user_role === 'admin') : ?>
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

                            <li class="sidebar-item">
                                <a href="/laundry_system/records/delivery.php" class="sidebar-link">Delivery</a>
                            </li>     
                            
                            <li class="sidebar-item">
                                <a href="/laundry_system/records/pickup.php" class="sidebar-link">Pick-upy</a>
                            </li>
                        </ul>
                    </li>
                <?php endif; ?>

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

                <?php if ($user_role === 'admin') : ?>
                    <li class="sidebar-item">
                        <a href="/laundry_system/settings/setting.php" class="sidebar-link">
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

        <div class="main-content">
            <nav>
                <div class="d-flex justify-content-between" id="navbar">
                    <h1>Records</h1>
                
                    <div class="search_bar" m-1>
                        <input class="form-control" type="text" id="filter_delivery" placeholder="Search delivery logs...">
                    </div>    
                </div>
            </nav>

            <div class="buttons">
                <div class="customer_button">
                   <a href="customer.php" class="button" id="customerBtn">Customer</a>
                </div>
                
                <div class="service_button">
                    <a href="service.php" class="button" id="serviceBtn">Service</a>
                </div>
            
                <div class="category_button">
                    <a href="category.php" class="button" id="categoryBtn">Category</a>
                </div>    
                
                <div class="delivery_button">
                    <a href="delivery.php" class="button" id="deliveryBtn"><b>Delivery</b></a>
                </div>   

                <div class="pickup_button">
                    <a href="pickup.php" class="button" id="pickupBtn">Pick-up</a>
                </div> 
            </div> <!-- buttons -->

            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-dark text-white">
                            <th>Transaction ID</th>
                            <th>Customer ID</th>
                            <th>Customer Name</th>
                            <th>Laundry Service</th>
                            <th>Laundry Category</th>
                            <th>Quantity</th>
                            <th>Service Request Date</th>
                            <th>Address</th>
                            <th>Request Date</th>
                            <th>Order Status</th>
                            <th>Remarks</th>
                        </tr>
                    </thead>
                    <tbody id = "delivery_table">
                       <?php
                        if ($result && mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <tr>
                            <td><?php echo $row['transaction_id']; ?></td>
                            <td><?php echo $row['customer_id']; ?></td>
                            <td><?php echo $row['customer_name']; ?></td>
                            <td><?php echo $row['laundry_service_option']; ?></td>
                            <td><?php echo $row['laundry_category_option']; ?></td>
                            <td><?php echo $row['quantity']; ?></td>
                            <td><?php echo $row['service_request_date']; ?></td>
                            <td><?php echo $row['address']; ?></td>
                            <td><?php echo $row['request_date']; ?></td>
                            <td><?php echo $row['order_status']; ?></td>
                            <td><?php echo $row['remarks']; ?></td>
                            </tr>
                        <?php
                            }
                       } else {
                        ?>
                            <tr>
                                <td colspan="10">No records found.</td>
                            </tr>
                        <?php
                       }
                       ?>
                    </tbody>
                </table>
            </div> <!-- table container -->

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

        </div> <!--main content-->
    </div> <!-- wrapper -->

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<script type="text/javascript" src="delivery.js"></script>


</html>
<?php
$con->close();
?>