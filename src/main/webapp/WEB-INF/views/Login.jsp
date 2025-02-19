<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Free Account</title>
  <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>

<div class="font-[sans-serif] p-4 mt-6">
    <div class="flex flex-col justify-center">
        <div class="max-w-md w-full mx-auto shadow-[0_2px_10px_-2px_rgba(195,169,50,0.5)] p-8 relative mt-12">
            <div class="bg-white w-24 h-24 border-[8px] p-4 absolute left-0 right-0 mx-auto -top-12 rounded-full overflow-hidden">
                <a href="javascript:void(0)">
                    <img src="https://readymadeui.com/readymadeui-short.svg" alt="logo" class='w-full inline-block' />
                </a>
            </div>

            <form class="mt-12" action="loginuser" method="post" > <%-- Add action and method --%>
                <h3 class="text-xl font-bold text-blue-600 mb-6 text-center">Create free account</h3>
                <div class="space-y-4">
                    <input name="emailId" type="email" class="bg-gray-100 w-full text-sm text-gray-800 px-4 py-3 focus:bg-transparent border border-gray-100 focus:border-black outline-none transition-all" placeholder="Enter email" required/> <%-- Added required and type="email" --%>
                    <input name="password" type="password" class="bg-gray-100 w-full text-sm text-gray-800 px-4 py-3 focus:bg-transparent border border-gray-100 focus:border-black outline-none transition-all" placeholder="Enter password" required/> <%-- Added required --%>
                                  <div class="mt-6">
                    <button type="submit" class="w-full py-3 px-4 text-sm tracking-wide text-white bg-black hover:bg-[#111] focus:outline-none"> <%-- Changed to submit --%>
                        Login an account
                    </button>
                </div>
                <p class="text-sm mt-6 text-center text-gray-800">Forgot Password? <a href="forgotpassword" class="text-blue-600 font-semibold hover:underline ml-1">Forgot Password</a></p>
                <p class="text-sm mt-6 text-center text-gray-800">Don't Have an Account? <a href="signup" class="text-blue-600 font-semibold hover:underline ml-1">Signup here</a></p>
            </form>
        </div>
    </div>
</div>

</body>
</html>

<!-- 
    <div class="container">
        <h2>Login</h2>
        <form action="loginuser" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p class="link"><a href="fp">Forgot Password?</a></p>
        <p class="link">Don't have an account? <a href="signup">Sign Up</a></p>
    </div>

</body>
</html>

 -->
