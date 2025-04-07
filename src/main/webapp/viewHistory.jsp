<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>CodePen - Responsive CSS Tabs</title>
    <style>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,500;1,600;1,700;1,800&family=Oswald:wght@200;300;400;500;600;700&family=Roboto+Condensed:wght@300;400;700&family=Roboto:wght@100;300;400;500;700;900&family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&family=Spectral:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.typekit.net/ovt6ynt.css">
    </style>
    <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital@0;1&family=Playfair+Display+SC:wght@900&family=Playfair+Display:ital,wght@0,800;1,800&family=Manrope:wght@800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="viewHistory.css">
    <script src="scoreboard.js"></script>

</head>
<body>
<!-- partial:index.partial.html -->
<div class = "wrapper pre">

</div>
<div class="wrapper">
    <div class="title">
        Scoreboard Pro
        <div class="line"></div>
    </div>
    <div class="container">
        <div class="card tabs">
            <input id="tab-1" type="radio" class="tab tab-selector" name="tab" />
            <label for="tab-1" class="tab tab-primary"><a class="tab-link" onclick="switchTab('tab-1')" >Home</a></label>
            <input id="tab-2" type="radio" class="tab tab-selector" name="tab" />
            <label for="tab-2" class="tab tab-success"><a class="tab-link" onclick="switchTab('tab-2')">Enter Teams</a></label>
            <input id="tab-3" type="radio" class="tab tab-selector"  name="tab" />
            <label for="tab-3" class="tab tab-default"><a class="tab-link" onclick="switchTab('tab-3')" >Scoreboard</a></label>
            <input id="tab-4" type="radio" class="tab tab-selector" checked="checked" name="tab" />
            <label for="tab-4" class="tab tab-warning"><a class="tab-link" onclick="switchTab('tab-4')" > View History</a></label>
            <div class="tabsShadow"></div>
            <div class="glider"></div>
            <section class="content">
                <div class="item" id="content-4">
                    <h2 class="tab-title tab-warning">View match results</h2>
                    <%
                        String dbURL = "jdbc:mysql://localhost:3306/sportsdb";
                        String dbUser = "root";  // Change if needed
                        String dbPass = "";  // Change if needed

                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                            //out.println("<p>✅ Database Connected Successfully</p>"); // Debug message

                            String query = "SELECT teamA, scoreA, teamB, scoreB, DATE_FORMAT(match_date, '%Y-%m-%d %h:%i %p') AS formatted_date FROM match_history ORDER BY match_date DESC";
                            stmt = conn.prepareStatement(query);
                            rs = stmt.executeQuery();

                            if (!rs.isBeforeFirst()) {
                                out.println("<p class='error'>⚠️ No match data found in the database!</p>");
                            } else {
                    %>
                    <div class="table-container">
                    <table>
                        <tr>
                            <th>Home Team </th>
                            <th>Visitor Team </th>
                            <th>Score</th>
                            <th>Match Date</th>
                        </tr>

                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("teamA") %></td>
                            <td><%= rs.getString("teamB") %></td>
                            <td><%= rs.getInt("scoreA") %>:<%= rs.getInt("scoreB") %></td>
                            <td><%= rs.getString("formatted_date") %></td>
                        </tr>
                        <%
                                    }
                                }
                            } catch (Exception e) {
                                out.println("<p class='error'>❌ Error: " + e.getMessage() + "</p>");
                                e.printStackTrace();
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                            }
                        %>

                    </table>
                </div>
            </section>

        </div>
    </div>
</div>
<!-- partial -->

</body>
</html>
