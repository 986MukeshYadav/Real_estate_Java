<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0
  response.setDateHeader("Expires", 0); // Proxies
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property Details Page</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap JS (required for some features) -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>


    </head>

    <body>
        <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-5">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-4 border-bottom">
                <h1 class="h2">HomeLand</h1>
            </div>
            <form action="PropertyServlet" method="post">
                <div class="container">
                    <input type="hidden" name="property_id" value="House1">
                    <input type="hidden" name="property_name" value="Apartment"> 
                    <input type="hidden" name="property_country" value="Nepal"> 
                    <input type="hidden" name="property_address" value="28 Westport Dr. Warminster, PA 18974">
                    <input type="hidden" name="property_price" value="242334">

                    <h5 class="ml-5"> House1</h5>
                    <div class="d-flex align-items-center">
                        <p class="card-text ml-5 mr-5">28 Westport Dr. Warminster, PA 18974</p>
                        <div style="margin-right: 200px;"></div>   

                        <span class="btn btn-primary mr-3 d-flex align-items-center" style="border-radius: 20px; padding: 5px 10px; height: 20px; font-size: 14px;">House</span>
                        <span class="btn btn-success d-flex align-items-center" style="border-radius: 20px; padding: 5px 10px; height: 20px; font-size: 14px;">Nepal</span>

                        <div style="margin-right: 320px;"></div> 
                        <span style="color: #28a745; font-weight: bold" >$ 242334 </span>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <img src="<%= request.getContextPath() %>/imgs/page1.jpg" class="img-fluid" alt="House 5">
                            <div class="card-body">
                                <p class="card-text"><i class="fa fa-bed"></i> 5 <i class="fa fa-bath"></i> 3 <i
                                        class="fa fa-area-chart"></i> 4200 sqft</p>
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipiscing elit. Amet, lliot.
                                    Repudiandae ratione impedit delectus consectetur. Aspernaturvero obcaecati placeat ab
                                    distinctio unde ipsam molestias quateratione delectus blanditiis nemo eius dignissimos
                                    doloremque quaeculqaid pariatur temporibus consequuntur aliquid porro sint esse.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body row">
                                    <img src="<%= request.getContextPath() %>/imgs/Ranjan.png" class="rounded-circle"
                                         alt="Grover Robinson" style="width: 70px; height: 70px; border-radius: 50%;">
                                    <div class="container">
                                        <h5 class="card-title ml-3"><%= session.getAttribute("name") %></h5>
                                        <span style="color:#00FF00; font-size: 15px" class="ml-3">View Listings</span>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form action="PropertyServlet" method="post">

                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email*</label>
                                            <input type="email" class="form-control" id="email" name="email"
                                                   placeholder="name@example.com" value="<%= session.getAttribute("email") %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">Phone*</label>
                                            <input type="tel" class="form-control" id="phone" name="phone"
                                                   placeholder="Phone" value="<%= session.getAttribute("phone") %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="message" class="form-label">Message*</label>
                                            <textarea class="form-control" id="message" name="message" rows="3"
                                                      placeholder="Hello, I am interested in [Modern apartment]"></textarea>
                                        </div>
                                        <div class="d-grid gap-2">
                                            <button type="submit" value="submit" id="submit" class="btn btn-success" onclick="showMessageSentAlert()">Send Message</button>
                                            <button type="button" class="btn btn-secondary">Call</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </main>
        <script>
            // Function to display the alert
            function showMessageSentAlert() {
                alert("Message sent successfully!");
            }
        </script>
        <br>
        <%@ include file="Footer.jsp" %>
    </body>
</html>