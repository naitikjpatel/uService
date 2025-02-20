<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	    <nav class="bg-gray-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <div class="flex items-center">
               <!-- <a href="/home"> <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo" class="h-10 w-10"></a> -->
               <a href="/home" class="text-white hover:text-gray-400">Urban</a>
                
            </div>
            <ul class="hidden md:flex space-x-4">
                
                <li><a href="aboutus" class="text-white hover:text-gray-400">About</a></li>
                <li><a href="#" class="text-white hover:text-gray-400">Services</a></li>
                <li><a href="contactus" class="text-white hover:text-gray-400">Contact</a></li>
                <li><a href="login" class="text-white hover:text-gray-400">Login</a></li>
                
            </ul>
            
        </div>
    </nav>
</body>
</html>