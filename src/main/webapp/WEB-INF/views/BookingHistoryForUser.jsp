<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page session="true"%>

<%
    UUID userId = (UUID) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("/login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    
    <!-- Navbar -->
    <nav class="bg-blue-700 p-6 text-white shadow-lg">
        <div class="max-w-7xl mx-auto flex justify-between items-center">
            <h1 class="text-3xl font-bold">Urban Service</h1>
            <div>
                <a href="loginuserhome" class="bg-white text-blue-700 px-4 py-2 rounded-lg">Home</a>
            </div>
        </div>
    </nav>
    
    <!-- Booking List -->
    <section class="max-w-6xl mx-auto mt-12 p-8 bg-white rounded-2xl shadow-xl">
        <h2 class="text-3xl font-bold text-blue-700 mb-6">My Booking History</h2>
        
        <c:choose>
            <c:when test="${not empty bookingList}">
                <table class="w-full border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-blue-600 text-white">
                            <th class="border border-gray-300 px-4 py-2">Provider Name</th>
                            <th class="border border-gray-300 px-4 py-2">Contact No</th>
                            <th class="border border-gray-300 px-4 py-2">Service</th>
                            <th class="border border-gray-300 px-4 py-2">Date</th>
                            <th class="border border-gray-300 px-4 py-2">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookingList}">
                            <tr class="text-center">
                                <td class="border border-gray-300 px-4 py-2">${booking.serviceProvider.name}</td>
                                <td class="border border-gray-300 px-4 py-2">${booking.serviceProvider.phone}</td>
                                <td class="border border-gray-300 px-4 py-2">${booking.service.serviceName}</td>
                                <td class="border border-gray-300 px-4 py-2">${booking.bookingDate}</td>
                                <td class="border border-gray-300 px-4 py-2 mt-2">
                                    <c:choose>
                                        <c:when test="${booking.status eq 'ACCEPT'}">
                                            <span class="px-4 py-2 rounded-lg text-white bg-green-500">${booking.status}</span>
                                        </c:when>
                                        <c:when test="${booking.status eq 'REJECT'}">
                                            <span class="px-4 py-2 rounded-lg text-white bg-red-500">${booking.status}</span>
                                        </c:when>
                                        <c:when test="${booking.status eq 'PENDING'}">
                                            <span class="px-4 py-2 rounded-lg text-white bg-yellow-500">${booking.status}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="px-4 py-2 rounded-lg text-white bg-gray-500">${booking.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="text-gray-600">You have no bookings yet.</p>
            </c:otherwise>
        </c:choose>
    </section>
</body>
</html>
