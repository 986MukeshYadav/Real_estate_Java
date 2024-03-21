import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ratingStr = request.getParameter("rating");
        String message = request.getParameter("message");

        // Check if ratingStr is null or empty
        if (ratingStr == null || ratingStr.isEmpty()) {
            // Handle the error, perhaps by showing a message to the user
            // and redirecting them back to the form to select a rating
            response.sendRedirect("feedbackForm.jsp?error=Please%20select%20a%20rating");
            return;
        }

        try {
            // Convert rating to integer
            int rating = Integer.parseInt(ratingStr);

            // JDBC connection parameters
            String url = "jdbc:mysql://localhost:3306/mysql";
            String username = "root";
            String password = "admin";

            // Connect to the database
            Connection conn = DriverManager.getConnection(url, username, password);

            // SQL statement to insert feedback
            String sql = "INSERT INTO feedback1 (rating, message) VALUES (?, ?)";

            // Create prepared statement
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, rating);
            statement.setString(2, message);

            // Execute the statement
            statement.executeUpdate();

            // Close connections
            statement.close();
            conn.close();

            // Redirect to a thank you page or any other page
            response.sendRedirect("thankyou.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Handle the error, perhaps by showing a message to the user
            // and redirecting them back to the form to select a valid rating
            response.sendRedirect("feedbackForm.jsp?error=Invalid%20rating");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions
            response.sendRedirect("error.jsp");
        }
    }
}
