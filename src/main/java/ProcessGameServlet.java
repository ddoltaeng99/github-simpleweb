import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.util.List;
import java.util.Map;

@WebServlet("/ProcessGameServlet")
public class ProcessGameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // ✅ Ensure UTF-8 is set BEFORE reading parameters
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        // Extract form parameters
        String teamA = request.getParameter("teamA");
        String teamB = request.getParameter("teamB");
        String score1Str = request.getParameter("score1");
        String score2Str = request.getParameter("score2");

        System.out.println("✅ Extracted Parameters:");
        System.out.println("➡️ teamA: " + teamA);
        System.out.println("➡️ teamB: " + teamB);
        System.out.println("➡️ score1: " + score1Str);
        System.out.println("➡️ score2: " + score2Str);

        if (teamA == null || teamB == null || score1Str == null || score2Str == null) {
            System.err.println("⚠️ Error: Missing form parameters!");
            response.setStatus(400);
            out.write("{\"status\": \"error\", \"message\": \"Missing parameters!\"}");
            return;
        }

        // Convert scores safely
        int score1 = 0, score2 = 0;
        try {
            score1 = Integer.parseInt(score1Str);
            score2 = Integer.parseInt(score2Str);
        } catch (NumberFormatException e) {
            System.err.println("❌ Error: Score conversion failed!");
            response.setStatus(400);
            out.write("{\"status\": \"error\", \"message\": \"Invalid score format!\"}");
            return;
        }

        // Debugging logs
        System.out.println("✅ Parsed Values:");
        System.out.println("➡️ teamA: " + teamA);
        System.out.println("➡️ teamB: " + teamB);
        System.out.println("➡️ score1: " + score1);
        System.out.println("➡️ score2: " + score2);

        // Database connection
        String url = "jdbc:mysql://localhost:3306/sportsdb";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            String sql = "INSERT INTO match_history (teamA, teamB, scoreA, scoreB) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, teamA);
            preparedStatement.setString(2, teamB);
            preparedStatement.setInt(3, score1);
            preparedStatement.setInt(4, score2);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                //System.out.println("✅ Match saved successfully!");
                //out.write("{\"status\": \"success\", \"message\": \"Match saved successfully!\"}");
                response.sendRedirect("viewHistory.jsp");
                return;
            } else {
                out.write("{\"status\": \"error\", \"message\": \"Failed to save match.\"}");
            }

            preparedStatement.close();
            conn.close();

        } catch (SQLException | ClassNotFoundException e) {
            response.setStatus(500);
            out.write("{\"status\": \"error\", \"message\": \"Database error: " + e.getMessage() + "\"}");
        }

    }
}
