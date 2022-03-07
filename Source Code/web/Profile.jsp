<%-- 
    Document   : Profile
    Created on : Feb 28, 2022, 6:20:28 PM
    Author     : khuat
--%>
<%@page import="entity.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <%Account x = (Account) request.getSession().getAttribute("acc");%>
        <%if(x==null){%>
        <h2> Login to continue </h2>
        <% return;} 
        else {%>
        <h2>Hello User</h2>
        <div class="alert alert-info text-center">
                <strong>${thongbao}</strong>
            </div>
        <h2 class="text-center">Change Password</h2>
        <form action="AccountControl" method="POST">
            <div class="form-group">
              <label for="exampleInputEmail1">New Username</label>
              <input type="text" name="user" class="form-control" id="InputEmail1" placeholder="Username" required>
            </div>
            <div class="form-group">
              <label for="InputPassword1">Old Password</label>
              <input type="password" name="oldpass" class="form-control" id="InputPassword1" placeholder="Password" required>
            </div>
            <div class="form-group">
              <label for="InputPassword1">New Password</label>
              <input type="password" name="pass" class="form-control" id="InputPassword1" placeholder="New Password" required>
            </div>
            <div class="form-group">
              <label for="InputPassword1">Repeat New Password</label>
              <input type="password" name="repass" class="form-control" id="InputPassword1" placeholder="Repeat Password" required>
            </div>
            <button type="submit" class="btn btn-primary">Change password</button>
          </form>
        <%} %>
        
    <script src="js/manager.js" type="text/javascript"></script>
</body>
</html>
