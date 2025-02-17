
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="jakarta.validation.constraints.AssertFalse.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<!-- 

List<Service> services = new ArrayList<>();
services.add(new Service("Electrician", "Professional electricians for all types of electrical work", 500.00));
services.add(new Service("Plumber", "Experienced plumbers for plumbing services and repairs", 400.00));
services.add(new Service("Cleaner", "House cleaning services with expert cleaning staff", 300.00));


 -->
    <!-- Navbar -->
    <nav class="bg-blue-600 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a href="/" class="text-white font-bold text-2xl">Urban Service</a>
            <ul class="flex space-x-6">
                <li><a href="/" class="text-white">Home</a></li>
                <li><a href="/aboutus" class="text-white">About Us</a></li>
                <li><a href="/services" class="text-white">Services</a></li>
                <li><a href="/contact" class="text-white">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Services Section -->
    <section class="bg-white py-16">
        <div class="container mx-auto text-center">
            <h1 class="text-4xl font-semibold text-gray-800 mb-8">Our Services</h1>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <c:forEach var="service" items="${services}">
                    <div class="bg-gray-100 p-6 rounded-lg shadow-lg">
                        <h2 class="text-2xl font-semibold text-gray-800 mb-4">${service.name}</h2>
                        <p class="text-gray-600 mb-4">${service.description}</p>
                        <p class="text-xl font-semibold text-blue-600">Price: ₹${service.price}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-blue-600 py-8">
        <div class="container mx-auto text-center">
            <p class="text-white">© 2025 Urban Service. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
