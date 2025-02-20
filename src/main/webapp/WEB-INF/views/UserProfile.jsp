<%@page import="com.grownited.entity.UserAddressEntity"%>
<%@page import="com.grownited.enumD.Role"%>
<%@page import="com.grownited.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserEntity entity = (UserEntity) session.getAttribute("user");

if (entity == null) {
	response.sendRedirect("/login"); // Redirect to login if user is not logged in
	return;
}

// Check if the user is a service provider

boolean isServiceProvider = entity.getRole() == Role.SERVICE_PROVIDER;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex justify-center items-center h-screen">
	<div class="bg-white shadow-lg rounded-lg p-6 w-96 text-center">
		<div class="flex justify-center">
			<img src="https://via.placeholder.com/100" alt="Profile"
				class="rounded-full w-24 h-24 border-4 border-blue-500">
		</div>
		<h2 class="text-2xl font-semibold mt-4 text-gray-80"><%=entity.getName()%></h2>
		<p class="text-gray-600 text-sm">User Profile</p>

		<!-- Profile Update Form -->
		<form action="/updateuseraddress" method="post"
			class="mt-4 text-left space-y-3">

			<%
			if (entity != null) {
			%>
			<input type="hidden" name="userId" value="<%=entity.getUserId()%>">
			<%
			}
			%>


			<label for="address" class="block text-gray-700 font-semibold">Address:</label>
			<input type="text" id="address" name="addressLine"
				class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-400"
				>

			<button type="submit"
				class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 w-full mt-3">Update
				Profile</button>
		</form>

		<!-- Add Service Button for Service Providers -->
		<%
		if (isServiceProvider) {
		%>
		<div class="mt-4">
			<a href="/add-service"
				class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 block text-center">Add
				Service</a>
		</div>
		<%
		}
		%>

		<div class="mt-4">
			<a href="/logout"
				class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 block text-center">Logout</a>
		</div>
	</div>
</body>
</html>
