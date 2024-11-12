<?php
session_start(); 

$user_role = $_SESSION['user_role'];

if(!isset($_SESSION['user_role'])) {
    header('location: /laundry_system/homepage/homepage.php');
    exit();
}

$conn = new mysqli('localhost', 'root', '', 'laundry_db');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve current settings from the database
$sql = "SELECT min_kilos, delivery_day, rush_delivery_day FROM settings";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

$sqlServiceOption = "SELECT price FROM service_option_price WHERE service_option_type = 'Delivery'";
$resultDelivery = mysqli_query($conn, $sqlServiceOption);
$rowDelivery = mysqli_fetch_assoc($resultDelivery);
$delivery_charge = $rowDelivery['price'];

$sqlServiceOption = "SELECT price FROM service_option_price WHERE service_option_type = 'Delivery (within gaya-gaya)'";
$resultDelivery = mysqli_query($conn, $sqlServiceOption);
$rowDelivery = mysqli_fetch_assoc($resultDelivery);
$d_fee_gaya = $rowDelivery['price'];

$sqlServiceOption = "SELECT price FROM service_option_price WHERE service_option_type = 'Rush'";
$resultPickup = mysqli_query($conn, $sqlServiceOption);
$rowPickup = mysqli_fetch_assoc($resultPickup);
$rush_charge = $rowPickup['price'];

$minimum_kilos = $row['min_kilos'];
$delivery_day = $row['delivery_day'];
$rush_delivery_day = $row['rush_delivery_day'];

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $minimum_kilos = $_POST['min_kilos'];
    $delivery_day = $_POST['delivery_day'];
    $rush_delivery_day = $_POST['rush_delivery_day'];
    $delivery_charge = $_POST['delivery_charge'];
    $d_fee_gaya = $_POST['d_fee_gaya'];
    $rush_charge = $_POST['rush_charge'];

    $success = true;
    $errors = "";

    //to update min kilos and delivery period
    $sql = "UPDATE settings SET min_kilos='$minimum_kilos', delivery_day='$delivery_day', rush_delivery_day='$rush_delivery_day'";
    $result = mysqli_query($conn, $sql);
    if (!$result) {
        $success = false;
        $errors .= "Error updating settings: " . mysqli_error($conn) . "\n";
    }

    //to update delivery fee outside gaya gaya
    $sql = "UPDATE service_option_price SET price='$delivery_charge' WHERE service_option_type='Delivery'";
    $result = mysqli_query($conn, $sql);
    if (!$result) {
        $success = false;
        $errors .= "Error updating delivery charge: " . mysqli_error($conn) . "\n";
    }

    //to update delivery fee within gaya gaya
    $sql = "UPDATE service_option_price SET price='$d_fee_gaya' WHERE service_option_type='Delivery (within gaya-gaya)'";
    $result = mysqli_query($conn, $sql);
    if (!$result) {
        $success = false;
        $errors .= "Error updating delivery charge: " . mysqli_error($conn) . "\n";
    }

    //to update rush fee
    $sql = "UPDATE service_option_price SET price='$rush_charge' WHERE service_option_type='Rush'";
    $result = mysqli_query($conn, $sql);
    if (!$result) {
        $success = false;
        $errors .= "Error updating rush charge: " . mysqli_error($conn) . "\n";
    }

    // Return a JSON response to the frontend
    if ($success) {
        echo json_encode([
            'status' => 'success',
            'message' => 'Settings updated successfully!'
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => $errors
        ]);
    }
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="settings.css">
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
                    <a href="#">Azia Skye</a>
                </div>
            </div>

            <ul class="sidebar-nav">
                <li class="sidebar-item">
                    <a href="/laundry_system/dashboard/dashboard.php" class="sidebar-link">
                        <i class="lni lni-grid-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="/laundry_system/my_profile/profile.php" class="sidebar-link">
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
                        <a href="/laundry_system/records/records.php" class="sidebar-link has-dropdown collapsed" data-bs-toggle="collapse"
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
                        <a href="/laundry_system/settings/settings.php" class="sidebar-link">
                            <i class="lni lni-cog"></i>
                            <span>Settings</span>
                        </a>
                    </li>

                    <hr style="border: 1px solid #b8c1ec; margin: 8px">

                    <li class="sidebar-item">
                        <a href="/laundry_system/archived/archive_users.php" class="sidebar-link">
                            <i class='bx bxs-archive-in'></i>
                            <span class="nav-item">Archived</span>
                        </a>
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

        <!-------------MAIN CONTENT------------->
        <div class="main-content">
            <nav>
                <div class="d-flex justify-content-between align-items-center">
                    <h1>Settings</h1>
                </div>
            </nav>
            
            <div class="container">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-success me-md-2" type="button" id="set_price" data-bs-toggle="modal" data-bs-target="#categ_price_modal">
                    <i class='bx bxs-purchase-tag' ></i>
                    Set Price</button>
                </div
            </div>

            <div class="modal fade" id="categ_price_modal" tabindex="-1" aria-labelledby="category_price" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="label_categ">Set price for category</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="modal_set_price">
                                <div class="mb-3">
                                    <label for="serv_id" class="form-label"><b>Service: </b></label>
                                    <select class="form-select" aria-label="Service" name="service_id" id="service_id">
                                        <option selected disabled>--Select Service--</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="categ_id" class="form-label"><b>Category: </b></label>
                                    <select class="form-select" aria-label="Category" name="categ_id" id="categ_id">
                                        <option selected disabled>--Select Category--</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="categ_price" class="form-label"><b>Price: </b></label>
                                    <input type="number" class="form-control" id="categ_price" placeholder="Input price">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary"  id="saveChangesBtn">Save changes</button>
                        </div>
                        </div>
                    </div>
            </div>

            <div class="form-settings" id="mainForm">
                <form class="form-container" id="settingsForm" method="POST">
                    <div class="row">
                        <div class="col">
                            <label for="service" class="form-label"><b>Service: </b></label>
                            <select class="form-select" aria-label="Service" name="service" id="service">
                                <option selected disabled>--Select Service--</option>
                            </select>
                        </div>
                         <hr style="border: 1px solid #232946; margin: 8px 0">
                    </div>
                   

                    <div class="row">
                        <div class="col">
                            <label for="min_kilos" class="form-label"><b>Minimum Kilos:</b></label>
                            <input type="number" class="form-control" id="min_kilos" name="min_kilos" value="<?php echo $minimum_kilos ?>">
                        </div>

                        <div class="col">
                            <label for="rush_charge" class="form-label"><b>Rush Fee:</b></label>
                            <input type="number" class="form-control" id="rush_charge" name="rush_charge" value="<?php echo $rush_charge ?>">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                             <label for="delivery_date" class="form-label"><b>Delivery Period:</b></label>
                            <input type="number" class="form-control" id="delivery_day" name="delivery_day" value="<?php echo $delivery_day?>">
                        </div>

                        <div class="col">
                            <label for="rush_delivery_day" class="form-label"><b>Rush Delivery Period:</b></label>
                            <input type="number" class="form-control" id="rush_delivery_day" name="rush_delivery_day" value="<?php echo $rush_delivery_day?>">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                            <label for="delivery_charge" class="form-label"><b>Delivery Fee (outside Gaya-gaya): </b></label>
                            <input type="number" class="form-control" id="delivery_charge" name="delivery_charge" value="<?php echo $delivery_charge ?>">
                        </div>

                        <div class="col">
                            <label for="gaya-gaya" class="form-label"><b>Delivery Fee (within Gaya-gaya): </b></label>
                            <input type="number" class="form-control" id="d_fee_gaya" name="d_fee_gaya" 
                                value="<?php echo $d_fee_gaya ?>">
                        </div>
                    </div>          

                    <button type="submit" class="btn btn-success" id="submit_btn" name="submit">Submit</button>
                    
                </form>
            </div>

            <script>
                const form = document.getElementById('settingsForm');

                //form submission
                form.addEventListener('submit', function(event) {
                    event.preventDefault(); //prevent the default form submission behavior

                    //collect form data
                    const formData = new FormData(form);

                    //send form data using AJAX request
                    fetch('<?php echo $_SERVER['PHP_SELF']; ?>', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.status === 'success') {
                            Swal.fire({
                                title: 'Success!',
                                text: data.message,
                                icon: 'success',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        } else {
                            Swal.fire({
                                title: 'Error!',
                                text: data.message,
                                icon: 'error',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                    })
                    .catch(error => {
                        Swal.fire({
                            title: 'Error!',
                            text: 'An error occurred while submitting the form.',
                            icon: 'error',
                            showConfirmButton: false,
                            timer: 1500
                        });
                    });
                });
            </script>


            <div id="logoutModal" class="modal" style="display:none;">
                <div class="modal-cont">
                    <span class="close">&times;</span>
                    <h2 id="logoutText">Do you want to logout?</h2>
                    <div class="modal-buttons">
                        <a href="/laundry_system/homepage/logout.php" class="btn btn-yes">Yes</a>
                        <button class="btn btn-no">No</button>
                    </div>
                </div>
            </div>

         </div> <!--end of main -->
    </div>

</body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script type="text/javascript" src="settings.js"></script>

</html>