import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get search parameters from the request
        String location = request.getParameter("location");
        String propertyType = request.getParameter("propertyType");
        String priceRange = request.getParameter("priceRange");

        // Perform the search logic (replace with actual database queries)
        // For demonstration, using placeholder data
        String[] results = {
            "Property 1 in " + location + " - " + propertyType + " - " + priceRange,
            "Property 2 in " + location + " - " + propertyType + " - " + priceRange,
            "Property 3 in " + location + " - " + propertyType + " - " + priceRange
        };

        // Pass the results to the JSP page
        request.setAttribute("results", results);
        request.getRequestDispatcher("/searchResults.jsp").forward(request, response);
    }
}
