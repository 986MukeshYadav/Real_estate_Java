import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    // JDBC URL, username, and password of MySQL server
    private final String jdbcURL = "jdbc:mysql://localhost:3306/mysql";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "admin";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        String rating = request.getParameter("rating");
        String message = request.getParameter("message");

        // JDBC variables
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Prepare SQL query
            String sql = "INSERT INTO feedback (rating, message) VALUES (?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, rating);
            stmt.setString(2, message);

            // Execute the query
            stmt.executeUpdate();

            // Redirect back to index.jsp or any other page
            response.sendRedirect("index.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            // Handle errors
            ex.printStackTrace();
        } finally {
            // Close JDBC objects
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}