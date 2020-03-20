<%-- 
    Document   : registrations
    Created on : 21-Nov-2018, 9:17:44 AM
    Author     : awarsyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register New User</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <script src="js/register.js"></script>
    </head>
    <body>
        <h1>Register New User</h1>
        <form action="register" method="post">
            username: <input type="text" required name="username" id="username" value="${usernameReg}">  <span id="username_message"></span><br>
            password: <input type="password" required name="password"><br>
            password (again): <input type="password" name="passwordcheck"><br>
            <input type="submit" value="Register">
        </form>
        ${error}
       
    </body>
</html>
