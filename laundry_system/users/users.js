const hamburger = document.querySelector("#toggle-btn");

hamburger.addEventListener("click", function() {
    document.querySelector("#sidebar").classList.toggle("expand");
});

document.addEventListener('DOMContentLoaded', function() {
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
    
    // Add User Modal functionality
    const addUserModal = document.getElementById('addUserModal');
    const addUserButton = document.getElementById('addUserButton');
    const closeAddUserButton = addUserModal.querySelector('.close');
    const clearButton = addUserModal.querySelector('.btn-info');

    addUserButton.addEventListener('click', () => {
        addUserModal.style.display = 'flex';
    });

    closeAddUserButton.addEventListener('click', () => {
        addUserModal.style.display = 'none';
    });

    clearButton.addEventListener('click', () => {
        document.getElementById('userForm').reset();
        document.getElementById('passwordHelp').style.display = 'none';
    });

    window.addEventListener('click', (event) => {
        if (event.target === addUserModal) {
            addUserModal.style.display = 'none';
        }
    });

    // Edit User Modal functionality
    const editModal = document.getElementById('editModal');
    const closeEditButton = editModal.querySelector('.close-btn');

    document.querySelectorAll('.edit-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            const userId = btn.dataset.id;
            const username = btn.dataset.username;
            const firstName = btn.dataset.firstname;
            const lastName = btn.dataset.lastname;
            const userRole = btn.dataset.userrole;

            document.getElementById('editUserId').value = userId;
            document.getElementById('editUsername').value = username;
            document.getElementById('editFirstName').value = firstName;
            document.getElementById('editLastName').value = lastName;
            document.getElementById('editUserRole').value = userRole;

            editModal.style.display = 'flex';
        });
    });

    closeEditButton.addEventListener('click', () => {
        editModal.style.display = 'none';
    });

    window.addEventListener('click', (event) => {
        if (event.target === editModal) {
            editModal.style.display = 'none';
        }
    });

    // Add user
    document.getElementById('userForm').addEventListener('submit', function(event) {
        event.preventDefault(); 

        const formData = new FormData(this); 
        
        fetch('add_users.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'User added successfully!',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    window.location.href = 'users.php';
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: data.message
                });
            }
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Unexpected error',
                text: 'Something went wrong!'
            });
        });
    });

    // Password Validation and Form Submission Handling
    const passwordField = document.getElementById('password');
    const passwordHelpText = document.getElementById('passwordHelp');
    const userForm = document.getElementById('userForm');

    if (passwordField && passwordHelpText && userForm) {
        const passwordRequirements = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;

        passwordField.addEventListener('input', function () {
            const passwordValue = passwordField.value;
            const lengthCheck = passwordValue.length >= 8;
            const uppercaseCheck = /[A-Z]/.test(passwordValue);
            const lowercaseCheck = /[a-z]/.test(passwordValue);
            const numberCheck = /\d/.test(passwordValue);

            document.getElementById('length').style.color = lengthCheck ? 'green' : 'red';
            document.getElementById('uppercase').style.color = uppercaseCheck ? 'green' : 'red';
            document.getElementById('lowercase').style.color = lowercaseCheck ? 'green' : 'red';
            document.getElementById('number').style.color = numberCheck ? 'green' : 'red';

            if (lengthCheck && uppercaseCheck && lowercaseCheck && numberCheck) {
                passwordHelpText.style.display = 'none';
            } else {
                passwordHelpText.style.display = 'block';
            }
        });

        userForm.addEventListener('submit', function (event) {
            const passwordValue = passwordField.value;
            const isValid = passwordRequirements.test(passwordValue);

            if (!isValid) {
                event.preventDefault();
                alert('Password does not meet the required criteria.');
                passwordHelpText.style.display = 'block';
                passwordHelpText.style.color = 'red';
                passwordField.scrollIntoView({ behavior: 'smooth' });
            }
        });
    } else {
        console.error("Password field or user form not found in the DOM.");
    }

    //Show Password
    $('.toggle-password').click(function() {
        var target = $(this).data('target');
        var input = $(target);
        if (input.attr('type') === 'password') {
            input.attr('type', 'text');
            $(this).removeClass('bx-show').addClass('bx-hide');
        } else {
            input.attr('type', 'password');
            $(this).removeClass('bx-hide').addClass('bx-show');
        }
    });

    // 23:45
    // Archive User Modal functionality
    const archiveUser = (userId) => {
        const archiveModal = document.getElementById('archiveModal');
        const confirmButton = document.getElementById('confirmArchiveButton');
        const cancelButton = document.getElementById('cancelArchiveButton');
        const hiddenInput = document.getElementById('archiveUserId');
        const closeArchiveModalButton = document.getElementById('closeArchiveModal');
    
        hiddenInput.value = userId;
        archiveModal.style.display = 'flex';
    
        confirmButton.onclick = () => {
            archiveModal.style.display = 'none';
            fetch('/laundry_system/archived/archive_users_db.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id: userId })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    Swal.fire({
                        icon: 'success',
                        title: 'User Archived!',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(() => {
                        archiveModal.style.display = 'none';
                        fetchUsers();
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: data.error || 'There was a problem archiving the user.'
                    });
                }
            });
        };

        cancelButton.addEventListener('click', () => {
            archiveModal.style.display = 'none';
        });

        window.addEventListener('click', (event) => {
            if (event.target === archiveModal) {
                archiveModal.style.display = 'none';
            }
        });

        closeArchiveModalButton.addEventListener('click', () => {
        archiveModal.style.display = 'none';
    });

    };

    const fetchUsers = () => {
        fetch('fetch_users.php')
            .then(response => response.text())
            .then(html => {
                const userTable = document.querySelector('#user_table');
                userTable.innerHTML = html;
                attachButtonListeners();
            });
    };

    const attachButtonListeners = () => {
        document.querySelectorAll('.edit-btn').forEach(button => {
            button.addEventListener('click', () => {
                const userId = button.dataset.id;
                const username = button.dataset.username;
                document.getElementById('editUserId').value = userId;
                document.getElementById('editUsername').value = username;
                editModal.style.display = 'flex';
            });
        });
        document.querySelectorAll('.archive-btn').forEach(button => {
            button.addEventListener('click', () => {
                const userId = button.dataset.id;
                archiveUser(userId);
            });
        });
    };

    attachButtonListeners(); 

    /* search */
    $("#filter_user").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#user_table tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    // const archiveUser = (userId) => {
    //     const archiveModal = document.getElementById('archiveModal');
    //     const confirmButton = document.getElementById('confirmArchiveButton');
    //     const cancelButton = document.getElementById('cancelArchiveButton');
    //     const hiddenInput = document.getElementById('archiveUserId');
    
    //     // Set the user ID in the hidden input field
    //     hiddenInput.value = userId;
    
    //     // Show the modal
    //     archiveModal.style.display = 'flex';
    
    //     // Confirm button action
    //     confirmButton.onclick = () => {
    //         fetch('/laundry_system/archived/archive_users_db.php', {
    //             method: 'POST',
    //             headers: { 'Content-Type': 'application/json' },
    //             body: JSON.stringify({ id: userId })
    //         })
    //             .then(response => response.json())
    //             .then(data => {
    //                 if (data.success) {
    //                     Swal.fire({
    //                         icon: 'success',
    //                         title: 'User Archived!',
    //                         text: 'The user has been successfully archived.',
    //                         showConfirmButton: false,
    //                         timer: 1500
    //                     }).then(() => {
    //                         archiveModal.style.display = 'none'; // Close the modal
    //                         fetchUsers(); // Refresh the user table
    //                     });
    //                 } else {
    //                     Swal.fire({
    //                         icon: 'error',
    //                         title: 'Error!',
    //                         text: data.error || 'There was a problem archiving the user.',
    //                         confirmButtonText: 'OK'
    //                     });
    //                 }
    //             })
    //             .catch(error => {
    //                 Swal.fire({
    //                     icon: 'error',
    //                     title: 'Oops...',
    //                     text: 'Something went wrong! Please try again.',
    //                 });
    //             });
    //     };
    
    //     // Cancel button action
    //     cancelButton.onclick = () => {
    //         archiveModal.style.display = 'none'; // Close the modal
    //     };
    
    //     // Close modal when clicking outside
    //     window.onclick = (event) => {
    //         if (event.target === archiveModal) {
    //             archiveModal.style.display = 'none';
    //         }
    //     };
    // };

    // document.getElementById('closeSuccessButton').addEventListener('click', () => {
    //     document.getElementById('successModal').style.display = 'none';
    // });


    document.getElementById('editForm').addEventListener('submit', function(event) {
        event.preventDefault(); 
    
        const formData = new FormData(this); 
        
        fetch('update_user.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'User updated successfully!',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    // Get the updated values from the form
                    const updatedUserId = document.getElementById('editUserId').value;
                    const updatedUsername = document.getElementById('editUsername').value;
                    const updatedFirstName = document.getElementById('editFirstName').value;
                    const updatedLastName = document.getElementById('editLastName').value;
                    const updatedUserRole = document.getElementById('editUserRole').value;
    
                    // Find the corresponding table row by user ID
                    const row = document.querySelector(`#user_table tr[data-id="${updatedUserId}"]`);
    
                    // Update the row with the new values
                    if (row) {
                        row.querySelector('.username').textContent = updatedUsername;
                        row.querySelector('.first-name').textContent = updatedFirstName;
                        row.querySelector('.last-name').textContent = updatedLastName;
                        row.querySelector('.user-role').textContent = updatedUserRole;
                    }
    
                    // Close the edit modal
                    location.reload();
                    document.getElementById('editModal').style.display = 'none';
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: data.error || 'Something went wrong!'
                });
            }
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Unexpected error',
                text: 'Something went wrong!'
            });
        });
    });
    
    // for logout
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
