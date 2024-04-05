
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin User Page</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="Dash.css">
        <script>
    function confirmDelete() {
        if (confirm("Are you sure you want to delete this feedback?")) {
            // Proceed with deletion
            return true;
        } else {
            // Cancel deletion
            return false;
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
                            <img src="<%= request.getContextPath() %>/imgs/Mukesh.jpg" class="rounded-circle" alt="Circular Image" style="width: 110px; height: 100px;">
                            <br/>
                            <b style="font-size: 15px; white-space: nowrap;" class="text-dark">Admin</b>
                            <b style="font-size: 12px" class="text-dark">admin@gmail.com</b>
                        </div>
                        <br/>
                        <b>
                            <ul class="nav flex-column">
                                <div class="sidebar-button">
                                    <img src="<%= request.getContextPath() %>/imgs/users.png" alt="Login Icon" width="30" height="30">
                                    <span>Users</span>
                                </div>&nbsp;

                                <div class="sidebar-button" onclick="redirectToProperty() ">
                                    <img src="<%= request.getContextPath() %>/imgs/property.png" alt="Login Icon" width="30" height="30">
                                    <span>Property</span>
                                </div>&nbsp;

                                <div class="sidebar-button" onclick="redirectToFeedbackPage()">
                                    <img src="<%= request.getContextPath() %>/imgs/feedback.png" alt="Feedback Icon" width="30" height="30">
                                    <span>Feedback</span>
                                </div>&nbsp;

                                <script>
                                    function redirectToFeedbackPage() {
                                        window.location.href = "<%= request.getContextPath() %>/FeedbackUser.jsp";
                                    }
                                    function redirectToProperty() {
                                        window.location.href = "<%= request.getContextPath() %>/ViewProperty.jsp";
                                    }
                                </script>


                                <div class="sidebar-button" style="height: 50px;">
                                    <a href="<%= request.getContextPath() %>/logout.jsp" class="nav-link" style="line-height: 1;">
                                        <img src="<%= request.getContextPath() %>/imgs/logout.png" alt="Logout Icon" width="30" height="30">
                                        <span style="font-size: 14px;">Logout</span>
                                    </a>
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
                    <div class="container">
                        <div class="row justify-content-between">
                            <h2>Feedbacks:</h2>
                        </div><br/>
                        <h5>All Users Feedbacks</h5>
                    </div>


                <div class="container">
                    <!-- Feedback Table -->
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th> 
                                <th>Name</th>
                                <th>Rating</th>
                                <th>Message</th>
                                <th>feedback_time </th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");
                                    ps = con.prepareStatement("SELECT * FROM feedback");
                                    rs = ps.executeQuery();
                                    while(rs.next()) {
                                        int id = rs.getInt("id");
                                        String name = rs.getString("name");
                                        String rating = rs.getString("rating");
                                        String message = rs.getString("message");
                                        String feedback_time = rs.getString("feedback_time");
                            %>
                            <tr>
                                <td><%= id %></td>
                                <td><%= name %></td>
                                <td><%= rating %></td>
                                <td><%= message %></td>
                                <td><%= feedback_time %></td>
                                
    <td>
    <!-- Add button for delete action -->
    <a href="DeleteFeedback.jsp?id=<%= id %>" class="btn btn-primary btn-danger" onclick="confirmDelete()">
        <i class="fa fa-trash"></i> Remove
    </a>
</td>

                            </tr>
                            <% 
                                    }
                                } catch(Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    try {
                                        if(rs != null) rs.close();
                                        if(ps != null) ps.close();
                                        if(con != null) con.close();
                                    } catch(SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>
                        </tbody>
                    </table>
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
