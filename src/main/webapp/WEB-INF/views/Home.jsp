
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UrbanService - Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
/* Custom Animations */
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes bounce { 0%, 100% {
	transform: translateY(0);
}

50


%
{
transform


:


translateY
(


-10px


)
;


}
}
@
keyframes slideInLeft {from { opacity:0;
	transform: translateX(-30px);
}

to {
	opacity: 1;
	transform: translateX(0);
}

}
@
keyframes pulse { 0% {
	transform: scale(1);
}

50


%
{
transform


:


scale
(


1
.05


)
;


}
100


%
{
transform


:


scale
(


1


)
;


}
}
@
keyframes fromTopLeft {from { opacity:0;
	transform: translate(-100px, -100px);
}

to {
	opacity: 1;
	transform: translate(0, 0);
}

}
@
keyframes fromBottomRight {from { opacity:0;
	transform: translate(100px, 100px);
}

to {
	opacity: 1;
	transform: translate(0, 0);
}

}
@
keyframes fromTopRight {from { opacity:0;
	transform: translate(100px, -100px);
}

to {
	opacity: 1;
	transform: translate(0, 0);
}

}
.animate-fade-in-up {
	animation: fadeInUp 1s ease-out;
}

.animate-bounce {
	animation: bounce 2s infinite;
}

.animate-slide-in-left {
	animation: slideInLeft 1s ease-out;
}

.animate-pulse {
	animation: pulse 2s infinite;
}

.animate-from-top-left {
	animation: fromTopLeft 1s ease-out;
}

.animate-from-bottom-right {
	animation: fromBottomRight 1s ease-out;
}

.animate-from-top-right {
	animation: fromTopRight 1s ease-out;
}

/* Make html and body full height */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.nav-links {
		display: none; /* Hide nav links on mobile */
	}
	.hero-text {
		font-size: 2.5rem !important; /* Smaller hero text on mobile */
	}
	.service-card img {
		height: 150px !important; /* Adjust image height on mobile */
	}
}

@media ( max-width : 640px) {
	.hero-text {
		font-size: 2rem !important;
	}
	.cta-button {
		padding: 0.75rem 1.5rem !important;
		font-size: 1rem !important;
	}
}

.line-clamp-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}
</style>
</head>
<body
	class="font-sans bg-gradient-to-br from-indigo-50 to-purple-50 text-gray-900 min-h-screen">
	<!-- Navbar -->
	<nav
		class="bg-gradient-to-r from-indigo-600 to-teal-600 text-white p-4 sticky top-0 z-10 shadow-lg">
		<div
			class="container mx-auto flex justify-between items-center flex-wrap">
			<a href="/home"
				class="text-3xl font-extrabold tracking-tight animate-slide-in-left">UrbanService</a>
			<div class="nav-links space-x-6 text-lg md:flex hidden">

				<a href="#services"
					class="hover:text-indigo-200 transition ease-in-out duration-300">Services</a>
				<a href="aboutus"
					class="hover:text-indigo-200 transition ease-in-out duration-300">About</a>
				<a href="contactus"
					class="hover:text-indigo-200 transition ease-in-out duration-300">Contact</a>
				<a href="login"
					class="hover:text-indigo-200 transition ease-in-out duration-300">Login</a>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<section id="home"
		class="min-h-screen bg-gradient-to-b from-teal-500 to-indigo-700 text-white py-28 relative flex items-center"
		style="background-image: url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80'); background-size: cover; background-position: center;">
		<div class="absolute inset-0 bg-black opacity-50"></div>
		<div class="container mx-auto text-center relative z-10 px-4">
			<h2
				class="hero-text text-5xl md:text-6xl font-extrabold mb-6 animate-fade-in-up text-yellow-200">Welcome
				to UrbanService</h2>
			<p
				class="text-xl md:text-2xl mb-8 animate-fade-in-up animation-delay-200">Your
				one-stop solution for all urban needs</p>
			<a href="/login"
				class="cta-button bg-yellow-400 text-indigo-800 px-8 py-4 rounded-full font-bold text-lg hover:bg-yellow-500 transition transform hover:scale-105 animate-pulse inline-block">Get
				Started</a>
		</div>
	</section>

	<!-- Features Section (Why Us) -->
	<section id="why-us"
		class="py-20 bg-gradient-to-r from-indigo-100 to-teal-100">
		<div class="container mx-auto text-center px-4">
			<h3
				class="text-4xl font-bold mb-12 text-indigo-600 animate-fade-in-up">Why
				Choose Us?</h3>
			<div class="grid grid-cols-1 md:grid-cols-3 gap-10">
				<div class="p-6 animate-slide-in-left">
					<h4 class="text-2xl font-semibold mb-3 text-teal-600">Reliable
						Services</h4>
					<p class="text-gray-700">We provide fast and reliable urban
						services tailored to your needs.</p>
				</div>
				<div class="p-6 animate-fade-in-up animation-delay-200">
					<h4 class="text-2xl font-semibold mb-3 text-teal-600">Expert
						Team</h4>
					<p class="text-gray-700">Our team is experienced and ready to
						assist you with any task in the city.</p>
				</div>
				<div class="p-6 animate-slide-in-left animation-delay-400">
					<h4 class="text-2xl font-semibold mb-3 text-teal-600">Affordable
						Rates</h4>
					<p class="text-gray-700">We offer competitive pricing for all
						urban services, so you can save more.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- List of categories -->
	<div class="max-w-6xl mx-auto py-10 px-4">
		<h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Service
			Categories</h1>

		<!-- Categories Grid -->
		<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
			<c:forEach var="category" items="${requestScope.categories}">
				<div
					class="bg-white rounded-lg shadow-lg overflow-hidden hover:scale-105 transition transform duration-300">
					<!-- Category Image -->
					<img src="${category.categoryPicUrl}"
						alt="${category.categoryName}"
						class="w-full h-48 object-cover object-center" />

					<!-- Category Details -->
					<div class="p-5">
						<h3 class="text-xl font-semibold text-gray-800">${category.categoryName}</h3>

						<!-- Description (Initially 2 Lines) -->
						<p class="text-gray-600 text-sm mt-2 line-clamp-2 overflow-hidden"
							id="desc-${category.categoryId}">
							${category.categoryDescription}</p>

						<!-- See More / See Less Button -->
						<button onclick="toggleDescription(${category.categoryId})"
							class="text-blue-500 text-sm mt-1 focus:outline-none"
							id="btn-${category.categoryId}">See More</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>



	<!-- Call to Action Section -->
	<section id="cta"
		class="bg-gradient-to-r from-indigo-600 to-teal-600 text-white py-20">
		<div class="container mx-auto text-center px-4">
			<h3 class="text-4xl font-bold mb-6 animate-fade-in-up">Join Us
				Today</h3>
			<p class="text-xl mb-8 animate-fade-in-up animation-delay-200">Start
				benefiting from our premium urban services now!</p>
			<a href="/signup"
				class="cta-button bg-yellow-400 text-indigo-800 px-8 py-4 rounded-full font-bold text-lg hover:bg-yellow-500 transition transform hover:scale-105 animate-pulse inline-block">Create
				an Account</a>
		</div>
	</section>

	<!-- Footer -->
	<footer
		class="bg-gradient-to-r from-indigo-800 to-teal-800 text-white py-8">
		<div class="container mx-auto text-center px-4">
			<div class="flex justify-center space-x-8 mb-4 flex-wrap">
				<a href="https://facebook.com" target="_blank"
					class="hover:text-indigo-200 transition ease-in-out duration-300 py-2">Facebook</a>
				<a href="https://twitter.com" target="_blank"
					class="hover:text-indigo-200 transition ease-in-out duration-300 py-2">Twitter</a>
				<a href="https://instagram.com" target="_blank"
					class="hover:text-indigo-200 transition ease-in-out duration-300 py-2">Instagram</a>
			</div>
			<p class="text-lg">© 2025 UrbanService. All rights reserved.</p>
		</div>
	</footer>

	<jsp:include page="Footer.jsp"></jsp:include>
	<script>
function toggleDescription(categoryId) {
    let desc = document.getElementById("desc-" + categoryId);
    let btn = document.getElementById("btn-" + categoryId);
    if (desc.classList.contains("line-clamp-2")) {
        desc.classList.remove("line-clamp-2");
        btn.innerText = "See Less";
    } else {
        desc.classList.add("line-clamp-4");
        btn.innerText = "See More";
    }
}
</script>

</body>

</html>