<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Service Provider Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
 
    <!-- Main Content -->
    <main class="flex-1 p-6">
        <h1 class="text-2xl font-bold mb-4">Welcome, ${serviceProvider.name}</h1>
        
        <!-- Profile Section -->
        <div class="bg-gray-800 p-4 rounded-lg mb-6">
            <h2 class="text-lg font-semibold">Profile Info</h2>
            <p>Email: ${serviceProvider.email}</p>
            <p>Phone: ${serviceProvider.phone}</p>
            <p>Status: ${serviceProvider.status}</p>
        </div>
        
        <!-- Bookings Summary -->
        <div class="grid grid-cols-3 gap-4 mb-6">
            <div class="bg-blue-600 p-4 rounded-lg text-center">
                <h3 class="text-lg font-semibold">Total Bookings</h3>
                <p class="text-2xl">${totalBookings}</p>
            </div>
            <div class="bg-yellow-600 p-4 rounded-lg text-center">
                <h3 class="text-lg font-semibold">Pending</h3>
                <p class="text-2xl">${pendingBookings}</p>
            </div>
            <div class="bg-green-600 p-4 rounded-lg text-center">
                <h3 class="text-lg font-semibold">Completed</h3>
                <p class="text-2xl">${completedBookings}</p>
            </div>
        </div>
        
        <!-- Earnings Overview with Chart -->
        <div class="bg-gray-800 p-4 rounded-lg mb-6">
            <h2 class="text-lg font-semibold">Earnings Overview</h2>
            <canvas id="earningsChart"></canvas>
            <p>Total Earnings: ₹${totalEarnings}</p>
            <p>Monthly Earnings: ₹${monthlyEarnings}</p>
            <p>Withdrawable Balance: ₹${withdrawableBalance}</p>
        </div>
        
        <!-- Recent Service Requests -->
        <div class="bg-gray-800 p-4 rounded-lg mb-6">
            <h2 class="text-lg font-semibold">Recent Service Requests</h2>
            <ul id="serviceRequests">
                <%-- Dynamic service requests will be loaded here --%>
            </ul>
        </div>
    </main>

    <script>
        // Sample earnings data for Chart.js
        const ctx = document.getElementById('earningsChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Earnings (₹)',
                    data: [5000, 7000, 8000, 6000, 9000, 11000],
                    backgroundColor: 'rgba(59, 130, 246, 0.5)'
                }]
            }
        });
        
        // Load recent service requests dynamically
        fetch('/getRecentRequests')
            .then(response => response.json())
            .then(data => {
                let requestList = '';
                data.forEach(request => {
                    requestList += `<li class='mb-2 p-2 bg-gray-700 rounded'>
                        ${request.serviceName} - ${request.customerName}
                        <button class='ml-2 bg-green-600 px-2 py-1 rounded text-white'>Accept</button>
                        <button class='ml-2 bg-red-600 px-2 py-1 rounded text-white'>Reject</button>
                    </li>`;
                });
                document.getElementById('serviceRequests').innerHTML = requestList;
            });
    </script>

</body>
</html>