import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/feedbackServlet")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int rating = Integer.parseInt(request.getParameter("rating"));
        String feedbackMessage = request.getParameter("feedbackMessage");

        // JDBC code to insert data into the database
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Establish database connection (you need to replace DB_URL, USER, PASS with actual values)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "admin");

            // SQL query to insert data
            String sql = "INSERT INTO feedback (rating, feedback_message) VALUES (?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, rating);
            stmt.setString(2, feedbackMessage);

            // Execute the query
            stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Handle errors appropriately
        } finally {
            // Close connections
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace(); // Handle errors appropriately
            }
        }

        // Send response
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Feedback submitted successfully");
    }
}
