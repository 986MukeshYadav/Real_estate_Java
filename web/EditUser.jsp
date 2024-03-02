<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Connection conSelect = null;
    PreparedStatement selectStatement = null;
    ResultSet result = null;

    String userId = request.getParameter("id");
    String userName = "";
    String userEmail = "";
    String userPhone = "";
    String userAddress = "";
    String userRole = "";

    try {
        conSelect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");

        selectStatement = conSelect.prepareStatement("SELECT * FROM registeruser WHERE id = ?");
        selectStatement.setString(1, userId);
        result = selectStatement.executeQuery();

        if (result.next()) {
            userName = result.getString("name");
            userEmail = result.getString("email");
            userPhone = result.getString("phone");
            userAddress = result.getString("address");
            userRole = result.getString("role");
            // Retrieve other fields as needed
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the finally block
        try {
            if (result != null) result.close();
            if (selectStatement != null) selectStatement.close();
            if (conSelect != null) conSelect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit User</title>
    <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="Dash.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
</head>
<body>
        <div class="container-fluid">
        <div class="row">
<!-- Sidebar -->
<nav class="col-md-2 d-none d-md-block bg-light sidebar" style="min-height: 80vh; padding-top: 20px;">
    <div class="sidebar-sticky">
        <div class="col-4">
            <img src="<%= request.getContextPath() %>/imgs/Ranjan.png" class="rounded-circle" alt="Circular Image" style="width: 110px; height: 100px;">
            <br/>
            <b style="font-size: 15px; white-space: nowrap;" class="text-dark">Ranjan Yadav</b>
            <b style="font-size: 12px" class="text-dark">ryadav081@rku.ac.in</b>
        </div>
        <br/>
        <b>
            <ul class="nav flex-column">
               <div class="sidebar-button">
        <img src="<%= request.getContextPath() %>/imgs/users.png" alt="Login Icon" width="30" height="30">
        <span>Users</span>
      </div>&nbsp;

      <div class="sidebar-button">
        <img src="<%= request.getContextPath() %>/imgs/property.png" alt="Login Icon" width="30" height="30">
        <span>Property</span>
      </div>&nbsp;

      
      <div class="sidebar-button">
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
                    <h2 class="text-center">Edit User</h2>
                    <form action="<%= request.getContextPath() %>/UpdateUser.jsp" method="post">
                        <input type="hidden" name="userId" value="<%= userId %>">

                        <div class="form-group">
                            <label for="userName">Name:</label>
                            <input type="text" class="form-control" name="userName" value="<%= userName %>" required>
                        </div>

                        <div class="form-group">
                            <label for="userEmail">Email:</label>
                            <input type="email" class="form-control" name="userEmail" value="<%= userEmail %>" required>
                        </div>

                        <div class="form-group">
                            <label for="userPhone">Phone:</label>
                            <input type="text" class="form-control" name="userPhone" value="<%= userPhone %>" required>
                        </div>

                        <div class="form-group">
                            <label for="userAddress">Address:</label>
                            <input type="text" class="form-control" name="userAddress" value="<%= userAddress %>" required>
                        </div>

                        <div class="form-group">
                            <label for="userRole">Role:</label>
                            <input type="text" class="form-control" name="userRole" value="<%= userRole %>" required>
                        </div>

                        <!-- Include other form fields as needed -->
  <div class="form-group" style="margin-bottom: 90px;">
        <button type="submit" class="btn btn-primary">Update User</button>
    </div>
                    </form><br>
                        
            
                </div>
                
            </main>
        </div>
    </div>
<%@ include file="Footer.jsp" %>
    <!-- Bootstrap JS and jQuery (ensure jQuery is included before Bootstrap JS) -->
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