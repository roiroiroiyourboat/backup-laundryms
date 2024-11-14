<?php
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
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Azia Skye's Laundry | Homepage </title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="homepage.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    
</head>

<body>
    <!--NAV BAR-->
    <header class="header">
        <nav class="navbar">
            <img src="/laundry_system/images/laundry_logo.png" class="laundry_icon">
                <div class="logo">Azia Skye's Laundry</div>
                    <ul class="nav-links">
                        <li><a href="#home">Home</a></li>
                        <li><a href="#about_us">About Us</a></li>
                        <li><a href="#contact">Contact</a></li>
                        <li><a href="#home">
                            <button class="button" id="openService">Service Request</button>
                        </a></a></li>
                        <li><a href="#home">
                            <button class="button" id="form_open">Login</button>
                        </a></li>
                    </ul>
                </div>
                <div class="burger">
                    <div class="line1"></div>
                    <div class="line2"></div>
                    <div class="line3"></div>
                </div>
        </nav>
            <div class="progress"></div>
    </header>
    
    <!--HOME-->
    <section class="home" id="home">
        <div class="content">
            <div class="home-content">
                <h1>We wash, you wear, and enjoy your weekend!</h1>
            </div>
            <img src="/laundry_system/images/laundry_home.svg" alt="Laundry Home">
        </div>

        <!--LOGIN-->
        <div class="form_container" id="form_container">
                <div class = "login_form">
                    <div class="logo_header">
                        <header>
                            <img src="/laundry_system/images/laundry_logo.png" alt="logo">      
                        </header>
                        <button type="button" class="btnClose" onclick="closeForm()"><i class='bx bx-x bx-rotate-90'></i></button>
                        <h4>Login</h3>
                        <h6>Welcome back!</h6>
                    </div>

                    <form id="loginForm">
                        <div class="row">
                            <div class="col">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                        </div>
                            
                        <div class="row">
                            <div class="col">
                                <label for="pass" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>

                        <div class="links">
                            <span><a href="#" id="forgotPass" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">Forgot Password? </a></span>
                        </div>

                            <div class="input-box">
                                <input type="submit" class="btn" value="Login">
                            </div>
                    </form>
                </div>
        </div>

        <!----------------FORGOT PASSWORD---------------------->
        <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="forgotPasswordModalLabel">Forgot your password?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="forgotPasswordForm">
                            <p class="text-center">Please input your username and your answer to reset your password.</p>
                            <div class="mb-3">
                                <input id="reset_pass_username" type="text" class="form-control" placeholder="Enter your username">
                            </div>
                            <div class="mb-3">
                                <input id="question" type="text" class="form-control" placeholder="Security Question" readonly>
                            </div>
                            <div class="mb-3">
                                <input id="answer" type="text" class="form-control" placeholder="Enter your answer">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" id="submitForgotPassword" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--POP UP LAUNDRY SERVICE FORM-->
        <div class="service_form" id="service_form">
            <form method="post" class="form-container" id="form_id">
                <div class="logo_header">
                    <header>
                        <img src="/laundry_system/images/laundry_logo.png" alt="logo">    
                    </header>
                    <h5 class="text-center">Service Request</h5>
                    <button type="button" class="btnClose" onclick="closeForm()"><i class='bx bx-x bx-rotate-90'></i></button>
                </div>
                <hr style="border: 1px solid #b8c1ec; margin: 16px"> <!--this line will create a horizontal line-->
                
                <div class="row">
                    <h5 class="text-center">Customer Details</h5>
                    <div class="col">
                        <label for="name" class="form-label">
                            <b>Customer Name</b>
                            <span class="info-icon" data-tooltip="Provide first and last name">i</span>
                        </label>
                        <input type="text" class="form-control" id="customer_name" name="customer_name"
                            placeholder="Enter customer name" autocomplete="off" required>
                    </div>

                    <div class="col">
                        <label for="contactNo" class="form-label">
                            <b>Contact Number</b>
                            <span class="info-icon" data-tooltip="Please use active phone number">i</span>
                        </label>
                        <input type="tel" class="form-control" id="contact_number" name="contact_number"
                            placeholder="Enter contact number" autocomplete="off"  maxlength="11" oninput="validateContactNumber(this)" required>
                    </div>
                </div>

                <div class="row">
                    <h5 class="text-center">Laundry Information</h5>
                    <div class="col">
                        <label for="qty" class="form-label"><b>Quantity of laundry bags</b></label>
                        <select name="quantity" class="form-select">
                            <option selected disabled>--Select Quantity--</option>
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
                        <select name="service" class="form-select" id="service">
                            <option selected disabled>--Select Service--</option>
                        </select>
                    </div>

                    <div class="col">
                        <label for="category" class="form-label"><b>Laundry Category</b></label>
                        <select name="category" class="form-select" id="category">
                            <option selected disabled>--Select Category--</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="weight" class="form-label"><b>Weight(kg)</b></label>
                        <input type="number" class="form-control" step="0.01" id="weight" name="weight" autocomplete="off">
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="price" class="form-label"><b>Price</b></label>
                        <input type="number" class="form-control" id="price" name="price" autocomplete="off" readonly required>
                    </div>
                </div>

                <div class="buttons">
                    <button type="button" class="btn btn-danger" id="btnCancel">Cancel</button>
                    <button type="submit" class="btn btn-primary" id="btnSubmit" >Add to list</button>
                    <button type="button" class="btn btn-success" id="doneButton">Done</button>
                </div>
        </div>

        <!--------------- SERVICE OVERVIEW--------------->
        <div class="service_overview" id="service_overview">
            <div class="overview_container">
                <div class="logo_header">
                    <header>
                        <img src="/laundry_system/images/laundry_logo.png">     
                    </header>
                    <h5 class="text-center">Service Request Overview</h5>
                    <button type="button" class="btnClose"><i class='bx bx-x bx-rotate-90'></i></button>
                </div>
                
                <hr style="border: 1px solid #b8c1ec; margin: 18px 0;"> 

                <div class="container mt-2" id="overview">
                    <h6 class="text-center">Customer Number: <span id="customer_id_display"></h5>
                    <div class="mb-4">
                        <div class="row">
                            <div class="col">
                                <h6>Customer Name: <span id="customer_name_display"></span></h6>
                            </div>
                            <div class="col">
                                <h6>Contact Number: <span id="contact_number_display"></span></h6>
                            </div>
                        </div> 
                    </div>
                                
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped ">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Quantity</th>
                                        <th>Service</th>
                                        <th>Category</th>
                                        <th>Weight (kg)</th>
                                        <th>Price (₱)</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                            <tbody id="order_list">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="buttons">
                    <button type="button" class="btn btn-secondary" id="btnBack">Back</button>
                    <button type="button" class="btn btn-success" id="btnProceed">Proceed</button>
                    <button type="button" class="btn btn-danger" id="btnCancel_service">Cancel</button>
                </div>
            </div>
        </div>

        <!---------------LAUNDRY SERVICE DETAILS---------------------->
        <div class="service_details" id="service_details">
            <div class="service_req_container">
                <form method="post" class="form-container" id="form-service">
                    <div class="logo_header">
                        <header>
                            <img src="/laundry_system/images/laundry_logo.png" alt="logo">
                        </header>
                        <h5 class="text-center">Service Request</h5>
                        <button type="button" class="btnClose"><i class='bx bx-x bx-rotate-90'></i></button>
                    </div>

                    <hr style="border: 1px solid #b8c1ec; margin: 18px 0;"> 

                    <!----CUSTOMER DETAILS---->
                    <input type="hidden" id="customer_id_hidden" name="customer_id">
                    <input type="hidden" id="service_request_id_hidden" name="service_request_id">
                    <input type="hidden" id="customer_name_hidden" name="customer_name_hidden">
                    <input type="hidden" id="contact_number_hidden" name="contact_number_hidden">

                    <div class="row">       
                        <h5 class="text-center">Service Details</h5>
                        <div class="col">
                            <label for="service_option" class="form-label"><b>Service Option</b></label>
                            <select name="service_option" class="form-select" id="service_option" required>
                                <option selected>--Select Option--</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">                            
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Rush" id="rush" name="rush">
                                <label class="form-check-label" for="rush"><b>Rush</b></label>
                                <div class="form-text">Get your order delivered as soon as possible.</div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="address" class="form-label"><b>Address</b></label>
                            <div class="form-text">
                                Note: If you have selected delivery, kindly provide your address.
                            </div>
                            <textarea class="form-control" id="address" name="address" rows="2"
                            placeholder="Block, Lot, Street, and Subdivision" ></textarea>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <select class="form-select" aria-label="province" name="province" id="province">
                                <option selected disabled>Province</option>
                                <option value="bulacan">Bulacan</option>
                            </select>
                        </div>

                        <div class="col">
                            <select class="form-select" aria-label="city" name="city" id="city">
                                <option selected disabled>City</option>
                                <option value="sjdm">San Jose del Monte</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <select class="form-select" aria-label="brgy" name="brgy" id="barangaySelect" required>
                                <option selected disabled>Barangay</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="pick/delivery date" class="form-label"><b>Pickup/Delivery Date</b></label>
                            <input type="date" class="form-control" id="pickup_date" name="pickup_date" value="<?php echo $defaultDeliveryDay; ?>">
                        </div>
                    </div>

                    <div class="row">
                        <h5 class="text-center">Charges</h5>
                        <div class="col">
                            <label for="delivery_fee" class="form-label"><b>Delivery Fee</b></label>
                            <input type="number" class="form-control" id="delivery_fee" name="delivery_fee"
                                autocomplete="off" readonly>
                        </div>
                        
                        <div class="col">
                            <label for="rush_fee" class="form-label"><b>Rush Fee</b></label>
                            <input type="number" class="form-control" id="rush_fee" name="rush_fee" autocomplete="off" readonly>
                        </div>
                    </div>

                    <hr style="margin: 16px;">

                    <div class="row">
                        <div class="col">
                            <label for="total_amount" class="form-label"><b>Total Amount</b></label>
                            <input type="number" class="form-control" id="total_amount" name="total_amount"
                                autocomplete="off" readonly>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="amount_tendered" class="form-label"><b>Amount Tendered</b></label>
                            <input type="number" class="form-control" id="amount_tendered" name="amount_tendered"
                                autocomplete="off">
                        </div>

                        <div class="col">
                            <label for="change" class="form-label"><b>Change</b></label>
                            <input type="number" class="form-control" id="change" name="change"
                                autocomplete="off" readonly>
                        </div>
                    </div>

                    <div class="buttons">
                        <button type="button" class="btn btn-danger" id="btnCancel_service_details">Cancel</button>
                        <button type="button" class="btn btn-success" id="btnDone_service">Done</button>
                    </div>
                </form>
            </div>
        </div> <!--END OF SERVICE DETAILS-->

        <!-------INVOICE-------->
        <div class="print_invoice" id="print_invoice" style="display:none;">
            <div class="invoice_container" id="invoice_container">
                <div class="logo_header">
                    <h5 class="text-center">Azia Skye's Laundry <br>
                        <span>Verde Heights, City of San Jose del Monte, Bulacan</span> <br>
                        <span>0995-062-8516 / 0991-370-9729</span>
                    </h5>
                </div>
                <hr>
                
                <div id="invoice-details" class="mb-4">
                    <h6>Customer No: <span id="invoice_customer_id_hidden"></span></h6>

                    <div class="row">
                        <div class="col">
                            <h6>Name: <span id="invoice_name"></span></h6>
                        </div>

                        <div class="col">
                            <h6>Date: <span id="invoice_date"></span></h6>

                        </div>
                    </div>

                    <h6>Contact Number: <span id="invoice_contact_number"></span></h6>
                    <h6>Address: <span id="invoice_address"></span></h6>
                    
                    <div class="table-responsive">
                        <h5>Service Details</h5>
                        <table class="table table-bordered" id="services-table">
                            <thead>
                                <tr>
                                    <th>Service</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Weight</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Service details will be inserted here -->
                            </tbody>
                        </table>
                    </div>
                    
                    <h6>Service Type: <span id="invoice_service_type"></span></h6>
                    <h6>Pickup/Delivery Date: <span id="invoice_pickup_delivery_date"></span></h6>

                    <button type="button" class="btn btn-primary" id="print_invoice_btn" style="display: none;">Print Invoice</button>
                </div>

            </div>
        </div>

    </section>

    <!--ABOUT US-->
    <section class="about-us" id="about_us">
        <div class="aboutUs-content">
            <h1>ABOUT US</h1>
            <h3 class="text-center">Laundry Service for your convenience</h3>

            <div class="about-us-pro">
                <div class="card-container">
                    <div class="card">
                        <img src="/laundry_system/images/expert_cleaner.png" class="zoom-image">
                        <div class="card-content">
                            <h2>Expert Cleaner</h2>
                        </div>
                    </div>


                    <div class="card">
                        <img src="/laundry_system/images/affordable_price.png" class="zoom-image">
                        <div class="card-content">
                            <h2>Affordable Price</h2>
                        </div>
                    </div>

                    <div class="card">
                        <img src="/laundry_system/images/delivery.png" class="zoom-image">
                        <div class="card-content">
                            <h2>Delivery</h2>
                        </div>
                    </div>
                </div> <!--end of card container-->
            </div>

            <!--OUR SERVICES-->
            <h1 class="text-center">OUR SERVICES AND RATES</h1>
            <div class="our-services">
                <div class="card-container2">
                    <div class="card2">
                        <img src="/laundry_system/images/service-WDF.png" class="zoom-image">
                        <div class="card-content">
                            <h3>Wash/Dry/Fold</h3>
                            <h4>Minimum 5/kilos</h4>
                            <table class="table table-bordered">
                                <tr>
                                    <td> Clothes, Table Napkin, Pillowcase</td>
                                    <td class="table-danger"> ₱35</td>
                                </tr>
                                <tr>
                                    <td> Bedsheets, Table Cloths, Curtains</td>
                                    <td class="table-danger"> ₱55</td>
                                </tr>
                                <tr>
                                    <td>Comforter, Bath Towel</td>
                                    <td class="table-danger"> ₱65</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="card2">
                        <img src="/laundry_system/images/service-WDP.png" class="zoom-image">
                        <div class="card-content">
                            <h3>Wash/Dry/Press</h3>
                            <h4>Minimum 5/kilos</h4>
                            <table class="table table-bordered">
                                <tr>
                                    <td> Clothes, Table Napkin, Pillowcase</td>
                                    <td class="table-danger"> ₱80</td>
                                </tr>
                                <tr>
                                    <td> Bedsheets, Table Cloths, Curtains</td>
                                    <td class="table-danger"> ₱100</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="card2">
                        <img src="/laundry_system/images/service-D.png" class="zoom-image">
                        <div class="card-content">
                            <h3>Dry Only</h3>
                            <h4>Minimum 5/kilos</h4>
                            <table class="table table-bordered">
                                <tr>
                                    <td> Clothes, Table Napkin, Pillowcase</td>
                                    <td class="table-danger"> ₱35</td>
                                </tr>
                                <tr>
                                    <td> Bedsheets, Table Cloths, Curtains</td>
                                    <td class="table-danger"> ₱45</td>
                                </tr>
                                <tr>
                                    <td>Comforter, Bath Towel</td>
                                    <td class="table-danger"> ₱55</td>
                                </tr>
                            </table>
                        </div> <!--CLOSING card-content-->
                    </div> <!--CLOSING card2-->
                </div> <!--CLOSING CARD CONTAINER2-->
            </div> <!--CLOSING OUR SERVICES-->
        </div> <!-- CLOSING aboutUs-content-->
    </section>

    <!--footer-->
    <footer>
        <div class="footer-container" id="contact">
            <div class="footer-section">
                <div class="business_name">
                    <h1>AZIA SKYE'S LAUNDRY SHOP</h1>
                </div>
            </div>

            <div class="footer-section">
                <h2>BUSINESS HOURS</h2>
                <p><strong>MONDAY TO SUNDAY</strong> <br> 8:00 AM - 6:00 PM</p>
            </div>

            <div class="footer-section">
                <h2>CONTACT US</h2>
                <div class="call">
                    <i class='bx bxs-phone-call'></i>
                    <p>0995-062-8516 <br> 0991-370-9729</p>
                </div>
            </div>

            <div class="footer-section">
                <h2>OUR LOCATION</h2>
                <div class="map-container">
                    <h5>Verde Heights, City of San Jose del Monte, Bulacan</h5>
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15429.758101734158!2d121.0463696!3d14.8005702!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397afa59f7a236b%3A0xeedc8d815ddd4067!2sBrent%20Erwin!5e0!3m2!1sen!2sph!4v1717215267505!5m2!1sen!2sph"
                        width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </footer>

    <script>
        //to handle the date dynamically when rush is checked
        document.getElementById('rush').addEventListener('change', function() {
            const pickupDateInput = document.getElementById('pickup_date');
            const rushDeliveryDays = <?php echo json_encode($rushDeliveryDays); ?>; //day(s) for rush delivery
            const deliveryDays = <?php echo json_encode($deliveryDays); ?>; //regualr delivery days

            //ro calculate the new pickup date
            const daysToAdd = this.checked ? rushDeliveryDays : deliveryDays;
            const newDate = new Date();
            newDate.setDate(newDate.getDate() + parseInt(daysToAdd));

            //tp format the date to YYYY-MM-DD for the input
            const formattedDate = newDate.toISOString().split('T')[0];
            pickupDateInput.value = formattedDate;
        });

        async function connectToPrinter() {
            const statusElem = document.getElementById('status');
            try {
                statusElem.innerHTML = "Preparing to print receipt...";

                // Collect invoice details from the DOM
                const customerNumberElem = document.getElementById('invoice_customer_id_hidden');
                const customerNameElem = document.getElementById('invoice_name');
                const invoiceDateElem = document.getElementById('invoice_date');
                const contactNumberElem = document.getElementById('invoice_contact_number');
                const addressElem = document.getElementById('invoice_address');
                const serviceTypeElem = document.getElementById('invoice_service_type');
                const pickupDeliveryDateElem = document.getElementById('invoice_pickup_delivery_date');

                // Check if any element is null and handle the error
                if (!customerNumberElem || !customerNameElem || !invoiceDateElem || 
                    !contactNumberElem || !addressElem || !serviceTypeElem || 
                    !pickupDeliveryDateElem) {
                    throw new Error('One or more required elements are missing in the DOM.');
                }

                // Access text content
                const customerNumber = customerNumberElem.textContent;
                const customerName = customerNameElem.textContent;
                const invoiceDate = invoiceDateElem.textContent;
                const contactNumber = contactNumberElem.textContent;
                const address = addressElem.textContent;
                const serviceType = serviceTypeElem.textContent;
                const pickupDeliveryDate = pickupDeliveryDateElem.textContent;

                // Prepare the invoice text
                let invoiceText = 
                    "Azia Skye's Laundry\n" +
                    "Verde Heights, City of San Jose del Monte, Bulacan\n" +
                    "0995-062-8516 / 0991-370-9729\n" +
                    "Customer No: " + customerNumber + "\n" +
                    "Name: " + customerName + "\n" +
                    "Date: " + invoiceDate + "\n" +
                    "Contact Number: " + contactNumber + "\n" +
                    "Address: " + address + "\n" +
                    "-----------------------------\n" +
                    "Service Details\n" +
                    "-----------------------------\n";

                // Add service details from the table
        // Add service details from the table
        const servicesTable = document.querySelectorAll("#services-table tbody tr");
        servicesTable.forEach(row => {
            const service = row.cells[0]?.textContent || ""; 
            const category = row.cells[1]?.textContent || "";
            const quantity = row.cells[2]?.textContent ? row.cells[2].textContent + " bag " : ""; 
            const weight = row.cells[3]?.textContent ? row.cells[3].textContent + " kg " : ""; 
            const price = row.cells[4]?.textContent ? row.cells[4].textContent + " php \n" : ""; 

            // Create a separate line for service and category
            invoiceText += service + " " + category; // Use <br> for line break in HTML
            invoiceText += quantity + weight + price + "\n"; // Use <br> for line break in HTML
        });



                invoiceText += 
                    "-----------------------------\n" +
                    "Service Type: " + serviceType + "\n" +
                    "Pickup/Delivery Date: " + pickupDeliveryDate + "\n\n\n";

                // Connect to the Bluetooth printer
                const device = await navigator.bluetooth.requestDevice({
                    filters: [{ name: 'POS58D55E3' }],
                    optionalServices: ['e7810a71-73ae-499d-8c15-faa9aef0c3f2'] // Printer's service UUID
                });

                const server = await device.gatt.connect();
                const service = await server.getPrimaryService('e7810a71-73ae-499d-8c15-faa9aef0c3f2');
                const characteristic = await service.getCharacteristic('bef8d6c9-9c21-4c9e-b632-bd58c1009f9f');

                // Prepare the data to send to the printer
                const encoder = new TextEncoder();
                const invoiceBytes = encoder.encode(invoiceText);
                const chunkSize = 128; 

                // Send the invoice text to the printer in chunks
                for (let i = 0; i < invoiceBytes.length; i += chunkSize) {
                    const chunk = invoiceBytes.slice(i, i + chunkSize);
                    await characteristic.writeValue(chunk);
                    await new Promise(resolve => setTimeout(resolve, 100)); // 100 ms delay
                }

                statusElem.innerHTML = "Invoice printed successfully!";

                setTimeout(() => {
            location.reload();
        }, 2000);
            } catch (error) {
                console.error('Error:', error);
                statusElem.innerHTML = "Failed to print. Please try again.";
            }
        }

        document.getElementById('print_invoices').addEventListener('click', function() {
            connectToPrinter();
        });

    function fetchWeight() {
        fetch('http://192.168.100.189/weight') 
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                const weightInput = document.getElementById('weight');
                
                if (data && data.weight !== undefined) {
                    weightInput.value = data.weight; 
                } else {
                    weightInput.value = ''; 
                }
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);
                document.getElementById('weight').value = ''; 
            });
    }
    setInterval(fetchWeight, 1000);
        
    </script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="homepage.js"></script>
</body>

</html>