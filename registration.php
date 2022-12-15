<!DOCTYPE html>
<html>
    <head>
        <title>KUSA WESTERN | Register</title>
        <?php include "includes/head.php"; ?>
        <link rel="stylesheet" href="res/custom/css/register.css"/>
        <style>

        </style>   
    </head>
    <body>
        <!-- Header section -->
        <section class="section-header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 col-md-2 div-logo">
                        <img src="img/kusa-west.jpg">
                    </div>
                    <div class="col-sm-6 col-md-8 text-center div-title">
                        <h1><strong>KENYA UNIVERSITIES SPORTS FEDERATION</strong></h1>
                        <H3>(KUSF)</H3>
                        <H2>WESTERN CONFERENCE</H2>
                    </div>
                    <div class="col-sm-3 col-md-2 div-logo">
                        <img src="img/logo.png">
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-12 bg-black">
                        <h3 class="ml-4 p-2 m-1" style="color:white;">Athlete Registration</h3>
                    </div>
                </div>
            </div>

        </section>

        <!-- body section -->
        <section class="register-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-11">
                        <h3 class="mt-3">Instructions.</h3>
                        <p>Please provide the following information correctly and click continue to proceed. Have account? <a href="./">Login In</a></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-11 mx-auto">
                        <ul class="custom-box">
                            <li class="custom-active"><i class="fa fa-smile-o"></i> Bio-data</li>
                            <li class=""> <i class="fa fa-graduation-cap"></i> Education</li>
                            <li> <i class="fa fa-soccer-ball-o"></i> Sports</li>
                            <li> <i class="fa fa-file"></i> Documents</li>
                        </ul>
                    </div>
                </div>



                <div class="row">
                    <div class="col-sm-10 mx-auto" id="form-area">
                        <?php
                        include 'widget/registration/bio-data.php';
                        ?>

                    </div>

                </div>
            </div>


        </section>
        <!-- footer section -->
        <section>
            <div class="container-fluid bg-black text-light">
                <div class="row">
                    <div class="col-sm-10 mx-auto p-4">
                        <div class="text-center ">
                            KENYA UNIVERSITIES SPORTS FEDERATION-WESTERN (KUSF)-Western Conference <br>
                            Headquarters: Kenya national Sports Council Offices<br>

                            Affiliated to KUSf, KNSC, NOCK<br>
                            &copy; Kenya Universities Sports Federation, Western 2022. All rights reserved
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php include "includes/foot.php"; ?>
        <script type="text/javascript" src="res/custom/js/custom-register.js"></script>
        <script src="res/custom/js/custom-validator.js" type="text/javascript"></script>
        <script src="res/custom/js/test.js" type="text/javascript"></script>
        <script src="res/custom/js/loader-athlete.js" type="text/javascript"></script>
    </body>
</html>