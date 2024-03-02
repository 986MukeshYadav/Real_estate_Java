<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ page import="java.util.*" %>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String userIdToDelete = request.getParameter("userId");

        Connection conDelete = null;
        PreparedStatement deleteStatement = null;

        try {
            conDelete = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");
            String deleteQuery = "DELETE FROM registeruser WHERE id = ?";
            deleteStatement = conDelete.prepareStatement(deleteQuery);
            deleteStatement.setString(1, userIdToDelete);

            int rowsAffected = deleteStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect(request.getContextPath() + "/AdminUser.jsp"); // Redirect back to the user page
            } else {
                // Handle the case where deletion failed
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources (Connection, PreparedStatement, etc.)
            try {
                if (deleteStatement != null) {
                    deleteStatement.close();
                }
                if (conDelete != null) {
                    conDelete.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
