<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/users.js"></script>
        <link rel="stylesheet" href="<c:url value='styles/notes.css' />" />
    </head>
    <body>
        <h1>Manage Users</h1>
        <h2>Users</h2>
        <p>${errorMessage}</p>
        <table>
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
                <th>Note titles</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.firstname}</td>
                    <td>${user.lastname}</td>
                    <td>${user.role.rolename}</td>
                    <td>
                        <ul>
                        <c:forEach var="note" items="${user.noteList}">
                            <li>${note.title}</li>
                        </c:forEach>
                        </ul>
                    </td>
                    
                    <td>
                        <form action="users" method="post" >
                            <input type="submit" value="Delete">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="selectedUsername" value="${user.username}">
                        </form>
                    </td>
                    <td>
                        <form action="users" method="get">
                            <input type="submit" value="Edit">
                            <input type="hidden" name="action" value="view">
                            <input type="hidden" name="selectedUsername" value="${user.username}">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>


            <h3>Edit User</h3>
            <form action="users" method="POST">
                username: <input type="text" name="username" value="${selectedUser.username}" readonly id="username"><br>
                password: <input type="password" name="password" value="${selectedUser.password}" id="password"><br>
                first name: <input type="text" name="firstname" value="${selectedUser.firstname}" id="firstname"><br>
                last name: <input type="text" name="lastname" value="${selectedUser.lastname}" id="lastname"><br>
                email: <input type="email" name="email" value="${selectedUser.email}" id="email"><br>
                <input type="hidden" name="action" value="edit">
                <input type="submit" value="Save">
            </form>

    </body>
</html>
