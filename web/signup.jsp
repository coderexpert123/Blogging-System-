<%-- 
    Document   : index.jsp
    Created on : 30-Oct-2022, 5:16:34 PM
    Author     : Nishant Singh
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

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
        <script src="JS/index.js" type="text/javascript"></script>
        <title>Nishant Blog | A Blog using website Java </title>
 

    </head>
    <body>
 <%@include file="normal_navbar.jsp" %>
 
  <!-- Section: Design Block -->
<section class="text-center text-lg-start">
  <style>
    .cascading-right {
      margin-right: -50px;
    }

    @media (max-width: 991.98px) {
      .cascading-right {
        margin-right: 0;
      }
    }
  </style>

  <!-- Jumbotron -->
  <div class="container py-4">
    <div class="row g-0 align-items-center">
      <div class="col-lg-6 mb-5 mb-lg-0">
        <div class="card cascading-right" style="
            background: hsla(0, 0%, 100%, 0.55);
            backdrop-filter: blur(30px);
            ">
          <div class="card-body p-5 shadow-5 text-center">
            <h2 class="fw-bold mb-5">Sign up now</h2>
           
            
            <form id="reg-form" action="SignupServlet" method="POST">
              <!-- 2 column grid layout with text inputs for the first and last names -->
         
                <div class="form-outline mb-4">
                <input name="name" type="name" id="form3Example3" class="form-control" />
                <label class="form-label" for="form3Example3">User Name</label>
              </div>
              
              <!-- Email input -->
              <div class="form-outline mb-4">
                <input name="email" type="email" id="form3Example3" class="form-control" />
                <label class="form-label" for="form3Example3">Email address</label>
              </div>

                <div class="form-group">
                     <label for="gender">Select Gender</label>
                     <br>

                <input type="radio"  name="gender">Male
                <input type="radio"  name="gender">Female


                </div>
              <!-- Password input -->
              <div class="form-outline mb-4">
                <input name="password" type="password" id="form3Example4" class="form-control" />
                <label class="form-label" for="form3Example4">Password</label>
              </div>
        <!---Description  -->
        <div class="form-group">
            <textarea name="about" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            <label for="exampleFormControlTextarea1">Description</label>
        </div>
              <!-- Checkbox -->
              <div class="form-check d-flex justify-content-center mb-4">
                <input name="check" class="form-check-input me-2" type="checkbox" id="form2Example33" />
                <label class="form-check-label" for="form2Example33">
                  Terms and Conditions
                </label>
              </div>

              <!-- Submit button -->
              <button type="submit" class="btn btn-primary btn-block mb-4">
                Sign up
              </button>

              <!-- Register buttons -->
              <div class="text-center">
                 <button type="button" class="btn btn-link btn-floating mx-1">
                  <i class="fab fa-facebook-f"></i>
                </button>

                <button type="button" class="btn btn-link btn-floating mx-1">
                  <i class="fab fa-google"></i>
                </button>

                <button type="button" class="btn btn-link btn-floating mx-1">
                  <i class="fab fa-twitter"></i>
                </button>

                <button type="button" class="btn btn-link btn-floating mx-1">
                  <i class="fab fa-github"></i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <div class="col-lg-6 mb-5 mb-lg-0">
        <img src="https://mdbootstrap.com/img/new/ecommerce/vertical/004.jpg" class="w-100 rounded-4 shadow-4"
          alt="" />
      </div>
    </div>
  </div>
  <!-- Jumbotron -->
</section>
<!-- Section: Design Block -->

  

    </body>
    
    
    
    
</html>
