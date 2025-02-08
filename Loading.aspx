﻿<!DOCTYPE html>
<html>
<head>
    <title>Loading...</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: white;
            color: black;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            flex-direction: column;
        }

        .logo {
            width: 300px; /* Adjust size as needed */
            margin-bottom: 20px;
        }

        .loader {
            border: 8px solid #f3f3f3;
            border-top: 8px solid gold;
            border-radius: 50%;
            width: 80px;
            height: 80px;
            animation: spin 1s linear infinite;
            margin-bottom: 20px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <!-- Logo -->
    <img src="img/DatamexLogo.png" alt="School Logo" class="logo">

    <!-- Loader Animation -->
    <div class="loader"></div>
    
    <p>Loading, please wait...</p>

    <!-- Redirect to Dashboard after 3 seconds -->
    <script>
        setTimeout(function () {
            window.location.href = "Dashboard.aspx";
        }, 3000); // 3 seconds
    </script>
</body>
</html>