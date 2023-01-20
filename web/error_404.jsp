<%-- 
    Document   : error_404
    Created on : 05 24, 21, 9:48:25 PM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>404 Error Page</title>
      <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/error_404_style.css">
      <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
   </head>
   <body>
      <div id="error-page">
         <div class="content">
            <h2 class="header" data-text="404">
               404
            </h2>
            <h4 data-text="Opps! Page not found">
               Oops! Page not found
            </h4>
            <p>
               Sorry, the page you're looking for doesn't exist.
            </p>
            <div class="btns">
               <a href="${pageContext.request.contextPath}">Go Back</a>
            </div>
         </div>
      </div>
   </body>
</html>
