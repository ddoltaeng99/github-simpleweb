import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user") // URL to access this servlet
public class UserServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/testdb";
    private static final String DB_USER = "localhost";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<Integer, String> userMap = new HashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT id, name FROM users")) {
               /*
                if (!rs.isBeforeFirst()) { // No rows returned
                    System.out.println("No data found in the ResultSet.");
                } else {
                    // ✅ Process data if ResultSet is not empty
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        System.out.println("ID: " + id + ", Name: " + name);
                    }
                }
                */

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    userMap.put(id, name);
                }

                 // Close resources
                rs.close();
                stmt.close();
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // Display the stored results
        for (Map.Entry<Integer, String> entry : userMap.entrySet()) {
            System.out.println("ID: " + entry.getKey() + ", Name: " + entry.getValue());
        }
        // Pass the user list to JSP
        // Store the Map in request scope
        request.setAttribute("userMap", userMap);

        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("displayMap.jsp");
        dispatcher.forward(request, response);
    }
}
