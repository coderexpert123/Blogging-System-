<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="Error_Page.jsp" %>
<%
    User user=(User)session.getAttribute("currentuser");
    if (user==null) 
    {
        
    response.sendRedirect("login.jsp");
            
    }
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
       <link rel=”stylesheet” href=”https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css” />
       <script src="JS/index.js" type="text/javascript"></script>
       <script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
       <link rel=”stylesheet” href=”https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css”/>
       <title>Nishant Blog | A Blog using website Java </title>
    </head>

<body>

<!-- Navbar Detail Start from here -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Programming
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Java</a>
          <a class="dropdown-item" href="#">c++ </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">ATML Machine Project</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link " href="ContactUs.jsp">Contact Us</a>
      </li>
      
        <li class="nav-item active">
        <a class="nav-link " href="AboutsUs.jsp">About Us</a>
      </li>
    
    </ul>

  </div>
      
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active" data-toggle="modal" data-target="#exampleModal">
            <a class="nav-link "><%= user.getName() %></a>
        </li>
           <li class="nav-item active">
            <a type="button" class="btn btn-warning mr-2 ml-2 " href="Logout">Logout</a>
        </li>
        <li class="nav-item active">
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#postModal">Add Post</button>
        </li>
    </ul>
</nav>

<!-- End of Navbar -->
  
 
              <% 
                      
                      Message m=(Message)session.getAttribute("msg");
                      if(m!=null)
                      {                    
                      %>
                    <div class="alert <%= m.getCssClass() %>" role="alert">
                        <%= m.getContent() %>
                        
                    </div>
                      <%
                          session.removeAttribute("msg");
                          }
                      %>
                      
                
                      
     <!-- Post Modal Details -->  
     
     <div class="container">
         
         <div class="row">
             <!-- First col Details --> 
             <div class="col-md-4 mt-4 mb-3">
  
             <div class="list-group">
                 <a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
               All Post 
             </a>
                 
                 <% 
        PostDao postds=new PostDao(ConnectionProvider.getConnection());
        ArrayList<Category> lists=postds.getAllCategories();
        
        for(Category ct:lists)
        {    
        %>
        
        <a href="#" onclick="getPost(<%= ct.getcId() %>,this)" class="c-link list-group-item list-group-item-action"><%= ct.getcName() %></a>
        
        
        <% 
            }
        %>
        
              </div>
                 
             </div>
             
             
             <!-- Second col Details --> 
             <div class="col-md-8">
                
                <div class="container text-center" id="loder">
                     <i class="fa-solid fa-user"></i>    
                     <h1 class="m-4">Loading...... </h1>
                     
                </div>
                 
                 <div class="container-fluid" id="post-container">
                     
                     
                 </div>
                 
             </div>
         </div>
     </div>
     
     
     
     <!-- End of Post Modal Details -->                 

                      
                      
<!-- User Modal Details -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">


          <img src="pics/<%= user.getProfile() %>"
          alt="Generic placeholder image" class="img-responsive center-block"
          style="width: 150px; z-index: 1">


        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   
          <div id="profile-details">
<table class="table">
 
  <tbody>
  
      <tr>
 
      <td>Name</td>
      <td><%= user.getName() %></td>
 
    </tr>
    <tr>
 
      <td>Id</td>
      <td><%= user.getId() %></td>
 
    </tr>
    <tr>
 
      <td>Email</td>
      <td><%= user.getEmail() %></td>
   
    </tr>
    <tr>
 
      <td>Registration Date</td>
      <td><%= user.getDateTime() %></td>
 
    </tr>
  <tr>
 
      <td>Gender</td>
      <td><%= user.getGender() %></td>
 
    </tr>
  <tr>
 
      <td>Password</td>
      <td><%= user.getPassword() %></td>
 
    </tr>
        <tr>
 
      <td>About</td>
      <td><%= user.getAbout() %></td>
 
    </tr>
  </tbody>
</table>
</div>
</div>
      
      <div id="profile-edit"style="display:none;">
          <h3 mt-2>Pleases Edit Carefully</h3> 
          <form action="EditServlet" method="post" enctype="multipart/form-data">

   <table class="table">
 
     <tr>
      
      <td>Id</td>
      <td><%= user.getId() %></td>
 
    </tr>
  
    <tr> 
      <td>Name</td>
      <td><input type="text" class="form-control" name="name" value="<%= user.getName() %>"></td>
    </tr>


    <tr>
      <td>Email</td>
      <td><input type="email" class="form-control" name="email" value="<%= user.getEmail() %>"></td>
    </tr>

    
    <tr>
      <td>Password</td>
      <td><input type="password" class="form-control" name="password" value="<%= user.getPassword()%>"></td>
    </tr>

    <tr>
      <td>Registration Date</td>
      <td><%= user.getDateTime() %></td>
    </tr>

    <tr>
      <td>Gender</td>
      <td><%= user.getGender() %></td>
    </tr>
        <tr>
          <td>About</td>
          <td> 
          <textarea rows="3" class="form-control" name="about">
          <%= user.getAbout() %>
          </textarea>
          </td>

        </tr>

    <tr>
      <td>Profile Pic </td>
      <td>
          
          <input type="file" name="image" class="form-control-file" id="exampleFormControlFile1">

      </td>
    </tr>
 
</table>

<div class="container text-center mb-3">
 <button id="updatetodate" type="submit" class="btn btn-danger">Update</button>
</div>
          </form>

      </div>
   
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!--End of  User Modal Details -->
      
      

<!-- Post Modal -->
<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Enter the Post Detail...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>


   <div class="modal-body">
        




<form action="AddPostServlet" method="POST">

  <select class="form-control" name="cid">
    <option selected disabled="none">Choose Your Category</option>   
        <% 
        PostDao postd=new PostDao(ConnectionProvider.getConnection());
        ArrayList<Category> list=postd.getAllCategories();
        
        for(Category c:list)
        {    
        %>
        <option value="<%= c.getcId() %>"><%= c.getcName() %></option>
        <% } %>
        
    </select>

  <div class="form-group">
    <label for="exampleInputEmail1">Post Tittle</label>
    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Post">
   </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Post Content</label>
    <input type="text" name="content" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Content">
   </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Post Code</label>
    <input type="text" name="code" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Code">
   </div>

  <div class="form-group">
   
   <input type="file" name="pics" class="form-control-file" id="exampleFormControlFile1">

  </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
        
</form>

      </div>   
  
    </div>
  </div>
</div>
      
<!-- End of Post Modal -->      
      
      
 
 
<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted">
  <!-- Section: Social media -->
  <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    <!-- Left -->
 
    <!-- Left -->

    <!-- Right -->
 
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Tech Blog
          </h6>
          <p>
            Here you can use rows and columns to organize your footer content. Lorem ipsum
            dolor sit amet, consectetur adipisicing elit.
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Products
          </h6>
          <p>
            <a href="#!" class="text-reset">Angular</a>
          </p>
          <p>
            <a href="#!" class="text-reset">React</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Vue</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Laravel</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="#!" class="text-reset">Pricing</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Settings</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Orders</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            info@example.com
          </p>
          <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
          <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2021 Copyright:
    <a class="text-reset fw-bold" href="index.jsp">techblog.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->


                <script>
                
                $(document).ready(function(){
                  let ediStatus=false;

                       
                            $('#edit-profile-button').click(function(){

                                if(ediStatus==false){
                                      
                                    $("#profile-details").hide();
                                    $("#profile-edit").show();
                                    ediStatus=true;
                                    $(this).text("Back");



                                }else{

                                      
                                    $("#profile-details").show();
                                    $("#profile-edit").hide();
                                    ediStatus=false;
                                    $(this).text("Edit");
                            

                                }

                   
                      

                            });

                        
                    });
                </script>

                <script>
                    function getPost(catID,temp){
                            $("#loder").show();
                            $("#post-container").hide();
                            $(".c-link").removeClass('active');
                            $.ajax({
                            url: 'loadpost.jsp',
                            data:{cid:catID} ,
                            
                            success: function(data,textStatus,jqXHR){
                                console.log(data);
                                $("#loder").hide();
                                $("#post-container").show();
                                $("#post-container").html(data);
                                $(temp).addClass('active');
                                

                            }
                            
                        });
                    }
                    
                    $(document).ready(function(e){
                        let allPostref=$('.c-link')[0];
                       getPost(0,allPostref);
                       
                 
                    });
                </script>
                
</body>
</html>

