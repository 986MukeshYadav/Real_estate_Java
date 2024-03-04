import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateUserInfoServlet")
public class UpdateUserInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve updated user information from the form
        String newEmail = request.getParameter("email");
        String newPhone = request.getParameter("phone");
        String newAddress = request.getParameter("address");

        // Update the user information in the session
        HttpSession session = request.getSession();
        session.setAttribute("email", newEmail);
        session.setAttribute("phone", newPhone);
        session.setAttribute("address", newAddress);

        // You may also want to update the information in the database here.
        // Make sure to handle database updates securely and add proper validation.

        // Redirect back to the user page
        response.sendRedirect("User.jsp");
    }
}