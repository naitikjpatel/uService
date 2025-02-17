<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <!-- Navigation Bar -->
    <nav class="bg-blue-600 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a href="/" class="text-white font-bold text-2xl">Urban Service</a>
            <ul class="flex space-x-6">
                <li><a href="/" class="text-white">Home</a></li>
                <li><a href="/aboutus" class="text-white">About Us</a></li>
                <li><a href="/contact" class="text-white">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- About Us Section -->
    <section class="bg-white py-16">
        <div class="container mx-auto text-center">
            <h1 class="text-4xl font-semibold text-gray-800 mb-4">About Us</h1>
            <p class="text-xl text-gray-600 mb-8">
                We are Urban Service, an on-demand service marketplace connecting customers with verified professionals for home services such as plumbing, electrical work, salon services, appliance repair, and more. Our mission is to make life easier by providing quality home services at your doorstep.
            </p>
            <div class="flex justify-center gap-8">
                <div class="w-1/3 p-4">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">Our Vision</h2>
                    <p class="text-gray-600">
                        To be the most trusted and reliable platform for on-demand home services, ensuring customer satisfaction through quality and professionalism.
                    </p>
                </div>
                <div class="w-1/3 p-4">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">Our Mission</h2>
                    <p class="text-gray-600">
                        Connecting users with verified and skilled professionals while offering them convenience, affordability, and quality.
                    </p>
                </div>
                <div class="w-1/3 p-4">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">Our Values</h2>
                    <p class="text-gray-600">
                        Integrity, customer satisfaction, professionalism, and reliability form the foundation of our services.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
    <footer class="bg-blue-600 py-8">
        <div class="container mx-auto text-center">
            <p class="text-white">© 2025 Urban Service. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
