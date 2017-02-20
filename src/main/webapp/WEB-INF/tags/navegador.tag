<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
    <c:when test="${requestScope['admin']}">
        <a href="index.jsp">Index</a>
        <a href="llistaUsuaris">Llista usuaris</a>
        <a href="userForm"> Donar alta usuari</a>
        <a href="llistaRol"> Llista de rols</a>
        <a href="actualitzarRol">Donar alta Rol</a>
        <a href="sortir.jsp">Sortir</a>
    </c:when>
    <c:otherwise>
        <a href="index.jsp">Index</a>
        <a href="llistaUsuaris">Llista usuaris</a>
        <a href="userForm"> Donar alta usuari</a>
        <a href="llistaRol"> Llista de rols</a>
        <a href="crearRol.jsp">Donar alta Rol</a>
        <a href="sortir.jsp">Sortir</a>
    </c:otherwise>
</c:choose>

