<%@page import="com.grownited.entity.UserAddressEntity"%>
<%@page import="com.grownited.enumD.Role"%>
<%@page import="com.grownited.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// Fetch user entity from request
UserEntity entity = (UserEntity) request.getAttribute("user");
if (entity == null) {
	response.sendRedirect("/login"); // Redirect to login if not found
	return;
}
boolean isServiceProvider = entity.getRole() == Role.SERVICE_PROVIDER;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Advanced User Profile</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex justify-center items-center h-screen">
	<div class="bg-white shadow-lg rounded-lg p-6 w-full max-w-2xl">

		<!-- Profile Header -->
		<div class="flex items-center space-x-4">
			<img id="profilePic" src="https://via.placeholder.com/100"
				alt="Profile"
				class="rounded-full w-24 h-24 border-4 border-blue-500 cursor-pointer"
				onclick="openModal()">
			<div>
				<h2 class="text-2xl font-semibold text-gray-800"><%=entity.getName()%></h2>
				<p class="text-gray-600 text-sm">User Profile</p>
			</div>
		</div>

		<form action="/updateuserprofile" method="post" class="mt-4 space-y-4">
			<input type="hidden" name="userId" value="<%=entity.getUserId()%>">

			<label class="block text-gray-700 font-semibold">Name:</label> <input
				type="text" name="name" value="<%=entity.getName()%>"
				class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-blue-400">

			<label class="block text-gray-700 font-semibold">Email:</label> <input
				type="email" name="emailId" value="<%=entity.getEmailId()%>"
				class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-blue-400">

			<label class="block text-gray-700 font-semibold">Phone:</label> <input
				type="text" name="phone" value="<%=entity.getPhone()%>"
				class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-blue-400">

			<label class="block text-gray-700 font-semibold">Address:</label> <input
				type="text" name="userAddressEntity.addressLine"
				value="<%=(entity.getUserAddressEntity() != null) ? entity.getUserAddressEntity().getAddressLine() : ""%>"
				class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-blue-400">

			<%
			if (entity.getRole() == Role.SERVICE_PROVIDER) {
			%>
			<label class="block text-gray-700 font-semibold">Status:</label> <select
				name="status"
				class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-blue-400">
				<option value="ACTIVE"
					<%=entity.getStatus().equals("ACTIVE") ? "selected" : ""%>>Active</option>
				<option value="INACTIVE"
					<%=entity.getStatus().equals("INACTIVE") ? "selected" : ""%>>Inactive</option>
				<option value="SUSPENDED"
					<%=entity.getStatus().equals("SUSPENDED") ? "selected" : ""%>>Suspended</option>
			</select>
			<%
			}
			%>

			<div class="flex space-x-4 mt-4">
				<button type="submit"
					class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 w-full">
					Save Changes</button>
				<button type="reset"
					class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 w-full">
					Reset</button>
			</div>
		</form>

		<!-- Service Provider Section -->
		<%
		if (isServiceProvider) {
		%>
		<div class="mt-4">
			<a href="/newservice"
				class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 block text-center">
				Add Service </a>
		</div>
		<%
		}
		%>

		<!-- Logout Button -->
		<div class="mt-4">
			<a href="/logout"
				class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 block text-center">
				Logout </a>
		</div>
	</div>

	<!-- Modal for Profile Picture Upload -->
	<div id="profileModal"
		class="fixed inset-0 flex justify-center items-center bg-black bg-opacity-50 hidden">
		<div class="bg-white p-6 rounded-lg w-96">
			<h2 class="text-lg font-semibold mb-4">Upload Profile Picture</h2>
			<input type="file" id="profileInput"
				class="block w-full border p-2 mb-4">
			<button onclick="closeModal()"
				class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Cancel</button>
		</div>
	</div>

	<script>
		function openModal() {
			document.getElementById('profileModal').classList.remove('hidden');
		}
		function closeModal() {
			document.getElementById('profileModal').classList.add('hidden');
		}
	</script>
</body>
</html>
