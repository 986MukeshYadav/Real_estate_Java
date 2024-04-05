
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Cookie[] cookies = request.getCookies();
    String lastLoginTime = "";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("loginTime")) {
                long loginTimeMillis = Long.parseLong(cookie.getValue());
                Date loginDate = new Date(loginTimeMillis);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                lastLoginTime = sdf.format(loginDate);
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="Dash.css">
     <style>
    .center-line {
      position: absolute;
      left: 30%;
      top: 0;
      bottom: 0;
      width: 2px;
      background-color: #28a745;
      transform: translateX(-50%);
    }
    
    
    .container-left {
      width: 25%;
      padding-right: 20px; /* Adjust as needed */
    }

    .container-right {
      width: 50%;
      padding-left: 20px; /* Adjust as needed */
    }
  </style>
    <script>
     function toggleEditSave() {
    var emailField = document.getElementById('email');
    var phoneField = document.getElementById('phone');
    var addressField = document.getElementById('address');
    var saveBtn = document.getElementById('saveBtn');

    if (emailField.readOnly) {
        // Enable editing
        emailField.readOnly = false;
        phoneField.readOnly = false;
        addressField.readOnly = false;
        saveBtn.innerHTML = 'Save';
    } else {
        // Save the changes
        document.getElementById('userInfoForm').submit();
    }
}
    </script>
  
</head>

<body>

   

    <div class="container-fluid">
        <div class="row">
<!-- Sidebar -->
<nav class="col-md-2 d-none d-md-block bg-light sidebar" style="min-height: 100vh;">
    <div class="sidebar-sticky">
        <div class="col-4">
            <img src="<%= request.getContextPath() %>/imgs/Ranjan.png" class="rounded-circle" alt="Circular Image" style="width: 110px; height: 100px;">
            <br/>
            <b style="font-size: 15px; white-space: nowrap;" class="text-dark"><%= session.getAttribute("name") %></b>
            <b style="font-size: 12px" class="text-dark"><%= session.getAttribute("email") %></b>
        </div>
        <br/>
        <b>
            <ul class="nav flex-column">
               <div class="sidebar-button">
        <img src="<%= request.getContextPath() %>/imgs/dash.png" alt="Login Icon" width="30" height="30">
        <span>Dashboard</span>
      </div>&nbsp;

      <div class="sidebar-button">
        <img src="<%= request.getContextPath() %>/imgs/property.png" alt="Login Icon" width="30" height="30">
        <span>Property</span>
      </div>&nbsp;

<!--      <div class="sidebar-button">
        <img src="<%= request.getContextPath() %>/imgs/fav.png" alt="Login Icon" width="30" height="30">
        <span>Favourite</span>
      </div>&nbsp;

      <div class="sidebar-button">
        <img src="<%= request.getContextPath() %>/imgs/setting.png" alt="Login Icon" width="30" height="30">
        <span>Setting</span>
      </div>&nbsp;-->
      <div class="sidebar-button">
        <img src="<%= request.getContextPath() %>/imgs/feedback.png" onclick="window.location.href='Feedback.jsp'" alt="Login Icon" width="30" height="30">
        <span>Feedback</span>
      </div>&nbsp;
      
      <div class="sidebar-button"onclick="window.location.href='index.jsp'">
        <img src="<%= request.getContextPath() %>/imgs/logout.png" alt="Login Icon" width="30" height="30">
        <span>Logout</span>
      </div>
    </div>
            </ul>
        </b>
    
</nav>



            <!-- Main Content Area -->
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">HomeLand</h1>
                    <i class="fa fa-bell" style="font-size:40px"></i>
                </div>
      
           <div class="container mt-5">
  <div class="card mx-auto" style="width: 60rem; height: 30rem;">
    <div class="card-body d-flex">
      <div class="container-left mx-5">
        <img src="<%= request.getContextPath() %>/imgs/Ranjan.png" class="rounded-circle" alt="Circular Image" style="width: 110px; height: 100px;">
        <br/><br/>
        
        <b style="font-size: 20px; white-space: nowrap;" class="text-dark"><%= session.getAttribute("name") %></b></br>
        <%= lastLoginTime %>
        &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary my-5 btn-lg" id="saveBtn" onclick="toggleEditSave()">Edit</button>

      </div>
 

      <div class="center-line"></div>

      <div class="container-right">
            <div class="container">
        <h2>Personal Information</h2>
        <form id="userInfoForm" method="post" action="UpdateUserInfoServlet">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" value="<%= session.getAttribute("email") %>" readonly>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number" value="<%= session.getAttribute("phone") %>" readonly>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="<%= session.getAttribute("address") %>" readonly>
            </div>
     
        </form>
    </div>

      </div>
    </div>
  </div>
</div>
            </main>
        </div>
    </div>
    
<%@ include file="Footer.jsp" %>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>

</html>