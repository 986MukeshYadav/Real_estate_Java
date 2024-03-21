import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class ContactServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        // Insert data into the database
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");

            // Create a SQL statement
            String sql = "INSERT INTO house_detailsuntitled (email, phone, message) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, phone);
            statement.setString(3, message);

            // Execute the statement
            statement.executeUpdate();

            // Close the connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect or forward the user to another page
        response.sendRedirect("index.jsp");
    }
}
