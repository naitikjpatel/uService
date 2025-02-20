<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto px-4 py-16">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-10 items-center">
            <!-- Left Side Content -->
            <div class="text-center md:text-left">
                <h1 class="text-4xl font-bold text-gray-900">Let's talk about everything!</h1>
                <p class="text-gray-600 mt-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas debitis, fugit natus?</p>
                <img src="your-image-url.png" alt="Illustration" class="mt-6 w-full md:w-3/4 mx-auto md:mx-0">
            </div>

            <!-- Right Side Form -->
            <div class="bg-white p-8 rounded-lg shadow-lg">
                <form action="contactServlet" method="post">
                    <div class="mb-4">
                        <input type="text" name="name" placeholder="Your name" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <input type="email" name="email" placeholder="Email" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <input type="text" name="subject" placeholder="Subject" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <textarea name="message" placeholder="Write your message" rows="4" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                    </div>
                    <button type="submit" class="w-full bg-black text-white p-3 rounded-lg hover:bg-gray-800 transition">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
