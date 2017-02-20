<%--
  Created by IntelliJ IDEA.
  User: aleat
  Date: 20/02/2017
  Time: 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exit</title>
</head>
<body>
    <% session.invalidate();
        response.sendRedirect("/index.jsp");
    %>
</body>
</html>
