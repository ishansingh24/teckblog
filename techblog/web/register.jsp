<%-- 
    Document   : register
    Created on : Jun 16, 2024, 6:00:56 PM
    Author     : gauta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 89%, 68% 98%, 35% 92%, 0 100%, 0% 30%);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>

        <main class="primary-background p-5 banner-background" style="margin-bottom:80px;"">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-user-plus fa-3x"> </span>
                                <p>Register Here</p>
                            </div>
                            <div class="card-body">
                                <form id="reg-form" action="registerServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">User Name</label>
                                        <input type="text" class="form-control" id="user_name" name="user_name" aria-describedby="emailHelp" placeholder="Enter Your User Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="user_email" name="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password">
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label for="gender">Select Gender</label>
                                        <br>
                                        <input type="radio" id="gender" name="gender" value="male">Male
                                        <input type="radio" id="gender" name="gender" value="female">Female
                                    </div>

                                    <div class="form-group">
                                        <textarea name="about" class="form-control" id="about" rows="5" placeholder="Tell me something about yourself"> </textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="check" name="check">
                                        <label class="form-check-label" for="exampleCheck1">terms and condition</label>
                                    </div>
                                    <div class="container text-center" id="loader" style="display: none">
                                        <span class="fa fa-refresh fa-spin fa-3x"></span>
                                        <h4>Please Wait........</h4>                                       
                                    </div>
                                    <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--  javascript  -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log("loded");

                $("#reg-form").on("submit", function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();

                    $.ajax({
                        url: "registerServlet",
                        data: form,
                        method: "POST",
                        success: function (data, textStatus, jqXHR)
                        {

                            if (data.trim() === "done")
                            {
                                console.log("success..............");
                                $("#submit-btn").show();
                                $("#loader").hide();
                                swal("Register SuccessFully....We are redirecting to login page.")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });

                            } else {
                                console.log("SOMETHING WENT WRONG");
                                swal(data);
                                $("#submit-btn").show();
                                $("#loader").hide();
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            console.log("error..................");
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong...Try again....");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
