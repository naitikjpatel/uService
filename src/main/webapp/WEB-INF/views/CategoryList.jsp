<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white">

    <div class="container mx-auto p-6">
        <!-- Search & Actions -->
        <div class="flex justify-between items-center mb-4">
            <input type="text" placeholder="Search" class="bg-gray-800 text-white px-4 py-2 rounded-lg w-1/3 focus:outline-none">
            <div class="flex gap-2">
                <a href="/opencategory" class="bg-blue-600 px-4 py-2 rounded-lg text-white">+ Add Product</a>
                <button class="bg-gray-700 px-4 py-2 rounded-lg">Actions</button>
                <button class="bg-gray-700 px-4 py-2 rounded-lg">Filter</button>
            </div>
        </div>

        <!-- Product Table -->
        <div class="bg-gray-800 rounded-lg p-4">
            <table class="w-full text-left">
                <thead>
                    <tr class="text-gray-400 uppercase border-b border-gray-700">
                        
                        <th class="p-3">Category</th>
                        
                        <th class="p-3">Description</th>
                        
                        <th class="p-3">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${categoryList}" var="category">
                    <!-- Dummy Data for Display -->
                    <tr class="border-b border-gray-700">
                        
                        <td class="p-3">${category.categoryName }</td>
                        
                        <td class="p-3">${category.categoryDescription }</td>
                        
                        <td class="p-3 w-[10%]">
                              <a href="/editcategory/${category.categoryId}" 
   class="text-blue-400 hover:text-yellow-400">Edit</a> |

                            <a href="/deletecategory/${category.categoryId}" class="text-red-400">Delete</a>
  </td>
                    </tr>
                    </c:forEach>
                  
                    
                </tbody>	
            </table>
        </div>
    </div>

</body>
</html>
