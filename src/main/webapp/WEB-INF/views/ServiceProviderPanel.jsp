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
<body class="bg-gray-900 text-white min-h-screen flex">
    <!-- Sidebar -->
    <nav class="w-64 bg-gray-800 p-6">
        <h2 class="text-xl font-bold mb-6">Dashboard</h2>
        <nav>
            <ul>
                <li class="mb-3"><a href="/service-provider/dashboard" target="contentFrame" class="hover:text-blue-400">Dashboard</a></li>
                <li class="mb-3"><a href="/profile" target="contentFrame" class="hover:text-blue-400">Profile</a></li>
                <li class="mb-3"><a href="/b" target="contentFrame" class="hover:text-blue-400">Bookings</a></li>
                <li class="mb-3"><a href="/listcategory" target="contentFrame" class="hover:text-blue-400">Earnings</a></li>
                <li class="mb-3"><a href="/d" target="contentFrame" class="hover:text-blue-400">Reviews</a></li>
                <li class="mb-3"><a href="/logout"  class="hover:text-blue-400">Logout</a></li>
            </ul>
        </nav>
    </nav>
    
      <!-- Main Content (Iframe) -->
    <div class="flex-1 p-10">
        <iframe name="contentFrame" src="/service-provider/dashboard" class="w-full h-[90vh] border-none"></iframe>
    </div>
</body>
</html>
