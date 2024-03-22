import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details (replace with your own)
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mysql";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        // Retrieve user input from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
     

        try {
            // Get a database connection
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Check if the user exists
            String selectQuery = "SELECT * FROM registeruser WHERE email = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    // Check if the result set is not empty (user exists)
                    if (resultSet.next()) {
                        String userEmail = resultSet.getString("email");
                        String userType = resultSet.getString("role");
                        
                     

                       
                        
                // Create a session and set attributes
                //HttpSession session = request.getSession();
                session.setAttribute("name", resultSet.getString("name"));
                session.setAttribute("email", resultSet.getString("email"));
                session.setAttribute("phone", resultSet.getString("phone"));
                session.setAttribute("address", resultSet.getString("address"));
                
                
                 Cookie loginTimeCookie = new Cookie("loginTime", String.valueOf(System.currentTimeMillis()));
                 loginTimeCookie.setMaxAge(24 * 60 * 60); // Cookie lasts for 24 hours
                response.addCookie(loginTimeCookie);
                
                
                // Add cookies
                Cookie emailCookie = new Cookie("userEmail", userEmail);
                Cookie roleCookie = new Cookie("userRole", userType);
                emailCookie.setMaxAge(3600);  
                roleCookie.setMaxAge(3600);   
                response.addCookie(emailCookie);
                response.addCookie(roleCookie);
                        
                        
                        if ("admin".equalsIgnoreCase(userType)) {
                            // Redirect admin to admin panel
                            session.setAttribute("name", resultSet.getString("name"));
                            out.println("Admin login successful!<br>");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminUser.jsp");
                            dispatcher.forward(request, response);
                        } else {
                            // Redirect regular user to index.jsp
                           // session.setAttribute("name", resultSet.getString("name"));
                            out.println("Login successful!<br>");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                            dispatcher.forward(request, response);
                        }
                    } else {
                        out.println("Invalid username or password. Please try again.<br>");
                    }
                }
            }

            // Close the database connection
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}
