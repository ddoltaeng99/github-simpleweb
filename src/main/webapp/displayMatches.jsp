<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="tab.css">
    <script src="tab.js"></script>
    <title>Match History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:#000;
            color: #ffffff;
            text-align: center;
        }
        .scoreboard {
            display: inline-block;
            border-radius: 10px;
            background: #1e1e1e;
            box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.1);
            width: 580px;
            margin-top: 50px;
            padding:30px;
        }

        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #1e1e1e;
            color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        }
        table th, td {
            padding: 15px;
            border: 1px solid #444;
        }
        th {
            background-color: #ff9800;
            color: white;
        }
        tr:hover {
            background-color: #333;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="tabs">
    <a href="index.jsp" class="tab">🏠 Home</a>
    <a href="enter_team.html" class="tab">📝 Enter Team</a>
    <a href="score.jsp" class="tab">🏀 Scoreboard</a>
    <a href="displayMatches.jsp" class="tab">📋 Matches</a>
</div>
<div class="scoreboard">
<h1>Match History</h1>

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

<a href='index.jsp'> 🏠Go to Home</a>

</body>
</html>
