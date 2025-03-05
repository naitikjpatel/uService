<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Urban Service</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .fade-in {
            animation: fadeIn 0.6s ease-out forwards;
        }
        .hover-scale {
            transition: transform 0.3s ease, background-color 0.3s ease;
        }
        .hover-scale:hover {
            transform: scale(1.05);
        }
        .sidebar-link.active {
            background-color: #1e40af; /* bg-blue-800 */
            font-weight: 600;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-blue-100 min-h-screen flex">

    <!-- Sidebar -->
    <div class="w-64 bg-blue-900 text-white p-6 space-y-6 shadow-lg fixed h-full fade-in">
        <div class="flex items-center space-x-3">
            <i class="fa-solid fa-user-shield text-2xl"></i>
            <h2 class="text-2xl font-bold">Admin Panel</h2>
        </div>
        <nav class="space-y-2">
            <a href="/admindashboard" target="contentFrame" class="sidebar-link block py-2 px-4 hover:bg-blue-700 rounded hover-scale" onclick="updateURL(this)">Dashboard</a>
            <a href="/userlist" target="contentFrame" class="sidebar-link block py-2 px-4 hover:bg-blue-700 rounded hover-scale" onclick="updateURL(this)">Users</a>
            <a href="/providers" target="contentFrame" class="sidebar-link block py-2 px-4 hover:bg-blue-700 rounded hover-scale" onclick="updateURL(this)">Service Providers</a>
            <a href="/bookings" target="contentFrame" class="sidebar-link block py-2 px-4 hover:bg-blue-700 rounded hover-scale" onclick="updateURL(this)">Bookings</a>
            <a href="/listcategory" target="contentFrame" class="sidebar-link block py-2 px-4 hover:bg-blue-700 rounded hover-scale" onclick="updateURL(this)">Categories</a>
            <a href="/reports" target="contentFrame" class="sidebar-link block py-2 px-4 hover:bg-blue-700 rounded hover-scale" onclick="updateURL(this)">Reports</a>
            <a href="/logout" class="block py-2 px-4 bg-red-600 hover:bg-red-700 rounded mt-6 text-center hover-scale transition duration-300">Logout</a>
        </nav>
    </div>

    <!-- Main Content (Iframe) -->
    <div class="flex-1 ml-64 p-10">
        <iframe name="contentFrame" id="contentFrame" src="/admindashboard" class="w-full h-[90vh] border-none rounded-lg shadow-md fade-in"></iframe>
    </div>

    <script>
    // Function to update URL and highlight active link
    function updateURL(element) {
        const url = element.getAttribute('href');

        // Update iframe source
        document.getElementById('contentFrame').src = url;

        // Update browser URL
        window.history.pushState({ path: url }, '', url);

        // Remove active class from all links
        document.querySelectorAll('.sidebar-link').forEach(link => link.classList.remove('active'));

        // Add active class to clicked link
        element.classList.add('active');

        return false; // Prevent default anchor behavior
    }

    // Handle browser back/forward navigation
    window.onpopstate = function (event) {
        if (event.state && event.state.path) {
            document.getElementById('contentFrame').src = event.state.path;
            updateActiveLink(event.state.path);
        }
    };

    // Highlight the active link based on URL
    function updateActiveLink(url) {
        document.querySelectorAll('.sidebar-link').forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === url) {
                link.classList.add('active');
            }
        });
    }
</script>

</body>
</html>