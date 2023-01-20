<%-- 
    Document   : index
    Created on : 05 23, 21, 11:25:28 AM
    Author     : Marvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/index_style.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
        <title>Eruditio Academy</title>
    </head>



    <body>

        <!-- NAVBAR -->
        <section id = "nav-bar">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #6342B2;">
                <a class="navbar-brand" href="#"><img src = "${pageContext.servletContext.contextPath}/images/eruditio_logo_small.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#our-programs">Our Programs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#why-eruditio">Why Eruditio?</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#about-us">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#faqs">FAQs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact-us">Contact Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#newsletter">Newsletter</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn-join" href="register.jsp">Join Us</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </section>



        <!-- TOP -->
        <section class="top purple-container" >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="top-logo">
                            <img src = "${pageContext.servletContext.contextPath}/images/eruditio_logo_white.png" alt="Eruditio Academy" class="responsive">
                        </div>
                        <div class="motto">
                            <p>
                                We deliver innovative programs for the 21st century Filipino children and youth. We offer holistic programs that develop to the four human dimensions - mind, heart, body and spirit.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div  class="right-pic">
                            <img src = "${pageContext.servletContext.contextPath}/images/top-pic.png" alt="Teaching a Student" class="responsive">
                        </div>
                    </div>
                </div>
            </div>
            <div class="custom-shape-divider-bottom-1621862839">
                <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M985.66,92.83C906.67,72,823.78,31,743.84,14.19c-82.26-17.34-168.06-16.33-250.45.39-57.84,11.73-114,31.07-172,41.86A600.21,600.21,0,0,1,0,27.35V120H1200V95.8C1132.19,118.92,1055.71,111.31,985.66,92.83Z" class="shape-fill"></path>
                </svg>
            </div>
        </section>



        <!--- OUR PROGRAMS --->
        <section class="white-container index-header-text-main" id="our-programs">
            <div class="index-header-text-sub">
                <h2>Our Programs</h2>
                <h3>Curated for maximum learning and enjoyment</h3>
                <div class="row  align-items-center justify-content-center" id="intro2Row">

                    <div class="col-lg-2 col-md-5 sec2-card1">
                        <img src="${pageContext.servletContext.contextPath}/images/progWrite.png" class="progLogo" alt="Smart Writer">
                        <p class="card-content align-middle">Teaching kids to write effective essays and compositions.</p>
                    </div>

                    <div class="col-lg-2 col-md-5 sec2-card2">
                        <img src="${pageContext.servletContext.contextPath}/images/progCom.png" class="progLogo" alt="Compass">
                        <p class="card-content">Dramatically improve children’s reading comprehension and communication skills.
                        </p>
                    </div>

                    <div class="col-lg-2 col-md-5 sec2-card3">
                        <img src="${pageContext.servletContext.contextPath}/images/progRead.png" class="progLogo" alt="Instant Reader">
                        <p class="card-content">Your child can read English in just 20-days</p>
                    </div>

                    <div class="col-lg-2 col-md-5 sec2-card4">
                        <img src="${pageContext.servletContext.contextPath}/images/progCode.png" class="progLogo" alt="Coding for Kids">
                        <p class="card-content">Teaching kids computer programming in the simplest and most enjoyable way.</p>
                    </div>

                </div>
            </div>

            <div class="col text-center btn-container">
                <a class="btn-prog" href="#"> Learn more</a>
            </div>
        </section>



        <!--- ABOUT US --->
        <section class="white-container index-header-text-main" id="about-us">
            <div class="index-header-text-sub">
                <h2>About Us</h2>
            </div>
            <div class="container-fluid">
                <div class="row mv-padding">
                    <div class="col-lg-7 col-md-7">
                        <h2>Our Mission</h2>
                        <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Odio ut sem nulla pharetra diam sit amet. Consectetur purus ut faucibus pulvinar elementum integer enim. Consequat ac felis donec et odio pellentesque diam volutpat. Felis eget velit aliquet sagittis id consectetur purus ut faucibus.</h5>
                    </div>
                    <div class="col-lg-5 col-md-5 ">
                        <div class="mission-pic">
                            <img src = "${pageContext.servletContext.contextPath}/images/mission-pic.svg" class="missionLogo">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-md-5">
                        <div class="vision-pic">
                            <img src = "${pageContext.servletContext.contextPath}/images/vision-pic.png" class="visionLogo">
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <h2>Our Vision</h2>
                        <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Odio ut sem nulla pharetra diam sit amet. Consectetur purus ut faucibus pulvinar elementum integer enim. Consequat ac felis donec et odio pellentesque diam volutpat. Felis eget velit aliquet sagittis id consectetur purus ut faucibus.</h5>
                    </div>
                </div>
            </div>
        </section>



        <!--- WHY CHOOSE ERUDITIO? --->
        <section class="white-container index-header-text-main" id="why-eruditio">
            <div class="index-header-text-sub">
                <h2>Why Choose Eruditio Academy?</h2>
                <h3>See what our customers have to say...</h3>
            </div>    

            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="3000">
                <div class="carousel-inner">



                    <div class="carousel-item active">
                        <div class="testiCard">

                            <img class="d-block testPic" src="${pageContext.servletContext.contextPath}/images/Ellipse 149.svg" alt="First slide">
                            <div class="caption">
                                <h5>John Doe 1</h5>
                                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Illo quae nostrum non ab
                                    repudiandae. Quos, nesciunt harum? Corporis distinctio amet incidunt. Alias quod
                                    aperiam accusantium, laboriosam adipisci ullam numquam repudiandae?</p>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <div class="testiCard">

                            <img class="d-block testPic" src="${pageContext.servletContext.contextPath}/images/Ellipse 149.svg" alt="First slide">
                            <div class="caption">
                                <h5>John Doe 2</h5>
                                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Illo quae nostrum non ab
                                    repudiandae. Quos, nesciunt harum? Corporis distinctio amet incidunt. Alias quod
                                    aperiam accusantium, laboriosam adipisci ullam numquam repudiandae?</p>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <div class="testiCard">

                            <img class="d-block testPic" src="${pageContext.servletContext.contextPath}/images/Ellipse 149.svg" alt="First slide">
                            <div class="caption">
                                <h5>John Doe 3</h5>
                                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Illo quae nostrum non ab
                                    repudiandae. Quos, nesciunt harum? Corporis distinctio amet incidunt. Alias quod
                                    aperiam accusantium, laboriosam adipisci ullam numquam repudiandae?</p>
                            </div>
                        </div>
                    </div>


                </div>




                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>



        <!--- FAQs --->
        <section class="white-container index-header-text-main" id="faqs">
            <div class="index-header-text-sub">
                <h2>Frequently Asked Questions</h2>
            </div>
            <div class="container-fliud">
                <div class="row">

                    <div class="col-lg-8">
                        <div id="accordion">
                            <div class="card">  

                                <!--                                =============================headingOne-->

                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">

                                        <!--                                =============================headingOne-->
                                        <button class="btn btn-link btn-text" data-toggle="collapse" data-target="#collapseOne"
                                                aria-expanded="true" aria-controls="collapseOne">
                                            Lorem ipsum dolor sit amet?
                                        </button>
                                    </h5>
                                </div>
                                <!--                                =============================headingOne-->
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                        squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                        quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                        squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                        craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                        nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                <h5 class="mb-0">
                                    <button class="btn btn-link btn-text" data-toggle="collapse" data-target="#collapseTwo"
                                            aria-expanded="true" aria-controls="collapseOne">
                                        Lorem ipsum dolor sit amet?

                                    </button>
                                </h5>
                            </div>

                            <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                    squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                    squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                    craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                    butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                    nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="col-lg-4">
                        <div class="faq-pic">
                            <img class=" faq-img img-fluid " src = "${pageContext.servletContext.contextPath}/images/Group 78.svg" alt="">
                        </div>
                    </div>


                </div>
            </div>



            <div class="custom-shape-divider-bottom-1621894024">
                <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
                </svg>
            </div>

        </div>
    </section>



    <!-- CONTACT US  -->

    <section class="purple-container index-header-text-main2" id="contact-us">

        <div class="index-header-text-sub2">
            <h2>Contact Us</h2>
            <h3>If you have an inquiries, we are more than pleased to serve you</h3>
        </div>
        <br>
        <div class="row" id="intro4Row">
            <div class="col-lg-5">
                <img class="contactLogo" src="${pageContext.servletContext.contextPath}/images/contactLogo.png" alt="">
            </div>

            <div class="col-lg-7">
                <!-- mailto:eruditio.academy21@gmail.com -->
                <form action="mailto:example@gmail.com" method="POST" enctype="text/plain">
                    <div class="form-group">

                        <input type="email" name="Email" class="form-control" id="Email" aria-describedby="emailHelp"
                               placeholder="Enter email">


                        <small id="emailHelp" class="form-text contactSharing">We'll never share your email with anyone
                            else.</small>


                        <input type="text" name="Username " class="form-control" id="username"
                               aria-describedby="emailHelp" placeholder="Username"> <br>

                        <select name="Role " class="form-control" id="roleSelection">
                            <option>Please Enter a role</option>
                            <option>Teacher</option>
                            <option>Parent</option>
                            <option>Student</option>
                        </select>


                        <label for="con-textArea"></label>
                        <textarea name="Message " class="form-control" id="con-textArea" rows="3"
                                  placeholder="Please enter your message here"></textarea>
                    </div>
                    <input type="submit" class="btn btn-contact" value="Submit">
                </form>
            </div>
        </div>

        <div class="custom-shape-divider-bottom-1621894380">
            <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M1200 0L0 0 892.25 114.72 1200 0z" class="shape-fill"></path>
            </svg>
        </div>
    </section>



    <!-- NEWSLETTER -->

    <section class="dark-purple-container index-header-text-main2" id="newsletter">
        <div class="row">
            <div class="col-lg-4">
                <img class="contactLogo" src="${pageContext.servletContext.contextPath}/images/Group 46.svg" alt="">
            </div>
            <br>
            <div class="col-lg-8">
                <div class="index-header-text-sub2">
                    <h2 class="newsLetterTitle">Let's Stay in Touch</h2>
                    <h3 class="newsLetterMessage">Receive regular updates about our exciting programs, activities and promos
                    </h3>
                </div>
                <form>
                    <div class="form-group">

                        <input type="email" name="Email" class="form-control email" id="Email"
                               aria-describedby="emailHelp" placeholder="Enter email">
                        <br>
                        <input type="submit" class="btn btn-newsLetter" value="Submit">
                    </div>
                </form>
            </div>
    </section>

    <!--FOOTER -->

    <section class="footerSec" id="">
        <div class="row">

            <div class="col-lg-4">
                <img class="footerLogo" src="${pageContext.servletContext.contextPath}/images/eruditio_logo_white.png" alt="">
                <p class="simpleFooter">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolorum, ipsa! Amet
                    natus ipsam quo.
                    Aperiam provident possimus iure quisquam excepturi.</p>


            </div>

            <div class="col-lg-4 mv-footer">
                <h4>Mission</h4>
                <p class="missionFooter">Lorem ipsum dolor sit amet consectetur adipisicing elit. A inventore culpa est
                    sequi quis hic
                    corrupti suscipit voluptatum temporibus qui.

                </p>


                <h4>Vision</h4>
                <p class="visionFooter">Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus eaque dolor porro
                    maxime expedita
                    facilis exercitationem aliquam excepturi sequi quibusdam!</p>



            </div>



            <div class="col-lg-4 contact-branch-footer">
                <h4>Contact Us</h4>
                <p class="contactFooter">Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore esse
                    praesentium illo necessitatibus
                    temporibus odio sunt quia, illum consectetur voluptatum.</p>
                <h4>Branches</h4>
                <p class="branchFooter">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius neque iusto
                    placeat quos, corrupti
                    voluptas minima doloremque ipsum vel esse.</p>


            </div>



            <div class="row footer-items">

                <div class="col-lg-6">
                    <p class="rights">© 2021 Eruditio Academy. All rights reserved.</p>
                </div>


                <div class="col-lg-3">
                    <a href="#" class="terms"> Terms of Use</a>

                </div>


                <div class="col-lg-3">
                    <a href="#" class="privacy"> Privacy Policy</a>
                </div>

                <div class="col-lg-5 social-icons">
                    <a href=""><img src="./img/facebookIcon.png" class="facebook" alt=""></a>
                    <a href=""><img src="./img/twitterIcon.png" class="twitter" alt=""></a>
                    <a href=""><img src="./img/youtubeIcon.png" class="youtube" alt=""></a>
                    <a href=""><img src="./img/instagramIcon.png" class="instagram" alt=""></a>
                </div>


            </div>


        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>