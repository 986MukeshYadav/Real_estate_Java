<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ page import="java.util.*" %>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        Connection conInsert = null;
        PreparedStatement insertStatement = null;

        try {
            conInsert = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");
            String insertQuery = "INSERT INTO registeruser (name, email, phone, address, role) VALUES (?, ?, ?, ?, ?)";
            insertStatement = conInsert.prepareStatement(insertQuery);
            insertStatement.setString(1, name);
            insertStatement.setString(2, email);
            insertStatement.setString(3, phone);
            insertStatement.setString(4, address);
            insertStatement.setString(5, role);

            int rowsAffected = insertStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect(request.getContextPath() + "/AdminUser.jsp"); // Redirect to a success page
            } else {
                // Handle the case where insertion failed
                // You might want to redirect to an error page or show an error message
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources (Connection, PreparedStatement, etc.)
            try {
                if (insertStatement != null) {
                    insertStatement.close();
                }
                if (conInsert != null) {
                    conInsert.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New User</title>
    
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
    <main role="main" class="container">
        <div class="py-5">
            <h2 class="text-center">Add New User</h2>

            <form action="<%= request.getRequestURI() %>" method="post" class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                    <div class="invalid-feedback">
                        Please enter a valid name.
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                    <div class="invalid-feedback">
                        Please enter a valid email address.
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" class="form-control" required>
                    <div class="invalid-feedback">
                        Please enter a valid phone number.
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" class="form-control" required>
                    <div class="invalid-feedback">
                        Please enter a valid address.
                    </div>
                </div>

                <div class="form-group">
                    <label for="role">Role:</label>
                    <select id="role" name="role" class="form-control" required>
                        <option value="user">User</option>
                         <option value="user">Admin</option>
                        <!-- Add other role options as needed -->
                    </select>
                    <div class="invalid-feedback">
                        Please select a role.
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
                </div>
    </main>
<%@ include file="Footer.jsp" %>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    <!-- Form validation script -->
    <script>
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>