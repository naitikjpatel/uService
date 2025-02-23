<%@page import="lombok.EqualsAndHashCode.Include" %>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UrbanService-Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Additional animations */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fadeIn {
            animation: fadeIn 1s ease-out;
        }

        @keyframes slideUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .slideUp {
            animation: slideUp 1s ease-out;
        }
    </style>
</head>

<body class="bg-gray-100">
    <nav class="bg-gray-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <div class="flex items-center">
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

    <section class="bg-blue-600 text-white text-center py-32 fadeIn">
        <h1 class="text-4xl md:text-5xl font-bold">Welcome to Urban Services</h1>
        <p class="mt-4 text-lg md:text-xl">Your one-stop solution for all urban needs</p>
        <a href="/login" class="mt-6 inline-block bg-white text-blue-600 px-6 py-3 rounded-lg hover:bg-gray-100 transition-all">Get Started</a>
    </section>

    <section class="py-20 bg-white text-center">
        <h2 class="text-3xl font-semibold text-blue-600">Our Categories</h2>
        <div class="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-12 mt-12">
            <c:forEach var="category" items="${categories}">
                <div class="bg-gray-100 p-6 rounded-lg shadow-lg hover:shadow-xl transition-all slideUp">
                    <img class="mx-auto" alt="" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAvQMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAQIDBAUHBgj/xABAEAABAwMDAQUFBAgDCQAAAAABAAIDBAURBhIhMQcTQVFhFCIycYEVkaGxIyQzQlJicsF1ktEIFhc3U7LC4fD/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBAX/xAAjEQACAgIDAQABBQAAAAAAAAAAAQIRITEDBBJBIgUVMkKh/9oADAMBAAIRAxEAPwDiCEIXQIVoy4BWHdAFDEOcqbCqJnJ5ERhASqyRqcDwhARYDvBS0coilJJwCFCmS5DchV6rIVeBkz+8kc/zJKjCUdEiybvJqkadsk3Ruj6Ja/h0bR4AlVrY7FUB4EKWudmox5NWqn+Bk1TK5SIQFAxUHohKeiQho64RUAljXeXCB8RUuN7C30UlLZSQlPVIpNAQhCAFCEiEwJohhuVKmN+EJytaMnsQJUnihFiBKkSpgKEjxlhSoAJyACUfAKuUisvoqhjdxgeGfxbThVyMHCxs2tMmoTtqoz6qWd26Z59VWhdska7yKmVweCJbEKVIlVkgEpSBKkIaOpKkaVEzlvPmU9qWxshnbtkOOhUasVIyGu+irqWaJ2gQhCQwQhK0ZOEAWAlRhHRWjFjScFKmSFPBygdYBKjHGUJkir1ulLe1lGK72ZtTVzS9xRQvGQX4yXEeOOOPVeRK95oasjkhpGBrn1FuqjUshaQDMwjDgM8ZGAUpMGNubdZUVOLhUvl7ozmExHaQCMkgs8sDyXntS0sE1FT3WmgEBke6KohAwGStxnHpyuyVmtIq+gmFVpO41FI73HBwY4OzkYx1XKNaGOjpG0DRsklq5at8RIJhDz7rDjxA6+qylV2hxw8HkYxkhTOOOQmQjHJTvid6BaRwi3sUBCVCslihI44acpQmTH3ceaT0JbCP4AnDqmx/AlQkN7HvG6Nw9FUVwHBHkqrxteQpkVAahCCobLBOZ8QTU+IZcmDJcpcoASHhUZEUhyVJGfdCY8Drn6JY3e6c+Cm8lvRZa3LArFBb5rhUdzBtBA3Oc84aweZK04LIwU7faq6KnmLQ4scxxDA74d7hw3Pqrem3/Zd4mpazbDLuYMyHgPZIHAOPgDtxn1T9GbM6rsD4qZ09NUsqRG3e9gjcxwb/ABAOHI9Qqdqm9nqe+HBZgg9MLqGsbm+KggNdTxU3BlY1szXukJY5u0Y/d97OeOnRcso2nMnyH90XYRs9+3Xt0p7DDBNHFI2SUtcSXBxjHhkHIPDuQufX0NdWGeHd7NOXPhy8u2tJ+HJ5Jb0+mfFa1xhjhZTQxztlPcNfIACO7e7ktOfEAj71my1E09lbTPce6o6kuYwDp3gOfxYP8yz8pGqM/gMAHxFKBtbj8VetVvbU1ZFWHxxMjdNJtHvbGjJA9SvdV2jWwUrpKuG2RU7nRRxSUz5O83SYDCC44eOefTK0vJDZzhCdIwskew9Wkhaen7SLpPIJHP2MLWhsZAdI92drQTwOhOcHon6EZeVFKcn5L0+odOG10jZ+6khfhrnQySiT3HcBwcAPHAII8QvLPPvFJuyorJMzhgSob0Rx5rT4SxzeVBOMSFTsx4FRVPxDzUSHHZCgoQszQFLCOColLD0KpClok5A8E0uOeU9Mczd44VM" />
                    <h3 class="text-xl font-semibold text-blue-600">${category.categoryName}</h3>
                    <p class="mt-4 text-gray-700">${category.categoryDescription}</p>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-20 bg-white text-center">
        <h2 class="text-3xl font-semibold text-blue-600">Our Features</h2>
        <div class="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-12 mt-12">
            <div class="bg-gray-100 p-6 rounded-lg shadow-lg hover:shadow-xl transition-all slideUp">
                <h3 class="text-xl font-semibold text-blue-600">Reliable Services</h3>
                <p class="mt-4 text-gray-700">We provide fast and reliable urban services tailored to your needs.</p>
            </div>
            <div class="bg-gray-100 p-6 rounded-lg shadow-lg hover:shadow-xl transition-all slideUp">
                <h3 class="text-xl font-semibold text-blue-600">Expert Team</h3>
                <p class="mt-4 text-gray-700">Our team is experienced and ready to assist you with any task in the city.</p>
            </div>
            <div class="bg-gray-100 p-6 rounded-lg shadow-lg hover:shadow-xl transition-all slideUp">
                <h3 class="text-xl font-semibold text-blue-600">Affordable Rates</h3>
                <p class="mt-4 text-gray-700">We offer competitive pricing for all urban services, so you can save more.</p>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="bg-blue-600 text-white text-center py-16 fadeIn">
        <h2 class="text-3xl font-semibold">Join Us Today</h2>
        <p class="mt-4 text-lg md:text-xl">Start benefiting from our premium urban services now!</p>
        <a href="/signup" class="mt-6 inline-block bg-white text-blue-600 px-6 py-3 rounded-lg hover:bg-gray-100 transition-all">Create an Account</a>
    </section>

    <!-- Footer -->
    <footer class="bg-black text-white py-6">
        <div class="max-w-7xl mx-auto px-6 flex justify-center space-x-8">
            <a href="https://facebook.com" target="_blank" class="hover:text-blue-500">Facebook</a>
            <a href="https://twitter.com" target="_blank" class="hover:text-blue-500">Twitter</a>
            <a href="https://instagram.com" target="_blank" class="hover:text-blue-500">Instagram</a>
        </div>
        <div class="text-center mt-4 text-sm">&copy; 2025 UrbanService. All Rights Reserved.</div>
    </footer>

    <jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>