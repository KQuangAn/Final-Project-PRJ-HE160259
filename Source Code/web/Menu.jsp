<%@page import="entity.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">Shoes</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc.role eq 'admin'}">
                    <li class="nav-item">
                        <a class="nav-link" href="AccountControl">Manage Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manager?action=order">Manage all Orders</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.role eq 'seller'}">
                    <li class="nav-item">
                        <a class="nav-link" href="manager?begin=0&end=5">Manage Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manager?action=order">Manage Orders</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Profile.jsp">Hello ${sessionScope.acc.user}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li> 
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp">Login</a>
                    </li>
                </c:if>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="show">
                    <i class="fa fa-shopping-cart"></i> Cart
                    
                        <c:set var="quantity" value="0"></c:set>
                        <c:forEach items="${sessionScope.acc.cart}" var="o">
                        <c:set var="quantity" value="${quantity+o.quantity}"></c:set>
                        </c:forEach>
                        <span class="badge badge-light">${quantity}</span>  
                </a>
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center" style="background-image:url(images/home.jpg);background-position:center;width:100%;height:100%;">
    <div class="container" >
        <h1 class="jumbotron-heading" style="color:white" >   Niek store</h1>
        <p class="lead text-muted mb-0" style="color:white" >Coupon code available</p>
    </div>
</section>
<!--end of menu-->
