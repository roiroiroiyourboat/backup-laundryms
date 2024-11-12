document.addEventListener('DOMContentLoaded', function() {
    const hamburger = document.querySelector("#toggle-btn");

    hamburger.addEventListener("click",function() {
        document.querySelector("#sidebar").classList.toggle("expand");
    });

    // archive
    const archiveModal = document.getElementById('archiveModal');
    const confirmArchiveButton = document.getElementById('confirmArchiveButton');
    const cancelArchiveButton = document.getElementById('cancelArchiveButton');
    const closeArchiveModal = document.getElementById('closeArchiveModal');

    // success
    const successModal = document.getElementById('successModal');
    const closeSuccessModal = document.getElementById('closeSuccessModal');
    const closeSuccessButton = document.getElementById('closeSuccessButton');

    let customerIdToArchive = null;

    document.querySelectorAll('.archive-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            customerIdToArchive = btn.dataset.id;
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
        fetch('/laundry_system/archived/archive_customer_db.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ id: customerIdToArchive })  
        })

        .then(response => response.text())  
        .then(data => {
            console.log('Raw response:', data);  
    
            // Checking if response is JSON or an HTML error page
            if (data.trim().startsWith('<')) {
                console.error('Received HTML instead of JSON:', data);
                return;  
            }
    
            try {
                const jsonData = JSON.parse(data);

                if (jsonData.success) {
                    archiveModal.style.display = 'none';
                    successModal.style.display = 'block';
                } else {
                    alert('Error archiving customer: ' + jsonData.error);
                }
            } catch (error) {
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
    $("#filter_customer").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#customer_table tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });

    /* pagination */
      const rowsPerPage = 10;
      const tableBody = document.querySelector('table tbody');
      const rows = tableBody.querySelectorAll('tr');
      const paginationContainer  = document.getElementById('pagination');

      let totalRows = rows.length;
      let totalPages = Math.ceil(totalRows / rowsPerPage);
      let currentPage = 0;

      function displayRows(startIndex) {
        rows.forEach(row => row.style.display = 'none');

        let endIndex = startIndex + rowsPerPage;
        for (let i = startIndex; i < endIndex && i < totalRows; i++) {
            rows[i].style.display = '';
        }
      }

      function setupPagination() {
        paginationContainer.innerHTML = '';
    
        // previous arrow
        let prevPageLink = document.createElement('li');
        prevPageLink.classList.add('page-item');
        prevPageLink.innerHTML = `<a class="page-link" href="#"><<</a>`;
        prevPageLink.addEventListener('click', function (e) {
            e.preventDefault();
            if (currentPage > 0) {
                currentPage--;
                displayRows(currentPage * rowsPerPage);
                setActivePage(currentPage);
            }
        });
    
        paginationContainer.appendChild(prevPageLink);

      // numbered page links
      for (let i = 0; i < totalPages; i++) {
        let pageLink = document.createElement('li');
        pageLink.classList.add('page-item');
        pageLink.innerHTML = `<a class="page-link" href="#">${i + 1}</a>`;

        pageLink.addEventListener('click', function (e) {
            e.preventDefault();
            currentPage = i;
            displayRows(i * rowsPerPage);
            setActivePage(i);
        });

        paginationContainer.appendChild(pageLink);
    }

      // next arrow
      let nextPageLink = document.createElement('li');
        nextPageLink.classList.add('page-item');
        nextPageLink.innerHTML = `<a class="page-link" href="#">>></a>`;
        nextPageLink.addEventListener('click', function (e) {
        e.preventDefault();
        if (currentPage < totalPages - 1) {
            currentPage++;
            displayRows(currentPage * rowsPerPage);
            setActivePage(currentPage);
        }
    });
        paginationContainer.appendChild(nextPageLink);
    }

    function setActivePage(pageIndex) {
        const pageLinks = paginationContainer.querySelectorAll('.page-item');
        pageLinks.forEach(link => link.classList.remove('active'));
        pageLinks[pageIndex + 1].classList.add('active'); // +1 to skip the prev arrow
    }

    // Initialize table with first page and pagination links
    displayRows(0);
    setupPagination();
    setActivePage(0);

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
