<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Users - Admin Panel</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">
    <div class="w-full max-w-7xl bg-white shadow-lg rounded-lg p-6">
        <h1 class="text-3xl font-semibold text-center text-gray-800 mb-6">Users Management</h1>

        <div class="flex flex-col md:flex-row md:items-center md:justify-between space-y-3 md:space-y-0 mb-4">
            <input type="text" id="searchInput" class="w-full md:w-1/3 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Search by Name, Email, Role..." onkeyup="filterTable()">
            <select id="roleFilter" class="w-full md:w-1/4 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" onchange="filterTable()">
                <option value="">Filter by Role</option>
                <option value="Admin">Admin</option>
                <option value="User">User</option>
                <option value="Service_Provider">Service Provider</option>
            </select>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full border-collapse border border-gray-300 shadow-sm rounded-lg">
                <thead>
                    <tr class="bg-blue-600 text-white text-sm uppercase tracking-wider">
                        <th class="py-3 px-4 text-left">#</th>
                        <th class="py-3 px-4 text-left">Name</th>
                        <th class="py-3 px-4 text-left">Email</th>
                        <th class="py-3 px-4 text-left">Phone</th>
                        <th class="py-3 px-4 text-left">Role</th>
                        <th class="py-3 px-4 text-left">Status</th>
                        <th class="py-3 px-4 text-left">Created</th>
                        <th class="py-3 px-4 text-left">Updated</th>
                        <th class="py-3 px-4 text-center">Actions</th>
                    </tr>
                </thead>
                <tbody id="userTable" class="text-gray-700 text-sm">
                    <c:forEach items="${users}" var="user" varStatus="status">
                        <tr class="border-b border-gray-200 hover:bg-gray-100 transition-all duration-200">
                            <td class="py-3 px-4 font-semibold text-gray-800">${status.index + 1}</td>
                            <td class="py-3 px-4">${user.name}</td>
                            <td class="py-3 px-4">${user.emailId}</td>
                            <td class="py-3 px-4">${user.phone}</td>
                            <td class="py-3 px-4 role">${user.role}</td>
                            <td class="py-3 px-4">
                                <span class="px-3 py-1 rounded-lg text-white text-sm font-semibold
                                    <c:choose>
                                        <c:when test='${user.status == "ACTIVE"}'> bg-green-500 </c:when>
                                        <c:when test='${user.status == "INACTIVE"}'> bg-gray-500 </c:when>
                                        <c:when test='${user.status == "SUSPENDED"}'> bg-red-500 </c:when>
                                    </c:choose>">
                                    ${user.status}
                                </span>
                            </td>
                            <td class="py-3 px-4">${user.createdAt}</td>
                            <td class="py-3 px-4">${user.updatedAt}</td>
                            <td class="py-3 px-4 flex justify-center space-x-3">
                                <a href="/edituser?id=${user.userId}" class="bg-green-500 text-white px-3 py-1 rounded-lg shadow-md hover:bg-green-600 transition-all duration-200">Edit</a>
                                <a href="/deleteuser?id=${user.userId}" class="bg-red-500 text-white px-3 py-1 rounded-lg shadow-md hover:bg-red-600 transition-all duration-200">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="flex justify-center mt-4">
            <button onclick="prevPage()" class="bg-gray-500 text-white px-4 py-2 rounded-lg shadow-md mx-1">Previous</button>
            <span id="pageNumber" class="px-4 py-2 font-semibold"></span>
            <button onclick="nextPage()" class="bg-gray-500 text-white px-4 py-2 rounded-lg shadow-md mx-1">Next</button>
        </div>
    </div>

    <script>
        let currentPage = 1;
        let rowsPerPage = 5;
        
        function paginateTable() {
            let tableRows = document.getElementById("userTable").getElementsByTagName("tr");
            let totalRows = tableRows.length;
            let totalPages = Math.ceil(totalRows / rowsPerPage);
            
            for (let i = 0; i < totalRows; i++) {
                tableRows[i].style.display = (i >= (currentPage - 1) * rowsPerPage && i < currentPage * rowsPerPage) ? "" : "none";
            }
            document.getElementById("pageNumber").textContent = `Page ${currentPage} of ${totalPages}`;
        }

        function nextPage() {
            let tableRows = document.getElementById("userTable").getElementsByTagName("tr").length;
            if (currentPage * rowsPerPage < tableRows) {
                currentPage++;
                paginateTable();
            }
        }

        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                paginateTable();
            }
        }

        function filterTable() {
            let searchInput = document.getElementById("searchInput").value.toLowerCase();
            let roleFilter = document.getElementById("roleFilter").value.toLowerCase();
            let tableRows = document.getElementById("userTable").getElementsByTagName("tr");
            
            for (let i = 0; i < tableRows.length; i++) {
                let name = tableRows[i].cells[1]?.textContent.toLowerCase() || "";
                let email = tableRows[i].cells[2]?.textContent.toLowerCase() || "";
                let role = tableRows[i].cells[4]?.textContent.toLowerCase() || "";
                let matchesSearch = name.includes(searchInput) || email.includes(searchInput);
                let matchesRole = roleFilter === "" || role.includes(roleFilter);
                tableRows[i].style.display = (matchesSearch && matchesRole) ? "" : "none";
            }
            paginateTable();
        }

        window.onload = paginateTable;
    </script>
</body>
</html>
