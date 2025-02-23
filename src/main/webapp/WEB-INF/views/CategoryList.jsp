<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Category Management</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white">

	<div class="container mx-auto p-6">
		<h1 class="text-3xl font-semibold text-center mb-6">Category
			Management</h1>

		<!-- FILTER OPTIONS -->
		<div
			class="flex flex-col md:flex-row md:items-center md:justify-between space-y-3 md:space-y-0 mb-4">
			<!-- Search Input -->
			<input type="text" id="searchInput"
				class="w-full md:w-1/3 px-4 py-2 bg-gray-800 text-white rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
				placeholder="Search by Name or Description..."
				onkeyup="filterTable()">

			<!-- Category Dropdown -->
			<select id="categoryFilter"
				class="w-full md:w-1/4 px-4 py-2 bg-gray-800 text-white rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
				onchange="filterTable()">
				<option value="">Filter by Category</option>
				<c:forEach items="${categoryList}" var="category">
					<option value="${category.categoryName}">${category.categoryName}</option>
				</c:forEach>
			</select>

			<!-- Add Category Button -->
			<a href="/opencategory"
				class="bg-blue-600 px-4 py-2 rounded-lg text-white">+ Add
				Category</a>
		</div>

		<!-- Category Table -->
		<div class="bg-gray-800 rounded-lg p-4">
			<table class="w-full text-left">
				<thead>
					<tr class="text-gray-400 uppercase border-b border-gray-700">
						<th class="p-3">Category</th>
						<th class="p-3">Description</th>
						<th class="p-3 text-center">Actions</th>
					</tr>
				</thead>
				<tbody id="categoryTable">
					<c:forEach items="${categoryList}" var="category">
						<tr
							class="border-b border-gray-700 hover:bg-gray-700 transition-all duration-200">
							<td class="p-3 categoryName">${category.categoryName}</td>
							<td class="p-3 categoryDescription">${category.categoryDescription}</td>
							<td class="p-3 text-center">
							<td class="p-3 text-center flex justify-center gap-4">
								<!-- Edit Icon --> <a
								href="/editcategory/${category.categoryId}"
								class="text-blue-400 hover:text-yellow-400"> <svg
										xmlns="http://www.w3.org/2000/svg" class="w-5 h-5"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round">
            <path d="M12 20h9"></path>
            <path
											d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
        </svg>
							</a> <!-- Delete Icon --> <a
								href="/deletecategory/${category.categoryId}"
								class="text-red-400 hover:text-red-500"> <svg
										xmlns="http://www.w3.org/2000/svg" class="w-5 h-5"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round">
            <polyline points="3 6 5 6 21 6"></polyline>
            <path d="M19 6L18 20a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"></path>
            <path d="M10 11L10 17"></path>
            <path d="M14 11L14 17"></path>
        </svg>
							</a>
							</td>							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
        function filterTable() {
            let searchInput = document.getElementById("searchInput").value.toLowerCase();
            let categoryFilter = document.getElementById("categoryFilter").value.toLowerCase();
            let tableRows = document.getElementById("categoryTable").getElementsByTagName("tr");

            for (let i = 0; i < tableRows.length; i++) {
                let categoryName = tableRows[i].getElementsByClassName("categoryName")[0]?.textContent.toLowerCase() || "";
                let categoryDescription = tableRows[i].getElementsByClassName("categoryDescription")[0]?.textContent.toLowerCase() || "";

                let matchesSearch = categoryName.includes(searchInput) || categoryDescription.includes(searchInput);
                let matchesCategory = categoryFilter === "" || categoryName.includes(categoryFilter);

                tableRows[i].style.display = (matchesSearch && matchesCategory) ? "" : "none";
            }
        }
    </script>

</body>
</html>
