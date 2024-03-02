<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<%
    Connection conUpdate = null;
    PreparedStatement updateStatement = null;

    try {
        conUpdate = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");

        // Get user input from the form
        String userEmail = request.getParameter("email");
        String userPhone = request.getParameter("phone");
        String userAddress = request.getParameter("address");

        // Use the session attribute or another way to get the user ID
        int userId = (int) session.getAttribute("userId"); // Update accordingly

        // Prepare and execute the update statement
        updateStatement = conUpdate.prepareStatement("UPDATE registeruser SET email=?, phone=?, address=? WHERE id=?");
        updateStatement.setString(1, userEmail);
        updateStatement.setString(2, userPhone);
        updateStatement.setString(3, userAddress);
        updateStatement.setInt(4, userId);

        int rowsUpdated = updateStatement.executeUpdate();

        if (rowsUpdated > 0) {
            // Successful update
            response.sendRedirect(request.getContextPath() + "/User.jsp");
        } else {
            // Update failed
            out.println("Update failed. Please try again.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the finally block
        try {
            if (updateStatement != null) updateStatement.close();
            if (conUpdate != null) conUpdate.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
