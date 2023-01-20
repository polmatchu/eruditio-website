<%-- 
    Document   : failed_login
    Created on : 05 24, 21, 9:48:41 PM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      
    <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/failed_style.css">
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <title>Eruditio Academy</title>
    <script src="scripts/login.js"></script> 
    
  </head>
  <body class="vertical-center"onload="execute()">
    <section class="logo">
        <img src="images/eruditio_logo_white.png" alt="">
    </section>
    <section class="form ml-5">
        <div class="container vertical-center">
            <div class="row no-gutters">
                <div class="col-lg-5 text-center">
                    <img src="images/6b.png" class="img-fluid log-img banner-image" alt="">
                </div>
                <div class="col-lg-7 px-5 pt-5">
                    <h1 class="hello-header-main">Welcome Back!</h1>
                    <h4 class="hello-header-sub">We're so excited to see you again!</h4>
                    <h3>${sessionScope.errMessage}</h3>
                    <form id="forms" action="loginProcess" method="POST">
                        <div class="form-row">
                            <div class="col-lg-8 in">
                                <input type="text" placeholder="Username" name="username" id="username" class="form-control my-2 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-8 in">
                                <input type="password" placeholder="Password" name ="password" id="password" class="form-control my-2 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-8 in">
                                <button id="loginBtn" disabled type="submit" class="btn-disabled mt-2 mb-4">Login</button>
                            </div>
                        </div>
                        <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register Here</a></p>
                        <img src="images/undraw_pair_programming_njlp 1.svg" class="img-fluid" alt="">
                    </form>
                </div>
            </div>
        </div>    
    </section>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>