<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Services - Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   <link rel="stylesheet" href="Style/adminlogin.css">
   
</head>
<body>
    <div class="login-container">
        <div class="admin-logo">
            <i class="fas fa-user-shield"></i>
        </div>
        <h2>Admin Login</h2>
        <form action="login" method="POST">
            <div class="input-group">
                <input type="text" name="username" placeholder="Username" required>
                <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
                <input type="password" name="password" placeholder="Password" required>
                <i class="fas fa-lock"></i>
            </div>
            <button type="submit" class="btn-login">Login</button>
            <a href="#" class="forgot-password">Forgot Password?</a>
        </form>
    </div>
    
    
</body>
</html>