<%-- 
    Document   : registrationSuccess
    Created on : 04 1, 21, 11:48:14 PM
    Author     : Marvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Successful!</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/CSS/successRegister.css">
    </head>
    <body>
        <style>
        body {
            background-image: url('Images/marble_bg.jpg');
        }
        </style>
        <div id="page-container">
        <div class="header">
            <h1><% out.print(getServletContext().getInitParameter("header"));%></h1>
        </div>
            <div id="container">
                <div class="content">
                    <div class="img-container">
                        <img src="<%= request.getContextPath()%>/Images/checkmark.png">
                    </div>
                    <h4>Registration Successful!</h4>
                    <p>The registration process is successful! Enter the button below to go back to the login page.</p>
                    <a href="${pageContext.request.contextPath}">Back To Login Page</a>
                </div>
            </div>
        <div class="footer">
            <h1><% out.print(getServletContext().getInitParameter("footer"));%></h1>
        </div>
        </div>
    </body>
</html>