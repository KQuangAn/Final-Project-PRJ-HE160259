<%-- 
    Document   : Admin_Mangager_Account
    Created on : Feb 27, 2022, 9:53:14 PM
    Author     : khuat
--%>
<%@page import="entity.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quan ly tai khoan</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                                <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <%--Kiem tra quyen nguoi dung --%>
                <div id="content" class="row">
                <%Account x = (Account) request.getSession().getAttribute("acc");%>
                <%if(x==null || !x.getRole().equals("admin")){%>
                <h2> Only admin can access this page! </h2>
                <% return;} 
                else {%>
                    <div class="alert alert-info text-center">
                            <strong>Hello ADMIN</strong>
                    </div>
                        <br>
                            <div class="product col-12 col-md-6 col-lg-4">
                                <table border="2" class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Account_ID</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Password</th>
                                            <th scope="col">Role</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listA}" var="a">
                                        <tr>
                                            <td>${a.id}</td>
                                            <td>${a.user}</td>
                                            <td>${a.pass}</td>
                                            <td>${a.role}</td>
                                            <c:if test = "${a.role ne 'admin'}">
                                            <td><a href="UpdateServlet?code=${a.id}"> edit</a> </td>
                                            <td><a href="delete?&action=account&id=${a.id}"> delete</a> </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        <%} %>
                    </div>
                    <button onclick="loadMore()" class="btn btn-primary">Load more</button>
                </div>


            
    </body>
</html>
