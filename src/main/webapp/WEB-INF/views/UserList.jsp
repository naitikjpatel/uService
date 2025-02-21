<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users - Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<!-- adminlte -->
<body class="bg-gray-100 flex items-center justify-center  min-h-screen">

    <div class="p-6 w-full max-w-6xl">
        <h1 class="text-3xl font-bold mb-3 text-gray-800 text-center">Users Management</h1>

        <div class="overflow-x-auto bg-white shadow-lg rounded-lg">
            <table class="min-w-full border-collapse border border-gray-300">
                <thead>
                    <tr class="bg-blue-500 text-white uppercase text-sm leading-normal">
                        <th class="py-3 px-6 text-left">#</th>
                        <th class="py-3 px-6 text-left">Name</th>
                        <th class="py-3 px-6 text-left">Email</th>
                        <th class="py-3 px-6 text-left">Password</th>
                        <th class="py-3 px-6 text-left">Role</th>
                        <th class="py-3 px-6 text-left">Status</th>
                        <th class="py-3 px-6 text-center">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-gray-600 text-sm">
                    <% int count = 1; %>
                    <c:forEach items="${users}" var="user">
                        <tr class="border-b border-gray-200 hover:bg-gray-100 transition">
                            <td class="py-3 px-6 whitespace-nowrap"><%= count++ %></td>
                            <td class="py-3 px-6">${user.name}</td>
                            <td class="py-3 px-6">${user.emailId}</td>
                            <td class="py-3 px-6">${user.password}</td>
                            <td class="py-3 px-6">${user.role}</td>
                            <td class="py-3 px-6">
                                <span class="px-3 py-1 rounded-full text-xs font-semibold 
                                    ${user.status == 'ACTIVE' ? 'bg-green-200 text-green-800' : 'bg-red-200 text-red-800'}">
                                    ${user.status}
                                </span>
                            </td>
                            <td class="py-3 px-6 flex justify-center space-x-2">
                                <a href="editUser.jsp?id=${user.userId}" 
                                   class="bg-blue-500 text-white px-3 py-1 rounded-lg hover:bg-blue-600 transition">
                                    Edit
                                </a>
                                <form action="deleteUser" method="POST" onsubmit="return confirm('Are you sure?')">
                                    <input type="hidden" name="id" value="${user.userId}">
                                    <button type="submit" 
                                            class="bg-red-500 text-white px-3 py-1 rounded-lg hover:bg-red-600 transition">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
