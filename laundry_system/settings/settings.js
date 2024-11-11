const hamburger = document.querySelector("#toggle-btn");

hamburger.addEventListener("click", function(){
    document.querySelector("#sidebar").classList.toggle("expand");
})

$(document).ready(function() {
    //fetch service(s) in settings
    function fetchServices() {
        fetch('get_services.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data); // For debugging
                let dropdown = document.getElementById('service');
                dropdown.innerHTML = '<option selected disabled>--Select Service--</option>'; //to clear existing option
                data.forEach(service => {
                    let option = document.createElement('option');
                    option.value = service.service_id;
                    option.textContent = service.laundry_service_option;
                    dropdown.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching services:', error));
    }
    fetchServices();

    $('#service').on('change', function() {
        const selectedServiceId = $(this).val();
        if (selectedServiceId) {
            window.location.href = `edit1.php?service_id=${selectedServiceId}`;
        }
    });

    //get services for setting a price
    function getServices() {
        fetch('get_services.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data); // For debugging
                let dropdown = document.getElementById('service_id');
                dropdown.innerHTML = '<option selected disabled>--Select Service--</option>'; //to clear existing option
                data.forEach(service => {
                    let option = document.createElement('option');
                    option.value = service.service_id;
                    option.textContent = service.laundry_service_option;
                    dropdown.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching services:', error));
    }
    getServices();

    function fetchCategories() {
        fetch('get_categ.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data); // For debugging
                let dropdown = document.getElementById('categ_id');
                dropdown.innerHTML = '<option selected disabled>--Select Category--</option>'; //to clear existing option
                data.forEach(category => {
                    let option = document.createElement('option');
                    option.value = category.category_id;
                    option.textContent = category.laundry_category_option;
                    dropdown.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching services:', error));
    }
    fetchCategories();

    $('#saveChangesBtn').on('click', function () {
        var serviceId = $('#service_id').val();
        var categoryId = $('#categ_id').val();
        var categoryPrice = $('#categ_price').val();
    
        console.log("Service ID:", serviceId);
        console.log("Category ID:", categoryId);
        console.log("Category Price:", categoryPrice);
    
        if (!serviceId || !categoryId || !categoryPrice) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Please fill out all fields.'
            });
            return;
        }
    
        $.ajax({
            url: 'insert_price.php',
            type: 'POST',
            data: {
                service_id: serviceId,
                categ_id: categoryId,
                categ_price: categoryPrice
            },
            success: function (response) {
                console.log("Response:", response); // Log the response to check the status
                if (response.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: response.message
                    }).then(() => {
                        $('#categ_price_modal').modal('hide');
                        $('#modal_set_price')[0].reset();
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.message
                    });
                }
            },
            error: function (xhr, status, error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'AJAX error: ' + error
                });
            }
        });
    });
    

    // $('#saveChangesBtn').on('click', function () {
    //     var serviceId = $('#service_id').val();
    //     var categoryId = $('#categ_id').val();
    //     var categoryPrice = $('#categ_price').val();

    //     if (!serviceId || !categoryId || !categoryPrice) {
    //         Swal.fire({
    //             icon: 'error',
    //             title: 'Error',
    //             text: 'Please fill out all fields.'
    //         });
    //         return;
    //     }

    //     $.ajax({
    //         url: 'insert_price.php',
    //         type: 'POST',
    //         data: {
    //             service_id: serviceId,
    //             categ_id: categoryId,
    //             categ_price: categoryPrice
    //         },
    //         success: function (response) {
    //             if (response.status === 'success') {
    //                 Swal.fire({
    //                     icon: 'success',
    //                     title: 'Success',
    //                     text: response.message
    //                 }).then(() => {
    //                     $('#modal_set_price').modal('hide');
    //                 });
    //             } else {
    //                 Swal.fire({
    //                     icon: 'error',
    //                     title: 'Error',
    //                     text: response.message
    //                 });
    //             }
    //         },
    //         error: function (xhr, status, error) {
    //             Swal.fire({
    //                 icon: 'error',
    //                 title: 'Error',
    //                 text: 'AJAX error: ' + error
    //             });
    //         }
    //     });
        
    // });

    //for logout
    const logoutModal = document.getElementById("logoutModal");
    const closeBtn = logoutModal.querySelector(".close");
    const noBtn = logoutModal.querySelector(".btn-no");

    $("#btn_logout").click(function(){
        $('#logoutModal').show();
    });

    // Close the modal when clicking the close button (×)
    if (closeBtn) {
        closeBtn.addEventListener("click", function() {
            logoutModal.style.display = "none"; // Hide the modal
        });
    }

    // Close the modal when clicking the 'No' button
    if (noBtn) {
        noBtn.addEventListener("click", function() {
            logoutModal.style.display = "none"; // Hide the modal
        });
    }

    // Close the modal when clicking outside the modal content
    window.addEventListener("click", function(event) {
        if (event.target === logoutModal) {
            logoutModal.style.display = "none"; // Hide the modal
        }
    });
});
