<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }

        .container {
            background: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 320px;
            text-align: center;
        }

        h2 {
            margin-bottom: 15px;
            color: #333;
        }

        input {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #007BFF;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        button {
            width: 80%;
            padding: 12px;
            margin-top: 10px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #0056b3;
        }

        .link {
            margin-top: 15px;
            font-size: 14px;
        }

        .link a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Otp Send</h2>
        
        <form action="sendotp" method="post">
            <input type="email" name="emailId" placeholder="Enter your email" required>
            <button type="submit">Send Otp</button>
        </form>
        <p class="link"><a href="/login">Back to Login</a></p>
    </div>

</body>
</html>
