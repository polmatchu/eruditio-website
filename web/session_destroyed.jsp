<%-- 
    Document   : session_destroyed
    Created on : 05 24, 21, 9:49:49 PM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Session Destroyed</title>
       <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
      <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/session_destroyed_style.css">
   </head>
   <body>
      <div id="error-page">
         <div class="content">
            <h2 class="header">
               Session Destroyed!
            </h2>
            <p>
               Please login again.
            </p>
            <div class="btns">
               <a href="${pageContext.request.contextPath}">Go Back</a>
            </div>
         </div>
      </div>
   </body>
</html>
