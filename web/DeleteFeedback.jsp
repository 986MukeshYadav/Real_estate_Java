
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Retrieve the feedback ID from the request parameter
    String feedbackId = request.getParameter("id");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Establish a database connection
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");
        
        // Prepare SQL statement to delete the feedback entry
        String sql = "DELETE FROM feedback WHERE id = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, feedbackId);
        
        // Execute the delete operation
        int rowsAffected = ps.executeUpdate();
        
        if (rowsAffected > 0) {
                response.sendRedirect(request.getContextPath() + "/FeedbackUser.jsp"); // Redirect back to the user page
            } else {
                // Handle the case where deletion failed
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    } finally {
        // Close resources
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
