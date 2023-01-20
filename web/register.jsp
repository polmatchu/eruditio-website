<%-- 
    Document   : register
    Created on : 05 18, 21, 7:39:10 PM
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
      
    <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/register_style.css">
    
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <title>Eruditio Academy</title>

  </head>
  <body clas="vertical-center" onload="onLoad()">
    <section class="logo">
        <img src="images/eruditio_logo_white.png" alt="">
    </section>
    <section class="form ml-5">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-5 text-center">
                    <img src="images/1b.png" class="pic img-fluid my-autos banner-image" alt="">
                </div>
                <div class="col-lg-7 px-5 pt-5">
                    <h1 class="hello-header-main">Create an Account.</h1>
                    <h4 class="hello-header-sub">Where fun and learning begins.</h4>
		
                    <form action="registrationProcess" method="POST">
                        <div class="form-row">
                            <div class="col-sm-10 in">
                                <input type="text" name="username" required placeholder="Username" class="form-control my-2 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-10 in">
                                <input type="email" name="email" required placeholder="Email Address" class="form-control my-2 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-10 in">
                                <input type="password" name="password" onchange="onChange()" Required placeholder="Password" class="form-control my-2 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-10 in">
                                <input type="password" name="confirmPassword" onchange="onChange()" Required placeholder="Confirm Password" class="form-control my-2 p-4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-10 in">
                                <label for="role">Choose Your Role</label>
                                <select class="form-control" id="roleSelection" name="role">
                                    <option>Teacher</option>
                                    <option>Parent</option>
                                    <option>Student</option>
                                </select>
                            </div>
                        </div>
                        <div class="captcha form-row">
                                    <div class="captcha-container col-sm-10 in">
                                        <audio id="captcha_audio" controls src="" autostart="0"></audio>
                                        <img id="captcha_image" class="captcha-img" src="CaptchaServlet"/>
                                        <div class="captcha-controls">
                                            <img class="captcha-controls-img" src="images/refresh.png" onclick="refresh()"/>
                                            <img id="speaker" class="captcha-controls-img" src="images/speaker.png" onclick="voice()"/>
                                            <img id="image-icon" class="captcha-controls-img" src="images/image.png" onclick="image()"/>
                                            <br>
                                        </div>
                                    </div>
                                    <div class="input-container col-sm-10 in">
                                        <input class="form-control my-2 p-4" Required autocomplete="off" placeholder="Captcha Answer" type="text" name="captchaAnswer"><br>
                                    </div>
                            </div>
                        <div class="form-row">
                            <div class="col-sm-10 in">
                                <button type="submit" class="btn1 mt-2 mb-4">Sign Up</button>
                            </div>
                        </div>
                        <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login Here</a></p>
                    </form>
                </div>
            </div>
        </div>    
    </section>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="scripts/registration.js"></script>
  </body>
</html>
