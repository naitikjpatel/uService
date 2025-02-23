<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body class="bg-gray-100">

	<!-- Navbar -->
	<nav
		class="bg-blue-600 p-4 text-white flex justify-between items-center">
		<h1 class="text-2xl font-bold">Urban Service</h1>
		<div class="flex space-x-6">
			<a href="#" class="hover:underline">Home</a> <a
				class="hover:underline">Categories</a>




		</div>
		<div class="flex items-center space-x-4">
			<a href="/profile" class="flex items-center space-x-2 border-width:1px ml-[10px]" > 
		<i class="fa-solid fa-user fa-2x"></i>

			</a> <a href="/logout"
				class="bg-red-500 px-4 py-2 rounded-lg hover:bg-red-700">Logout</a>
		</div>
	</nav>

	<!-- About Section -->
	<section
		class="max-w-6xl mx-auto mt-10 p-6 bg-white rounded-lg shadow-lg">
		<h2 class="text-3xl font-semibold text-blue-600">About Urban
			Service</h2>
		<p class="mt-2 text-gray-700">Urban Service connects you with
			verified professionals for home services like plumbing, electrical
			work, salon services, and more.</p>
	</section>

	<!-- Stats Section -->
	<section
		class="max-w-6xl mx-auto mt-10 p-6 bg-white rounded-lg shadow-lg grid grid-cols-2 text-center">
		<div>
			<h3 class="text-3xl font-semibold text-green-600">10,000+</h3>
			<p class="text-gray-700">Happy Customers</p>
		</div>
		<div>
			<h3 class="text-3xl font-semibold text-green-600">5,000+</h3>
			<p class="text-gray-700">Service Providers</p>
		</div>
	</section>

	<!-- Categories Section -->
	<section class="max-w-6xl mx-auto mt-10 p-6">
		<h2 class="text-2xl font-semibold text-blue-600">Popular
			Categories</h2>
		<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-6">
			<div class="bg-white p-4 rounded-lg shadow-md text-center">
				<img src="https://source.unsplash.com/400x300/?cleaning"
					class="w-full h-40 object-cover rounded-md">
				<h3 class="text-xl font-semibold mt-2">Home Cleaning</h3>
			</div>
			<div class="bg-white p-4 rounded-lg shadow-md text-center">
				<img src="https://source.unsplash.com/400x300/?electrician"
					class="w-full h-40 object-cover rounded-md">
				<h3 class="text-xl font-semibold mt-2">Electrician Services</h3>
			</div>
			<div class="bg-white p-4 rounded-lg shadow-md text-center">
				<img src="https://source.unsplash.com/400x300/?plumber"
					class="w-full h-40 object-cover rounded-md">
				<h3 class="text-xl font-semibold mt-2">Plumbing</h3>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="bg-black text-white text-center py-4 mt-10">
		<p>&copy; 2025 Urban Service. All Rights Reserved.</p>
	</footer>

</body>
</html>
