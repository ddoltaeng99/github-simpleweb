import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/displayData")
public class DisplayDataServlet extends HttpServlet {

    // Database connection parameters – update these with your own credentials and database name.
    private static final String DB_URL = "jdbc:mysql://localhost:3306/testdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set the response content type to HTML
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Optionally load the MySQL JDBC driver (newer JDBC versions auto-load it)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<p>Error loading JDBC Driver: " + e.getMessage() + "</p>");
            return;
        }

        // SQL query to fetch data – update the table name and column names accordingly.
        String query = "SELECT * FROM users";

        try (
                // Establish the connection
                Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                // Create a statement object
                Statement stmt = con.createStatement();
                // Execute the query
                ResultSet rs = stmt.executeQuery(query);
        ) {
            // Start HTML output
            out.println("<html><head><title>Display Data</title></head><body>");
            out.println("<h2>Data Retrieved from MySQL Database</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th></tr>");

            // Iterate through the ResultSet and display each record
            while (rs.next()) {
                int id = rs.getInt("id");          // Replace with your actual column name
                String name = rs.getString("name");  // Replace with your actual column name
                out.println("<tr><td>" + id + "</td><td>" + name + "</td></tr>");
            }
            out.println("</table>");
            out.println("</body></html>");

        } catch (Exception e) {
            // Display any errors
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
}
