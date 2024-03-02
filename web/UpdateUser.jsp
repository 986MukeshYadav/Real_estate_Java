<%@ page import="java.sql.*" %>

<%
    Connection conUpdate = null;
    PreparedStatement updateStatement = null;

    try {
        conUpdate = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");

        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");

        updateStatement = conUpdate.prepareStatement("UPDATE registeruser SET name=?, email=? WHERE id=?");
        updateStatement.setString(1, userName);
        updateStatement.setString(2, userEmail);
        updateStatement.setString(3, userId);

        int rowsUpdated = updateStatement.executeUpdate();

        if (rowsUpdated > 0) {
            // Successful update
            response.sendRedirect(request.getContextPath() + "/AdminUser.jsp");
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
