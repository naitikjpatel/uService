<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Service Provider Bookings</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/@motionone/dom"></script>
    <script defer>
        document.addEventListener("DOMContentLoaded", function () {
            const rowsPerPage = 5; // Change this value to set the number of rows per page
            const table = document.querySelector("tbody");
            const rows = Array.from(table.querySelectorAll("tr"));
            const totalPages = Math.ceil(rows.length / rowsPerPage);
            let currentPage = 1;
            
            function displayRows() {
                rows.forEach((row, index) => {
                    row.style.display = (index >= (currentPage - 1) * rowsPerPage && index < currentPage * rowsPerPage) ? "table-row" : "none";
                });
            }
            
            function updatePagination() {
                document.getElementById("pageNumber").textContent = `Page ${currentPage} of ${totalPages}`;
            }
            
            document.getElementById("prevPage").addEventListener("click", function () {
                if (currentPage > 1) {
                    currentPage--;
                    displayRows();
                    updatePagination();
                }
            });
            
            document.getElementById("nextPage").addEventListener("click", function () {
                if (currentPage < totalPages) {
                    currentPage++;
                    displayRows();
                    updatePagination();
                }
            });
            
            displayRows();
            updatePagination();
        });
    </script>
</head>
<body class="bg-gray-100 p-6 flex justify-center items-center min-h-screen">

    <div class="max-w-6xl w-full bg-white shadow-lg rounded-2xl p-6">
        <h1 class="text-3xl font-bold text-center text-gray-700 mb-6">My Bookings</h1>
        
        <div class="overflow-hidden rounded-lg shadow-md">
            <table class="w-full border-collapse border border-gray-300">
                <thead>
                    <tr class="bg-blue-600 text-white text-lg">
                        <th class="py-3 px-5">#</th>
                        <th class="py-3 px-5">Service Name</th>
                        <th class="py-3 px-5">Customer</th>
                        <th class="py-3 px-5">Booking Date</th>
                        <th class="py-3 px-5">Status</th>
                        <th class="py-3 px-5">Change Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}" varStatus="loop">
                        <tr class="border-b border-gray-200 hover:bg-blue-100 transition duration-300 ease-in-out transform hover:scale-105">
                            <td class="py-4 px-5 text-center">${loop.index + 1}</td>
                            <td class="py-4 px-5 font-semibold text-gray-700">${booking.service.serviceName}</td>
                            <td class="py-4 px-5 text-gray-600">${booking.user.name}</td>
                            <td class="py-4 px-5 text-gray-600">${booking.bookingDate}</td>
                            <td class="py-4 px-5 text-center">
                                <span class="px-4 py-2 rounded-lg text-white text-sm font-semibold"
                                      data-status="${booking.status}">
                                    ${booking.status}
                                </span>
                            </td>
                            <td class="py-4 px-5 text-center">
                                <form action="/provider/updatebookingstatus" method="post">
                                    <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                    <select name="status" class="border border-gray-300 rounded-lg px-3 py-1">
                                        <option value="ACCEPT">Accept</option>
                                        <option value="REJECT">Reject</option>
                                    </select>
                                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">
                                        Update
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="flex justify-between mt-4">
            <button id="prevPage" class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600">Previous</button>
            <span id="pageNumber" class="text-lg font-semibold"></span>
            <button id="nextPage" class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600">Next</button>
        </div>
    </div>
    
    <script>
        document.querySelectorAll('[data-status]').forEach(el => {
            const status = el.getAttribute('data-status');
            if (status === "ACCEPT") el.classList.add('bg-green-500');
            else if (status === "PENDING") el.classList.add('bg-yellow-500');
            else if (status === "REJECT") el.classList.add('bg-red-500');
        });
    </script>
</body>
</html>
