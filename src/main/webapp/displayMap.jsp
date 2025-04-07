<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
  <title>View Match Results</title>
</head>
<body>
<h2>View Match Results</h2>
<!-- ✅ Check if the Map is empty
<c:choose>
  <c:when test="${empty requestScope.userMap}">
    <p>No data available.</p>
  </c:when>

  <c:otherwise>
    <table border="1">
      <tr>
        <th>Key</th>
        <th>Value</th>
      </tr>
      <c:forEach var="entry" items="${requestScope.userMap}">
        <tr>
          <td>${entry.key}</td>
          <td>${entry.value}</td>
        </tr>
      </c:forEach>
    </table>
  </c:otherwise>
</c:choose>
-->
</body>
</html>
