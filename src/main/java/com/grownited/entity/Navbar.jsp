<%@page import="java.util.UUID"%>
<%@page import="com.grownited.entity.UserEntity"%>
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
					<a href="/home" class="text-white hover:text-gray-400">Urban</a>

			</div>
			<ul class="hidden md:flex space-x-4">

				<li><a href="aboutus" class="text-white hover:text-gray-400">About</a></li>
				<li><a href="#" class="text-white hover:text-gray-400">Services</a></li>
				<li><a href="contactus" class="text-white hover:text-gray-400">Contact</a></li>
				<%
				UUID userId = (UUID) session.getAttribute("userId");
				%>
				<li>
					<%
					if (userId != null) {
					%> <!-- User is logged in, show profile icon --> <a href="profile"
					class="text-white hover:text-gray-400"> <img
						src="data:image/png;base64,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" alt="Profile"
						class="w-6 h-6 rounded-full inline">
				</a> <%
 					} else {
						 %> <!-- User is not logged in, show login link --> <a href="login"
					class="text-white hover:text-gray-400">Login</a> <%
 						}
					 %>
				</li>

			</ul>

		</div>
	</nav>
</body>
</html>