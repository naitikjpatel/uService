<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.grownited.entity.ServiceEntity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Service List</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
	<div class="max-w-6xl mx-auto bg-white p-6 rounded-lg shadow-md">
		<h2 class="text-2xl font-bold mb-4">Service List</h2>
		<table class="w-full border-collapse border border-gray-300">
			<thead>
				<tr class="bg-gray-200">
					<th class="border border-gray-300 px-4 py-2">Service Name</th>
					<th class="border border-gray-300 px-4 py-2">Description</th>
					<th class="border border-gray-300 px-4 py-2">Category</th>
					<th class="border border-gray-300 px-4 py-2">Provider</th>
					<th class="border border-gray-300 px-4 py-2">Created At</th>
					<th class="border border-gray-300 px-4 py-2">Updated At</th>
					<th class="border border-gray-300 px-4 py-2">Actions</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="service" items="${services}">
					<tr class="bg-white hover:bg-gray-100">
						<td class="border border-gray-300 px-4 py-2">${service.serviceName}</td>
						<td class="border border-gray-300 px-4 py-2">${service.description}</td>
						<td class="border border-gray-300 px-4 py-2">${service.category.categoryName}</td>
						<td class="border border-gray-300 px-4 py-2">${service.userEntity.name}</td>
						<td class="border border-gray-300 px-4 py-2">${service.createdAt}</td>
						<td class="border border-gray-300 px-4 py-2">${service.updatedAt}</td>
						<td class="border border-gray-300 px-4 py-2 text-center"><a
							href="editservice?id=${service.serviceId}"
							class="text-blue-500 hover:underline mr-2">Edit</a> <a
							href="deleteservice?id=${service.serviceId}"
							class="text-red-500 hover:underline">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
