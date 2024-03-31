<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0
  response.setDateHeader("Expires", 0); // Proxies
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String propertyId = request.getParameter("propertyId");

Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");
    ps = con.prepareStatement("DELETE FROM property WHERE property_id = ?");
    ps.setString(1, propertyId);
    int rowsDeleted = ps.executeUpdate();
    if (rowsDeleted > 0) {
        out.println("Property deleted successfully");
    } else {
        out.println("Failed to delete property");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
