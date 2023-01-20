<%-- 
    Document   : success
    Created on : 05 23, 21, 11:23:15 AM
    Author     : Marvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.model.SessionDestroyedException"%>
<!doctype html>
<html lang="en">
    <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/success_style.css">
    <link rel="stylesheet" 
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <title>Eruditio Academy</title>
    </head>
    <body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession s = request.getSession();
        if(s.getAttribute("username") == null)
        {
            throw new SessionDestroyedException();
        }
    %>
     <!-- NAVBAR -->
    <section id = "nav-bar">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #6342B2;">
        <div class="container-fluid">
        <a class="navbar-brand" href="#"><img src = "images/eruditio_logo_light.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Downloadables
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                             <%
                                if(((String)session.getAttribute("userRole")).equals("Admin"))
                                {
                                    out.println("<a class=\"download\" href=\"" + request.getContextPath() + 
                                    "/pdfAdmin.jsp\" donwload=\'donwload\'><button class=\"dropdown-item\" type=\"button\">User Report</button></a>");
                                }
                                else
                                {
                                    out.println("<a class=\"download\" href=\"" + request.getContextPath() + 
                                    "/pdfUser.jsp\" donwload=\'donwload\'><button class=\"dropdown-item\" type=\"button\">Account Info</button></a>");
                                }
                            %>
                        </div>
                      </div>
                </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" tabindex="-1" aria-disabled="true">Hello, ${sessionScope.username}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout" >Logout</a>
                    </li>
                </ul>
            </div>
            </div>
        </nav>
    </section>
    <!--- PROFILE --->
    <section id="profile">
        <div class="profile-card">
            <div class="card-header" style="background: #6342B2;">
                <div class="pic">
                    <img src="images/4.png" alt="">
                </div>
                <div class="name">${sessionScope.username}</div>
                <div class="email">${sessionScope.email}</div>
            </div>
        </div>
    </section>
    </body>
</html>