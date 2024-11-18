document.addEventListener('DOMContentLoaded', () => {
    const hamburger = document.querySelector("#toggle-btn");

    hamburger.addEventListener("click",function() {
        document.querySelector("#sidebar").classList.toggle("expand");
    });

    //for tooltips
    const sidebar = document.getElementById('sidebar');
    const toggleBtn = document.getElementById('toggle-btn');
    const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'));

    const tooltips = tooltipTriggerList.map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

    toggleBtn.addEventListener('click', function () {
        sidebar.classList.toggle('collapsed');

        tooltips.forEach(tooltip => {
            if (sidebar.classList.contains('collapsed')) {
                tooltip.disable();
            } else {
                tooltip.enable();
            }
        });
    });
    
    if (!sidebar.classList.contains('collapsed')) {
        tooltips.forEach(tooltip => tooltip.enable());
    }

    // add service 
    const clearButton = document.querySelector('.btn-info');

    clearButton.addEventListener('click', () => {
        document.getElementById('form').reset();
    });

    const form = document.getElementById('form');

    form.addEventListener('submit', function (event) {
        event.preventDefault();
    
        const formData = new FormData(form);
    
        fetch('add_category.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'New laundry category option saved successfully!',
                    showConfirmButton: false,
                    timer: 2500
                }).then(() => {
                    $('#addModal').hide();   
                    $('#form')[0].reset();
                    location.reload();
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: data.message || 'Failed to save the category option.'
                });
            }
        })
        .catch(error => {
            console.error('Error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'There was an error submitting the form. Please try again.'
            });
        });
    });

    // archive function 
    const archiveModal = document.getElementById('archiveModal');
    const confirmArchiveButton = document.getElementById('confirmArchiveButton');
    const cancelArchiveButton = document.getElementById('cancelArchiveButton');
    const closeArchiveModal = document.getElementById('closeArchiveModal');

    // success
    const successModal = document.getElementById('successModal');
    const closeSuccessModal = document.getElementById('closeSuccessModal');
    const closeSuccessButton = document.getElementById('closeSuccessButton');

    let categoryIdToArchive = null;

    document.querySelectorAll('.archive-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            categoryIdToArchive = btn.dataset.id;
            archiveModal.style.display = 'block';
        });
    });    

    closeArchiveModal.addEventListener('click', () => {
        archiveModal.style.display = 'none';
    });

    cancelArchiveButton.addEventListener('click', () => {
        archiveModal.style.display = 'none';
    });

    confirmArchiveButton.addEventListener('click', () => {
        fetch('/laundry_system/archived/archive_category_db.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            }, 
            body: JSON.stringify({ id: categoryIdToArchive })
        })

        .then(response => response.text())
        .then(data => {
            console.log('Raw response:', data);

            if (data.trim().startsWith('<')) {
                console.log('Received HTML instead of JSON:', data);
                return;
            }

            try {
                const jsonData = JSON.parse(data);

                if (jsonData.success) {
                        archiveModal.style.display = 'none';
                        successModal.style.display = 'block';
                } else {
                        alert('Error archiving category option" ' + jsonData.error);
                } 
            } catch(error) {
                console.error('Error parsing JSON:', error, data);
            }
        })

        .catch(error => {
            console.error('Fetch error:', error);
        });
    });

    closeSuccessButton.addEventListener('click', () => {
        successModal.style.display = 'none';
        location.reload();
    });

    /* search */
    $("#filter_category").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#category_table tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    // for logout
    const logoutModal = document.getElementById("logoutModal");
    const closeBtn = logoutModal.querySelector(".close");
    const noBtn = logoutModal.querySelector(".btn-no");

   $("#btn_logout").click(function() {
        $('#logoutModal').show();
   });

    // Close the modal when clicking the close button (×)
    if (closeBtn) {
        closeBtn.addEventListener("click", function() {
            logoutModal.style.display = "none"; 
        });
    }

    // Close the modal when clicking the 'No' button
    if (noBtn) {
        noBtn.addEventListener("click", function() {
            logoutModal.style.display = "none"; 
        });
    }

    // Close the modal when clicking outside the modal content
    window.addEventListener("click", function(event) {
        if (event.target === logoutModal) {
            logoutModal.style.display = "none";
        }
    });
});