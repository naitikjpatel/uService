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
    <title>Category Services - Urban Service</title>
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
        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        .fade-in-up {
            animation: fadeInUp 0.8s ease-out forwards;
        }
        .slide-in-left {
            animation: slideInLeft 0.6s ease-out forwards;
        }
        .hover-scale {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .hover-scale:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            animation: pulse 1.5s infinite;
        }
        .service-card {
            transition: background-color 0.3s ease;
        }
        .service-card:hover {
            background-color: #eff6ff; /* bg-blue-50 */
        }
        .hero-section {
            background-size: cover;
            background-position: center;
            position: relative;
            z-index: 1;
        }
        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
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
                <a href="/" class="hover:text-yellow-300 transition duration-300">Home</a>
                <a href="/categories" class="hover:text-yellow-300 transition duration-300">Categories</a>
            </div>
            <div class="flex items-center space-x-6">
                <a href="/profile" class="flex items-center space-x-2 hover:text-yellow-300 transition duration-300">
                    <i class="fa-solid fa-user fa-lg"></i>
                    <span>Profile</span>
                </a>
                <a href="/logout" class="bg-red-600 px-5 py-2 rounded-full hover:bg-red-700 transition duration-300 shadow-md">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-white py-20" style="background-image: url('https://source.unsplash.com/1600x900/?${category.categoryName},services');">
        <div class="max-w-6xl mx-auto px-8">
        
            <h2 class="text-5xl font-bold mb-4 fade-in-up">${category.categoryName} Services</h2>
            <p class="text-xl leading-relaxed max-w-2xl fade-in-up" style="animation-delay: 0.2s;">
                Explore top-tier services in ${category.categoryName}. Book trusted professionals with ease.
            </p>
            <a href="#services" class="mt-6 inline-block bg-blue-600 text-white px-6 py-3 rounded-full hover:bg-blue-700 transition duration-300 hover-scale fade-in-up" style="animation-delay: 0.4s;">
                View Services
            </a>
        </div>
    </section>

    <!-- Services List Section -->
    <section id="services" class="max-w-6xl mx-auto py-12 px-4">
        <h2 class="text-3xl font-bold text-blue-700 mb-8 text-center slide-in-left">Available Services</h2>
        
        <!-- Check if services exist -->
        <c:choose>
            <c:when test="${empty services}">
                <div class="text-center text-gray-600 fade-in-up">
                    <p class="text-lg">No services available for this category at the moment.</p>
                  <a href="javascript:history.back()" class="mt-4 inline-block text-blue-600 hover:text-blue-800 underline">
    Back to Categories
</a>

                </div>
            </c:when>
            <c:otherwise>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="service" items="${services}" varStatus="loop">
                        <div class="service-card bg-white rounded-lg shadow-lg p-6 hover-scale fade-in-up" style="animation-delay: ${loop.index * 0.1}s;">
                            <!-- Service Image -->
                              
                            
                            <img 
                                src="${service.servicePicUrl }"
                                alt="${service.serviceName}" 
                                class="w-full h-48 object-cover rounded-lg mb-4"
                            >
                            <!-- Service Details -->
                            <h3 class="text-xl font-semibold text-gray-800">${service.serviceName}</h3>
                            <h3 class="text-xl font-semibold text-gray-800"> Price : ${service.packageEntity.price }</h3>
                            <p class="text-gray-600 text-sm mt-2 line-clamp-2">${service.description}</p>
                          	
                            <a 
                                href="/bookingservice?serviceId=${service.serviceId}&providerId=${service.userEntity.userId}&categoryId=${category.categoryId}&packageId=${service.packageEntity.packageId}" 
                                class="mt-4 inline-block bg-blue-600 text-white px-4 py-2 rounded-full hover:bg-blue-700 transition duration-300"
                            >
                                Book Now
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </section>

    <!-- Quick Booking Button (Floating) -->
    <a href="#services" class="fixed bottom-8 right-8 bg-blue-600 text-white px-6 py-3 rounded-full shadow-lg hover:bg-blue-700 transition duration-300 hover-scale flex items-center space-x-2 z-20">
        <i class="fa-solid fa-calendar-check"></i>
        <span>Quick Book</span>
    </a>

    <!-- Footer -->
    <footer class="bg-gray-900 text-white text-center py-6 mt-12">
        <p class="text-sm">© 2025 Urban Service. All Rights Reserved.</p>
    </footer>

</body>
</html>