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

@WebServlet("/PropertyServlet")
public class PropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
   
        String propertyId = request.getParameter("property_id");
        String propertyName = request.getParameter("property_name");
        String propertyCountry = request.getParameter("property_country");
        String propertyAddress = request.getParameter("property_address");
        String propertyPrice = request.getParameter("property_price");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/mysql";
        String jdbcUsername = "root";
        String jdbcPassword = "admin";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {

                // Prepare SQL statement to insert data
              String sql = "INSERT INTO property (property_id, property_name,property_country, property_address, property_price, email, phone, message) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, propertyId);
                    statement.setString(2, propertyName);
                    statement.setString(3, propertyCountry);
                    statement.setString(4, propertyAddress);
                    statement.setString(5, propertyPrice);
                    statement.setString(6, email);
                    statement.setString(7, phone);
                    statement.setString(8, message);

                    // Execute the SQL statement
                    statement.executeUpdate();
                }
            }

            // Redirect back to property_details.jsp with a success message
            response.sendRedirect(request.getContextPath() + "/Property_details.jsp?success=true");
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            e.printStackTrace();
            // Redirect back to property_details.jsp with an error message
            response.sendRedirect(request.getContextPath() + "/Property_details.jsp?error=true");
        }
    }
}