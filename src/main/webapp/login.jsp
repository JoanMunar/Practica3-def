<%--
  Created by IntelliJ IDEA.
  User: aleat
  Date: 16/02/2017
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login:</h2>
    <form name="loginForm" method="POST" action="j_security_check">
        <p>Nom: <input type="text" name="j_username" size="15"/></p>
        <p>Contrasenya: <input type="password" size="15" name="j_password"/></p>
        <p><input type="submit" value="Submit"/></p>
    </form>
</body>
</html>
