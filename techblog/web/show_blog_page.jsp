<%-- 
    Document   : show_blog_page
    Created on : Jul 6, 2024, 3:25:08 PM
    Author     : gauta
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.categories"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="error_page.jsp"%>
<%
    user u = (user) session.getAttribute("current_user");
    if (u == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%    int post_id = Integer.parseInt(request.getParameter("post_id"));
    postDao pdd = new postDao(connectionProvider.getConnection());
    posts p = null;
    p = pdd.getPostByPostId(post_id);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 89%, 68% 98%, 35% 92%, 0 100%, 0% 30%);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
               font-weight: 100;
                font-size: 25px; 
            }
            .post-code{
                
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"> </span> MytechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-university"> </span> Learn Code With Ishan <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"> </span> category
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">programming language</a>
                            <a class="dropdown-item" href="#">progect Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book"> </span> contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"data-toggle="modal" data-target="#post-modal"><span class="fa fa-asterisk"> </span> Do Post </a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"> </span> <%= u.getName()%></a>
                    </li>
                    <ul class="navbar-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"> </span> Logout</a>
                        </li>
                    </ul>
            </div>
        </nav>
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContetnt()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--end of navbar-->

        <!--        main content of body     -->

        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">

                            <h4 class="post-title"><%=p.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img class="card-img-top my-2" src="posts-pics/<%=p.getpPic()%>" alt="Card image cap">
                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <p class="post-user-info"> <a href="#">Ishan</a> Has Posted </p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%= p.getpDate().toLocaleString()%></p>
                                </div>
                            </div>
                            <p class="post-content"><%= p.getpContent()%></p>
                            <br>
                            <br><!-- comment -->
                            <div class="post-code">
                                <pre>
                                    <%= p.getpCode()%>
                                </pre>
                            </div>


                            <div class="card-footer primary-background text-center">
                                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 10 </span></a>
                                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 20 </span></a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--        end of main container    -->

        <!--profile Modal-->

        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <h5 class="modal-title" id="exampleModalLabel"><%=u.getProfile()%></h5>
                            <h5 class="modal-title" id="exampleModalLabel"><%=u.getName()%></h5>
                            <!--details-->
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%=u.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">email:</th>
                                            <td><%=u.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">gender:</th>
                                            <td><%=u.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">about:</th>
                                            <td><%=u.getAbout()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile-Edit-->
                            <div id="profile-edit" style="display: none">
                                <h3 class="m-3">Please edit carefully</h3>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>id :</td>
                                            <td><%=u.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" id="user_email" class="form-control" name="user_email" value="<%=u.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" id="user_name" class="form-control" name="user_name" value="<%=u.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" id="user_password" class="form-control" name="user_password" value="<%=u.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%=u.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about"><%=u.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile :</td>
                                            <td><input type="file" name="image" class="form-control" ></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id = "edit-profile-btn" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- -----------------------post trigger modal-->
        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Provide The Post Deatils</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id= "add-post-form"action="addPostServlet" method="POST">

                            <div class="form-group">
                                <select class="form-control" name ="cid">

                                    <option selected disabled>Select Cotegories</option>
                                    <%
                                        postDao pd = new postDao(connectionProvider.getConnection());
                                        ArrayList<categories> list = new ArrayList<>();
                                        list = pd.getcategories();
                                        for (categories c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" id="title" name="title" placeholder="Enter Post Title" class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" name="content"placeholder="Enter Your Post Content" style="height: 200px"></textarea>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" name="code" placeholder="Enter Your program (if any)" style="height: 200px"></textarea>
                            </div>

                            <div class="form-group">
                                <lable> Select your Pic</lable>
                                <br>
                                <input type="file" id="pic" name="pic" class="form-control">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>

                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>





        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                alert("documet is ready");

                let editStatus = false;


                $("#edit-profile-btn").click(function () {
                    if (editStatus === false)
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>
        <!--post.Js-->
        <script>
            $(document).ready(function () {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    console.log("submitted");
                    let formData = new FormData(this);

                    $.ajax({
                        url: "addPostServlet",
                        type: "POST",
                        data: formData,
                        success: function (data, textStatus, jqXHR)
                        {
                            if (data.trim() === "done")
                                swal("Good job!", "Post Submitted!", "success");
                            else
                                swal("Error!", "Something Went Wrong Try again!", "danger");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("Error!", "Something Went Wrong!", "danger");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
