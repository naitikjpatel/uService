<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Urban Service</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex h-screen">
    <div class="w-64 bg-blue-900 text-white p-5 space-y-6">
    <h2 class="text-2xl font-bold">Admin Panel</h2>
    <nav>
        <a href="dashboard.jsp" class="block py-2 px-4 hover:bg-blue-700 rounded">Dashboard</a>
        <a href="users.jsp" class="block py-2 px-4 hover:bg-blue-700 rounded">Users</a>
        <a href="providers.jsp" class="block py-2 px-4 hover:bg-blue-700 rounded">Service Providers</a>
        <a href="bookings.jsp" class="block py-2 px-4 hover:bg-blue-700 rounded">Bookings</a>
        <a href="reports.jsp" class="block py-2 px-4 hover:bg-blue-700 rounded">Reports</a>
    </nav>
</div>


<div class="flex-1 p-10">
    <h1 class="text-3xl font-bold mb-4">Dashboard</h1>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div class="bg-white p-5 rounded shadow">
            <h2 class="text-xl font-semibold">Total Users</h2>
            <p class="text-2xl font-bold"><%= request.getAttribute("totalUsers") %></p>
        </div>
        <div class="bg-white p-5 rounded shadow">
            <h2 class="text-xl font-semibold">Total Bookings</h2>
            <p class="text-2xl font-bold"><%= request.getAttribute("totalBookings") %></p>
        </div>
        <div class="bg-white p-5 rounded shadow">
            <h2 class="text-xl font-semibold">Total Earnings</h2>
            <p class="text-2xl font-bold">$<%= request.getAttribute("totalEarnings") %></p>
        </div>
    </div>
</div>


    
    
    </div>
    
    

</body>
</html>