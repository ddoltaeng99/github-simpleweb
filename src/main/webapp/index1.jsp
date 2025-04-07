<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Simple Web Form</title>
</head>
<body>
<h2>Enter Your Details</h2>
<form action="process" method="post">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    <input type="submit" value="Submit">
</form>

<h2>View Stored Data</h2>
<form action="displayData" method="get">
    <input type="hidden" name="view_all" value="1"><br><br>
    <input type="submit" value="View Scores">
</form>

<!--

<a href="<%= request.getContextPath() %>/UserServlet" id="userLink">Click here to view</a>
<p>Context Path: <%= request.getContextPath() %></p>
<script>
    let servletName = "UserServlet"; // If this came from a dynamic source
    document.getElementById("userLink").href = "<%= request.getContextPath() %>/" + encodeURIComponent(servletName);
</script>
-->
</body>
</html>
