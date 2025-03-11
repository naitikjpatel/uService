<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%
UUID user = (UUID) session.getAttribute("userId");
if (user == null) {
    response.sendRedirect("/login");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Urban Service Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
    
    
    
        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
    
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
            animation: fadeInUp 0.8s ease-out forwards;
        }
        .hover-scale {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .hover-scale:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            animation: pulse 1.5s infinite;
        }
        .how-it-works-card {
            transition: background-color 0.3s ease;
        }
        .how-it-works-card:hover {
            background-color: #eff6ff; /* bg-blue-50 */
        }
        .main-section {
            background-image: url('https://source.unsplash.com/1600x900/?home,services');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
            z-index: 1;
        }
        .main-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4); /* Overlay for readability */
            z-index: -1;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-blue-100 min-h-screen">

    <!-- Navbar -->
    <nav class="bg-blue-700 p-6 text-white shadow-lg sticky top-0 z-10">
        <div class="max-w-7xl mx-auto flex justify-between items-center">
            <h1 class="text-3xl font-bold tracking-tight flex items-center">
                <i class="fa-solid fa-home mr-2"></i> Urban Service
            </h1>
            <div class="flex space-x-8 text-lg">
                <a href="#" class="hover:text-yellow-300 transition duration-300">Home</a>
                <a href="/categories" class="hover:text-yellow-300 transition duration-300">Categories</a>
            </div>
            <div class="flex items-center space-x-6">
                <a href="/profile" class="flex items-center space-x-2 hover:text-yellow-300 transition duration-300">
                    <i class="fa-solid fa-user fa-lg"></i>
                    <span>Profile</span>
                </a>
                 <div>
              <a href="bookinghistoryuser" class="flex items-center space-x-2 text-black-700 hover:text-white-900">
    <i class="fa-solid fa-calendar-check"></i>
    <span>My Bookings</span>
</a>

   </div>
                <a href="/logout" class="bg-red-600 px-5 py-2 rounded-full hover:bg-red-700 transition duration-300 shadow-md">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Section with Background Image -->
    <main class="main-section text-white py-20">
        <div class="max-w-6xl mx-auto px-8">
            <section class="fade-in-up">
                <h2 class="text-5xl font-bold mb-4">Welcome Back!</h2>
                <p class="text-xl leading-relaxed max-w-2xl">Your one-stop solution for home services. Connect with verified professionals for plumbing, electrical work, salon services, and more—all at your fingertips.</p>
                <a href="#" class="mt-6 inline-block bg-blue-600 text-white px-6 py-3 rounded-full hover:bg-blue-700 transition duration-300 hover-scale">Explore Services</a>
            </section>
        </div>
    </main>

    <!-- Stats Section -->
    <section class="max-w-6xl mx-auto mt-12 p-8 bg-white rounded-2xl shadow-xl grid grid-cols-1 md:grid-cols-2 gap-6 text-center fade-in-up" style="animation-delay: 0.2s;">
        <div class="hover-scale p-4">
            <h3 class="text-4xl font-bold text-green-600">10,000+</h3>
            <p class="text-gray-600 text-lg mt-2">Happy Customers</p>
        </div>
        <div class="hover-scale p-4">
            <h3 class="text-4xl font-bold text-green-600">5,000+</h3>
            <p class="text-gray-600 text-lg mt-2">Service Providers</p>
        </div>
    </section>

    <!-- How It Works Section -->
 <section class="max-w-6xl mx-auto mt-12 p-8 bg-white rounded-2xl shadow-xl fade-in-up" style="animation-delay: 0.4s;">
    <h2 class="text-3xl font-bold text-blue-700 mb-6">How It Works</h2>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="how-it-works-card p-6 rounded-lg text-center">
            <img src="https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&dpr=1" class="w-full h-40 object-cover rounded-lg mb-4" alt="Person searching for services on a laptop">
            <h3 class="text-xl font-semibold text-gray-800">1. Search</h3>
            <p class="text-gray-600 mt-2">Find the service you need from our wide range of categories.</p>
        </div>
        <div class="how-it-works-card p-6 rounded-lg text-center">
            <img src="https://images.pexels.com/photos/3182834/pexels-photo-3182834.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&dpr=1" class="w-full h-40 object-cover rounded-lg mb-4" alt="Person booking an appointment on a calendar">
            <h3 class="text-xl font-semibold text-gray-800">2. Book</h3>
            <p class="text-gray-600 mt-2">Schedule with a trusted professional at your convenience.</p>
        </div>
        <div class="how-it-works-card p-6 rounded-lg text-center">
            <img src="https://images.pexels.com/photos/3756681/pexels-photo-3756681.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&dpr=1" class="w-full h-40 object-cover rounded-lg mb-4" alt="Person relaxing while service is completed">
            <h3 class="text-xl font-semibold text-gray-800">3. Enjoy</h3>
            <p class="text-gray-600 mt-2">Relax while our experts deliver top-notch service.</p>
        </div>
    </div>
</section>
    <!-- Featured Services Section -->
	


    <!-- Categories Section -->
  <!-- List of categories -->
   <!-- Categories Section -->
<div class="max-w-6xl mx-auto py-10 px-4">
    <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Service Categories</h1>

    <!-- Search Filter Input -->
    <div class="mb-6 flex justify-center">
        <div class="relative w-full max-w-md">
            <input
                type="text"
                id="categorySearch"
                placeholder="Search categories..."
                class="w-full p-3 pl-10 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                onkeyup="filterCategories()"
            />
            <i class="fa-solid fa-magnifying-glass absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500"></i>
        </div>
    </div>

    <!-- Categories Grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6" id="categoryGrid">
        <c:forEach var="category" items="${categories}">
            <!-- Category Card -->
          <a href="/categorydetails?categoryId=${category.categoryId}" class="w-full category-card">      <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:scale-105 transition transform duration-300">
                    <!-- Category Image -->
                    <img 
                        src="${category.categoryPicUrl}"
                        alt="${category.categoryName}" 
                        class="w-full h-48 object-cover object-center"
                    />
                    <!-- Category Details -->
                    <div class="p-5">
                        <h3 class="text-xl font-semibold text-gray-800">${category.categoryName}</h3>
                        <!-- Description (Initially 2 Lines) -->
                        <p class="text-gray-600 text-sm mt-2 line-clamp-2 overflow-hidden" id="desc-${category.categoryId}">
                            ${category.categoryDescription}
                        </p>
                        <!-- See More / Hide Button -->
                        <button type="button" class="text-blue-500 mt-2" onclick="toggleDescription('${category.categoryId}')">
                            See More
                        </button>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
  


    <!-- Testimonials Section -->
    <section class="max-w-6xl mx-auto mt-12 p-8 bg-white rounded-2xl shadow-xl fade-in-up" style="animation-delay: 1s;">
        <h2 class="text-3xl font-bold text-blue-700 mb-6">What Our Users Say</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div class="bg-gray-50 p-6 rounded-lg hover-scale">
                <p class="text-gray-600 italic">"The electrician arrived on time and fixed everything perfectly. Highly recommend!"</p>
                <p class="text-gray-800 font-semibold mt-4">- Priya Sharma</p>
            </div>
            <div class="bg-gray-50 p-6 rounded-lg hover-scale">
                <p class="text-gray-600 italic">"Booking a cleaner was so easy, and my house has never looked better!"</p>
                <p class="text-gray-800 font-semibold mt-4">- Rohan Patel</p>
            </div>
        </div>
    </section>

    <!-- Quick Booking Button (Floating) -->
    <a href="#" class="fixed bottom-8 right-8 bg-blue-600 text-white px-6 py-3 rounded-full shadow-lg hover:bg-blue-700 transition duration-300 hover-scale flex items-center space-x-2 z-20">
        <i class="fa-solid fa-calendar-check"></i>
        <span>Quick Book</span>
    </a>

    <!-- Footer -->
    <footer class="bg-gray-900 text-white text-center py-6 mt-12">
        <p class="text-sm">© 2025 Urban Service. All Rights Reserved.</p>
    </footer>
  <!-- JavaScript for See More / Hide -->
   <script>
    // Toggle Description Function
    function toggleDescription(categoryId) {
        var desc = document.getElementById("desc-" + categoryId);
        var button = event.target;

        if (desc.classList.contains("line-clamp-2")) {
            desc.classList.remove("line-clamp-2", "overflow-hidden");
            button.innerText = "Hide";
        } else {
            desc.classList.add("line-clamp-2", "overflow-hidden");
            button.innerText = "See More";
        }
    }

    // Filter Categories Function
    function filterCategories() {
        var input = document.getElementById("categorySearch").value.toLowerCase();
        var cards = document.getElementsByClassName("category-card");

        for (var i = 0; i < cards.length; i++) {
            var card = cards[i];
            var name = card.querySelector("h3").innerText.toLowerCase();
            var desc = card.querySelector("p").innerText.toLowerCase();

            if (name.includes(input) || desc.includes(input)) {
                card.style.display = "block";
            } else {
                card.style.display = "none";
            }
        }
    }
</script>


</body>
</html>