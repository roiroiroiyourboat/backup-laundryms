const hamburger = document.querySelector("#toggle-btn");

hamburger.addEventListener("click", function(){
    document.querySelector("#sidebar").classList.toggle("expand");
})

$(document).ready(function() {
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
