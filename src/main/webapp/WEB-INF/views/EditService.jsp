<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Service</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body
	class="bg-gradient-to-r from-blue-100 to-blue-200 flex items-center justify-center min-h-screen">
	<div class="bg-white shadow-2xl rounded-2xl p-8 w-full max-w-lg">
		<h2 class="text-3xl font-extrabold text-gray-800 mb-6 text-center">Edit
			Service</h2>
		<form action="updateservice.jsp" method="post" class="space-y-6">
			<input type="hidden" name="serviceId" value="${service.serviceId}">
			<div>
				<label class="block text-gray-700 text-sm font-semibold mb-1"
					for="serviceName">Service Name</label> <input type="text"
					id="serviceName" name="serviceName" value="${service.serviceName}"
					class="w-full p-3 border border-gray-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-400 focus:outline-none"
					required>
			</div>

			<div>
				<label class="block text-gray-700 text-sm font-semibold mb-1"
					for="description">Description</label>
				<textarea id="description" name="description" rows="4" class="w-full p-3 border border-gray-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-400 focus:outline-none"
					required>>${service.description}
					</textarea>
			</div>

			<div class="flex justify-between">
				<a href="/serviceslist"
					class="bg-gray-600 text-white px-5 py-2 rounded-lg shadow-md hover:bg-gray-700 transition">Cancel</a>
				<button type="submit"
					class="bg-blue-600 text-white px-5 py-2 rounded-lg shadow-md hover:bg-blue-700 transition">Save
					Changes</button>
			</div>

			<div class="mt-4 text-center">
				<button type="button" onclick="history.back()"
					class="bg-gray-400 text-white px-5 py-2 rounded-lg shadow-md hover:bg-gray-500 transition">Go
					Back</button>
			</div>
		</form>
	</div>
</body>
</html>
