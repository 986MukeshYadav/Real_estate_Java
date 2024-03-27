<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
<%
    Connection conSelect = null;
    PreparedStatement selectStatement = null;
    ResultSet result = null;

    try {
        conSelect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");
        selectStatement = conSelect.prepareStatement("select * from registeruser WHERE role != 'admin'");
        result = selectStatement.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
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
                            <b style="font-size: 15px; white-space: nowrap;" class="text-dark">Admin</b>
                            <b style="font-size: 12px" class="text-dark">admin@gmail.com</b>
                        </div>
                        <br/>
                        <b>
                            <ul class="nav flex-column">
                                <div class="sidebar-button" onclick="redirectToUserPage()">
                                    <img src="<%= request.getContextPath() %>/imgs/users.png" alt="Login Icon" width="30" height="30">
                                    <span>Users</span>
                                </div>&nbsp;

                                <div class="sidebar-button" onclick="redirectToProperty()">
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
                                    function redirectToUserPage() {
    window.location.href = "<%= request.getContextPath() %>/SignInServlet";
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
                            <h2>Users:</h2>
                            <a href="<%= request.getContextPath() %>/AddNewUser.jsp" class="btn btn-primary btn-sm">Add New</a>
                        </div><br/>
                        <h5>All Users Members</h5>
                    </div>



                    <div class="container mt-4">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Username</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Role</th>
                                    <th>Last LoggedIn</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>


                            <tbody>
                                <% if (result != null) { 
        while (result.next()) { %>
                                <tr>
                                    <td><%= result.getString("id") %></td>
                                    <td><%= result.getString("name") %></td>
                                    <td><%= result.getString("email") %></td>
                                    <td><%= result.getString("phone") %></td>
                                    <td><%= result.getString("address") %></td>
                                    <td><%= result.getString("role") %></td>
                                    <td> <%= lastLoginTime %></td>
                                    <td>
                                        <a href="<%= request.getContextPath() %>/EditUser.jsp?id=<%= result.getString("id") %>"
                                           class="btn btn-primary btn-sm">Edit</a>
                                    </td><td>
                                        <form action="<%= request.getContextPath() %>/DeleteUser.jsp" method="post">
                                            <input type="hidden" name="userId" value="<%= result.getString("id") %>">
                                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                <% } 
    } %>
                            </tbody>
                            <!--<p>Last Logged Time: <%= lastLoginTime %></p>-->
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
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    </body>

</html>