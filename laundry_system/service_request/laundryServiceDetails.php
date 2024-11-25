<?php
session_start(); 

$user_role = $_SESSION['user_role'];

if(!isset($_SESSION['user_role'])) {
    header('location: /laundry_system/homepage/homepage.php');
    exit();
}

date_default_timezone_set('Asia/Manila');

$conn = new mysqli('localhost', 'root', '', 'laundry_db');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT delivery_day, rush_delivery_day FROM settings WHERE setting_id = 1";
$result = $conn->query($sql);
$deliveryDays = 0;

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $deliveryDays = $row['delivery_day'];
    $rushDeliveryDays = $row['rush_delivery_day'];
}

$isRush = isset($_POST['rush']) && $_POST['rush'] == 'Rush'; 

//to set default delivery/pickup date based on rush status
$defaultDeliveryDay = date('Y-m-d', strtotime("+" . ($isRush ? $rushDeliveryDays : $deliveryDays) . " days"));

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Request</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
      <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="laundryServiceDetails.css">
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
                <?php if ($user_role === 'admin') : ?>
                    <li class="sidebar-item">
                        <a href="/laundry_system/service_request/laundryServiceDetails.php" class="sidebar-link">
                        <i class="fa-regular fa-bell"></i>
                            <span>Service Request</span>
                        </a>
                    </li>
                <?php endif; ?>

                <li class="sidebar-item">
                    <a href="/laundry_system/dashboard/dashboard.php" class="sidebar-link">
                        <i class="lni lni-grid-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="/laundry_system/profile/profile.php" class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span>Profile</span>
                    </a>
                </li>

                <?php if ($user_role === 'admin') : ?>
                    <li class="sidebar-item">
                        <a href="/laundry_system/users/users.php" class="sidebar-link">
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
                <?php endif; ?>

                <li class="sidebar-item">
                    <a href="/laundry_system/transaction/transaction.php" class="sidebar-link">
                        <i class="lni lni-coin"></i>
                        <span>Transaction</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="/laundry_system/sales_report/report.php" class="sidebar-link">
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
                <a href="#" id="btn_logout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!------- Main content ------->
        <div class="main-content">
            <nav>
                <div class="d-flex justify-content-between">
                    <h1>Service Request</h1>
                </div>
            </nav>

           <div class="service_form" id="service_form">
                <form method="post" class="form-container" id="form_id">
                    <div class="row">
                        <h3 class="text-center">Customer Details</h3>
                        <div class="col">
                            <label for="name" class="form-label">
                                <b>Customer Name</b>
                                <span class="info-icon" data-tooltip="Provide first and last name">i</span>
                            </label>
                            <input type="text" class="form-control" id="customer_name" name="customer_name"
                                placeholder="Enter customer name" autocomplete="off">
                        </div>

                        <div class="col">
                            <label for="contactNo" class="form-label">
                                <b>Contact Number</b>
                                <span class="info-icon" data-tooltip="Please use active mobile number">i</span>
                            </label>
                            <input type="tel" class="form-control" id="contact_number" name="contact_number"
                            placeholder="Enter contact number" autocomplete="off"  maxlength="11" oninput="validateContactNumber(this)">
                        </div>
                    </div>

                    <div class="row">
                    <h5 class="text-center">Laundry Information</h5>
                    <div class="col">
                        <label for="qty" class="form-label"><b>Quantity of laundry bags</b></label>
                        <select name="quantity" class="form-control">
                            <option selected>--Select Quantity--</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="service" class="form-label"><b>Laundry Service</b></label>
                        <select name="service" class="form-control" id="service">
                            <option selected disabled>--Select Service--</option>
                        </select>
                    </div>

                    <div class="col">
                        <label for="category" class="form-label"><b>Laundry Category</b></label>
                        <select name="category" class="form-control" id="category">
                            <option selected disabled>--Select Category--</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="weight" class="form-label"><b>Weight(kg)</b></label>
                        <input type="number" class="form-control" step="0.01" id="weight" name="weight" autocomplete="off" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="price" class="form-label"><b>Price</b></label>
                        <input type="number" class="form-control" id="price" name="price" autocomplete="off" readonly>
                    </div>
                </div>

                <div class="buttons">
                    <button type="button" class="btn btn-danger" id="btnCancel">Cancel</button>
                    <button type="submit" class="btn btn-primary" id="btnSubmit" >Add to list</button>
                    <button type="button" class="btn btn-success" id="doneButton">Done</button>
                </div>
           </div> <!-- service form -->
        </div> <!-- main content -->
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="laundryServiceDetails.js"></script>
</body>
</html>