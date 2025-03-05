<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Urban Service</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            animation: pulse 1.5s infinite;
        }
        .dashboard-card {
            transition: background-color 0.3s ease;
        }
        .dashboard-card:hover {
            background-color: #eff6ff; /* bg-blue-50 */
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-blue-100 min-h-screen p-8">

    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="flex items-center justify-between mb-8 fade-in-up">
            <h1 class="text-3xl font-bold text-blue-600 flex items-center">
                <i class="fa-solid fa-tachometer-alt mr-2"></i> Admin Dashboard
            </h1>
            <div class="text-gray-600 text-sm">
                Last Updated: <%= new java.text.SimpleDateFormat("MMM dd, yyyy HH:mm").format(new java.util.Date()) %>
            </div>
        </div>

        <!-- Stats Grid -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Total Users -->
            <div class="bg-white p-6 rounded-2xl shadow-lg dashboard-card hover-scale fade-in-up" style="animation-delay: 0.1s;">
                <div class="flex items-center justify-between">
                    <div>
                        <h2 class="text-xl font-semibold text-gray-700">Total Users</h2>
                        <p class="text-3xl font-bold text-blue-600 mt-2">
                            <%= request.getAttribute("totalUsers") != null ? request.getAttribute("totalUsers") : "0" %>
                        </p>
                    </div>
                    <i class="fa-solid fa-users text-3xl text-blue-500 opacity-50"></i>
                </div>
            </div>

            <!-- Total Bookings -->
            <div class="bg-white p-6 rounded-2xl shadow-lg dashboard-card hover-scale fade-in-up" style="animation-delay: 0.2s;">
                <div class="flex items-center justify-between">
                    <div>
                        <h2 class="text-xl font-semibold text-gray-700">Total Bookings</h2>
                        <p class="text-3xl font-bold text-blue-600 mt-2">
                            <%= request.getAttribute("totalBookings") != null ? request.getAttribute("totalBookings") : "0" %>
                        </p>
                    </div>
                    <i class="fa-solid fa-calendar-check text-3xl text-blue-500 opacity-50"></i>
                </div>
            </div>

            <!-- Total Earnings -->
            <div class="bg-white p-6 rounded-2xl shadow-lg dashboard-card hover-scale fade-in-up" style="animation-delay: 0.3s;">
                <div class="flex items-center justify-between">
                    <div>
                        <h2 class="text-xl font-semibold text-gray-700">Total Earnings</h2>
                        <p class="text-3xl font-bold text-blue-600 mt-2">
                            $<%= request.getAttribute("totalEarnings") != null ? request.getAttribute("totalEarnings") : "0.00" %>
                        </p>
                    </div>
                    <i class="fa-solid fa-dollar-sign text-3xl text-blue-500 opacity-50"></i>
                </div>
            </div>
        </div>
    </div>

</body>
</html>