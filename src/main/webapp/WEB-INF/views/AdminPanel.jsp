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
    <!-- Sidebar -->
    <div class="w-64 bg-blue-900 text-white p-5 space-y-6">
        <h2 class="text-2xl font-bold">Admin Panel</h2>
        <nav>
            <a href="/admindashboard" target="contentFrame" class="block py-2 px-4 hover:bg-blue-700 rounded">Dashboard</a>
            <a href="/userlist" target="contentFrame" class="block py-2 px-4 hover:bg-blue-700 rounded">Users</a>
            <a href="providers.jsp" target="contentFrame" class="block py-2 px-4 hover:bg-blue-700 rounded">Service Providers</a>
            <a href="bookings.jsp" target="contentFrame" class="block py-2 px-4 hover:bg-blue-700 rounded">Bookings</a>
            <a href="/listcategory" target="contentFrame" class="block py-2 px-4 hover:bg-blue-700 rounded">Categories</a>
            <a href="reports.jsp" target="contentFrame" class="block py-2 px-4 hover:bg-blue-700 rounded">Report</a>
            
            <a href="/logout" class="block py-2 px-4 bg-red-600 hover:bg-red-700 rounded mt-4 text-center">Logout</a>
        </nav>
    </div>

    <!-- Main Content (Iframe) -->
    <div class="flex-1 p-10">
        <iframe name="contentFrame" src="/admindashboard" class="w-full h-[90vh] border-none"></iframe>
    </div>
</div>
   
    

</body>
</html>