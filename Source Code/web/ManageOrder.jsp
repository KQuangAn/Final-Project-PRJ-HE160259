<%-- 
    Document   : ManageOrder
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : an
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
        <title>Manage Order</title>
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
        <%if(x==null || x.getRole().equals("user")){%>
        <h2> Only admin or seller can access this page! </h2>
        <% return;} 
        else {%>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Order</b></h2>
                        </div>
                        <div class="col-sm-6">					
                            <a href="home"><button type="button" class="btn btn-primary">Back to home</button>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Orders_ID</th>
                            <th>Orders_Account_ID</th>
                            <th>Orders_Product_ID</th>
                            <th>Order_Amount</th>
                            <th>Order_Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listO}" var="o" begin = "${begin}" end = "${end}">
                            <tr>
                                <td>${o.orderid}</td>
                                <td>${o.orderaid}</td>
                                <td>${o.orderpid}</td>
                                <td>${o.orderamount}</td>
                                <td>${o.orderdate}</td>
                                <td>
                                    <a href="delete?&action=order" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>${listO.size()}</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item active"><a href="manager?action=order&begin=0&end=5" class="page-link">1</a></li>
                        <li class="page-item"><a href="manager?action=order&begin=5&end=10" class="page-link">2</a></li>
                        <li class="page-item"><a href="manager?action=order&begin=10&end=15" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <%} %>
    <script src="js/manager.js" type="text/javascript"></script>
</body>
</html>