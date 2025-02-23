<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.grownited.entity.UserEntity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    UUID entity = (UUID) session.getAttribute("userId");

    if (entity == null) {
        response.sendRedirect("/login"); // Redirect if user is not logged in
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Service</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex justify-center items-center h-screen">
    <div class="bg-white shadow-lg rounded-lg p-6 w-96">
        <h2 class="text-2xl font-semibold text-center text-gray-800">Add Service</h2>

        <form action="/addservice" method="post" class="mt-4">
            <!-- Service Name -->
            <div class="mb-3">
                <label class="block text-gray-700">Service Name</label>
                <input type="text" name="serviceName" required class="w-full p-2 border rounded focus:outline-none focus:ring focus:border-blue-400">
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label class="block text-gray-700">Description</label>
                <textarea name="description" required class="w-full p-2 border rounded focus:outline-none focus:ring focus:border-blue-400"></textarea>
            </div>

            <!-- Category Dropdown -->
            <div class="mb-3">
                <label class="block text-gray-700">Category</label>
                
                <select name="categoryId" required class="w-full p-2 border rounded focus:outline-none focus:ring focus:border-blue-400">
                <c:forEach items="${categories}" var="category">
                    <option value="${category.categoryId}">${category.categoryName }</option>
                    <!-- Add dynamic categories from backend -->
                    </c:forEach>
                </select>
                
            </div>

            <!-- Hidden Service Provider ID -->
            <input type="hidden" name="providerId" value="<%= entity %>">

            <!-- Submit Button -->
            <div class="mt-4">
                <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded hover:bg-blue-600">Add Service</button>
            </div>
        </form>
    </div>
</body>
</html>
