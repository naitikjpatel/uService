<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Provider Dashboard - Urban Service</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        .fade-in-up {
            animation: fadeInUp 0.6s ease-out forwards;
        }
        .hover-scale {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .hover-scale:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            animation: pulse 1.5s infinite;
        }
        .card {
            transition: background-color 0.3s ease;
        }
        .card:hover {
            background-color: #374151; /* bg-gray-700 */
        }
    </style>
</head>
<body class="bg-gray-900 text-white min-h-screen p-6">

    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="flex items-center justify-between mb-8 fade-in-up">
            <h1 class="text-3xl font-bold text-blue-400 flex items-center">
                <i class="fa-solid fa-tools mr-2"></i> Welcome, ${serviceProvider.name != null ? serviceProvider.name : "Provider"}
            </h1>
            <div class="text-gray-400 text-sm">
                Last Updated: <%= new java.text.SimpleDateFormat("MMM dd, yyyy HH:mm").format(new java.util.Date()) %>
            </div>
        </div>

        <!-- Profile Section -->
        <div class="bg-gray-800 p-6 rounded-2xl shadow-lg card mb-6 fade-in-up" style="animation-delay: 0.1s;">
            <h2 class="text-lg font-semibold text-blue-400 mb-4">Profile Info</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <p><span class="text-gray-400">Email:</span> ${serviceProvider.email != null ? serviceProvider.email : "N/A"}</p>
                <p><span class="text-gray-400">Phone:</span> ${serviceProvider.phone != null ? serviceProvider.phone : "N/A"}</p>
                <p><span class="text-gray-400">Status:</span> ${serviceProvider.status != null ? serviceProvider.status : "N/A"}</p>
            </div>
        </div>

        <!-- Bookings Summary -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
            <div class="bg-blue-600 p-6 rounded-2xl shadow-lg hover-scale fade-in-up" style="animation-delay: 0.2s;">
                <h3 class="text-lg font-semibold">Total Bookings</h3>
                <p class="text-3xl font-bold mt-2">${totalBookings != null ? totalBookings : "0"}</p>
            </div>
            <div class="bg-yellow-600 p-6 rounded-2xl shadow-lg hover-scale fade-in-up" style="animation-delay: 0.3s;">
                <h3 class="text-lg font-semibold">Pending</h3>
                <p class="text-3xl font-bold mt-2">${pendingBookings != null ? pendingBookings : "0"}</p>
            </div>
            <div class="bg-green-600 p-6 rounded-2xl shadow-lg hover-scale fade-in-up" style="animation-delay: 0.4s;">
                <h3 class="text-lg font-semibold">Completed</h3>
                <p class="text-3xl font-bold mt-2">${completedBookings != null ? completedBookings : "0"}</p>
            </div>
        </div>

        <!-- Earnings Overview -->
        <div class="bg-gray-800 p-6 rounded-2xl shadow-lg card mb-6 fade-in-up" style="animation-delay: 0.5s;">
            <h2 class="text-lg font-semibold text-blue-400 mb-4">Earnings Overview</h2>
            <div class="flex flex-col md:flex-row gap-6">
                <div class="flex-1">
                    <canvas id="earningsChart" class="w-full h-64"></canvas>
                </div>
                <div class="text-gray-300 space-y-2">
                    <p><span class="text-gray-400">Total Earnings:</span> ₹${totalEarnings != null ? totalEarnings : "0.00"}</p>
                    <p><span class="text-gray-400">Monthly Earnings:</span> ₹${monthlyEarnings != null ? monthlyEarnings : "0.00"}</p>
                    <p><span class="text-gray-400">Withdrawable Balance:</span> ₹${withdrawableBalance != null ? withdrawableBalance : "0.00"}</p>
                </div>
            </div>
        </div>

        <!-- Recent Service Requests -->
        <div class="bg-gray-800 p-6 rounded-2xl shadow-lg card fade-in-up" style="animation-delay: 0.6s;">
            <h2 class="text-lg font-semibold text-blue-400 mb-4">Recent Service Requests</h2>
            <ul id="serviceRequests" class="space-y-3">
                <%-- Dynamic service requests will be loaded here --%>
            </ul>
        </div>
    </div>

    <script>
        // Earnings Chart with Chart.js
        const ctx = document.getElementById('earningsChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Earnings (₹)',
                    data: [5000, 7000, 8000, 6000, 9000, 11000],
                    backgroundColor: 'rgba(59, 130, 246, 0.6)',
                    borderColor: 'rgba(59, 130, 246, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { beginAtZero: true, grid: { color: 'rgba(255, 255, 255, 0.1)' } },
                    x: { grid: { display: false } }
                },
                plugins: {
                    legend: { labels: { color: '#fff' } }
                }
            }
        });

        // Load recent service requests dynamically
        fetch('/getRecentRequests')
            .then(response => response.json())
            .then(data => {
                let requestList = '';
                data.forEach(request => {
                    requestList += `
                        <li class="flex justify-between items-center p-3 bg-gray-700 rounded-lg hover:bg-gray-600 transition duration-300">
                            <span>${request.serviceName || 'Unknown Service'} - ${request.customerName || 'Unknown Customer'}</span>
                            <div class="space-x-2">
                                <button class="bg-green-600 px-3 py-1 rounded text-sm hover:bg-green-700 transition duration-300">Accept</button>
                                <button class="bg-red-600 px-3 py-1 rounded text-sm hover:bg-red-700 transition duration-300">Reject</button>
                            </div>
                        </li>`;
                });
                document.getElementById('serviceRequests').innerHTML = requestList || '<p class="text-gray-400">No recent requests.</p>';
            })
            .catch(() => {
                document.getElementById('serviceRequests').innerHTML = '<p class="text-red-400">Failed to load requests.</p>';
            });
    </script>
</body>
</html>