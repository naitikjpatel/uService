<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.grownited.entity.ServiceEntity" %>

<script src="https://cdn.tailwindcss.com"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Management Dashboard</title>
    <style>
        .table-container { overflow-x: auto; }
        .action-link { transition: color 0.2s ease-in-out; }
        .action-link:hover { text-decoration: underline; }
        .disabled { opacity: 0.5; pointer-events: none; }
    </style>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-4">
    <div class="w-full max-w-7xl mx-auto bg-white rounded-xl shadow-lg p-6">
        <header class="mb-6">
            <h1 class="text-3xl font-semibold text-gray-800">Service Management</h1>
            <p class="text-sm text-gray-500">Manage your services efficiently</p>
        </header>

        <!-- Table -->
        <div class="table-container">
            <table class="w-full border-collapse text-sm">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="px-6 py-3 text-left font-medium text-gray-700 border-b">Service Name</th>
                        <th class="px-6 py-3 text-left font-medium text-gray-700 border-b">Description</th>
                        <th class="px-6 py-3 text-left font-medium text-gray-700 border-b">Category</th>
                        <th class="px-6 py-3 text-left font-medium text-gray-700 border-b">Provider</th>
                        <th class="px-6 py-3 text-left font-medium text-gray-700 border-b">Created</th>
                        <th class="px-6 py-3 text-left font-medium text-gray-700 border-b">Updated</th>
                        <th class="px-6 py-3 text-center font-medium text-gray-700 border-b">Actions</th>
                    </tr>
                </thead>
                <tbody id="serviceTableBody">
                    <c:choose>
                        <c:when test="${empty services}">
                            <tr>
                                <td colspan="7" class="px-6 py-4 text-center text-gray-500">No services available.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="service" items="${services}">
                                <tr class="service-row hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-4 border-b text-gray-800">${service.serviceName}</td>
                                    <td class="px-6 py-4 border-b text-gray-600">${service.description}</td>
                                    <td class="px-6 py-4 border-b text-gray-600">${service.category.categoryName}</td>
                                    <td class="px-6 py-4 border-b text-gray-600">${service.userEntity.name}</td>
                                    <td class="px-6 py-4 border-b text-gray-600">
                                        <fmt:formatDate value="${service.createdAt}" pattern="MMM dd, yyyy HH:mm" />
                                    </td>
                                    <td class="px-6 py-4 border-b text-gray-600">
                                        <fmt:formatDate value="${service.updatedAt}" pattern="MMM dd, yyyy HH:mm" />
                                    </td>
                                    <td class="px-6 py-4 border-b text-center space-x-4">
                                        <a href="${pageContext.request.contextPath}/editservice?id=${service.serviceId}"
                                           class="text-blue-600 action-link">Edit</a>
                                        <a href="${pageContext.request.contextPath}/deleteservice?id=${service.serviceId}"
                                           class="text-red-600 action-link"
                                           onclick="return confirm('Are you sure you want to delete this service?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <!-- Pagination Controls -->
        <div class="flex justify-center items-center space-x-2 mt-4">
            <button id="prevPage" class="px-4 py-2 bg-gray-300 rounded-md disabled">Previous</button>
            <span id="pageNumber" class="text-gray-700">Page 1</span>
            <button id="nextPage" class="px-4 py-2 bg-gray-300 rounded-md">Next</button>
        </div>

        <footer class="mt-6 text-right">
            <a href="${pageContext.request.contextPath}/newservice"
               class="inline-block px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors">
                Add New Service
            </a>
        </footer>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const rows = document.querySelectorAll(".service-row"); // Select all service rows
            const rowsPerPage = 5; // Set number of rows per page
            let currentPage = 1;

            function showPage(page) {
                let start = (page - 1) * rowsPerPage;
                let end = start + rowsPerPage;

                rows.forEach((row, index) => {
                    row.style.display = (index >= start && index < end) ? "table-row" : "none";
                });

                document.getElementById("pageNumber").textContent = `Page ${page}`;
                document.getElementById("prevPage").classList.toggle("disabled", page === 1);
                document.getElementById("nextPage").classList.toggle("disabled", end >= rows.length);
            }

            document.getElementById("prevPage").addEventListener("click", () => {
                if (currentPage > 1) {
                    currentPage--;
                    showPage(currentPage);
                }
            });

            document.getElementById("nextPage").addEventListener("click", () => {
                if (currentPage * rowsPerPage < rows.length) {
                    currentPage++;
                    showPage(currentPage);
                }
            });

            showPage(currentPage); // Show the first page initially
        });
    </script>
</body>
</html>
