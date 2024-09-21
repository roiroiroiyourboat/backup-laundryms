const hamburger = document.querySelector("#toggle-btn");

hamburger.addEventListener("click", function(){
    document.querySelector("#sidebar").classList.toggle("expand");
})

//CHARTS
// document.addEventListener("DOMContentLoaded", function() {
//     //WEEKLY CHART 
//     fetch('/laundry_system/main/sales_report/sales_config/weeklyChart.php')
//       .then(response => response.json())
//       .then(data => {
//           const ctx = document.getElementById('weekchart').getContext('2d');
//           const weekchart = new Chart(ctx, {
//               type: 'pie',
//               data: {
//                   labels: data.labels,
//                   datasets: [{
//                       label: 'Weekly Requests by Service and Category',
//                       data: data.data,
//                       backgroundColor: data.backgroundColors,
//                       borderColor: data.borderColors,
//                       borderWidth: 1
//                   }]
//               },
//               options: {
//                   responsive: true,
//                   plugins: {
//                       legend: {
//                           display: true,
//                           position: 'bottom',
//                           labels: {
//                               color: '#000',
//                               font: {
//                                   size: 12
//                               }
//                           }
//                       },
//                       title: {
//                           display: true,
//                           text: 'Weekly Requests by Service and Category',
//                           font: {
//                               size: 14
//                           }
//                       },
//                       tooltip: {
//                           callbacks: {
//                               label: function(tooltipItem) {
//                                   let label = tooltipItem.label || '';
//                                   let value = tooltipItem.raw || '';
//                                   return [
//                                       `${label}: ${value}`, 
//                                       `Requests Count: ${value}` 
//                                   ];
//                               }
//                           }
//                       }
//                   }
//               }
//           });
//       })
//       .catch(error => console.error('Error fetching chart data:', error));
    
// });