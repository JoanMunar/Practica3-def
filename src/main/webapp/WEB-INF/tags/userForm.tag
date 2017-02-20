<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<c:choose>
    <c:when test="${requestScope['admin'] != null}">
        <c:choose>
            <c:when test="${requestScope['admin']}">
                <h1>Alta Usuaris</h1>
                <tag:navegador></tag:navegador>

                <form action="userForm" method="post">
                    <label>Nom:</label>
                    <input type="text" name="nom">
                    <label>Contrasenya:</label>
                    <input type="password" name="password">
                    <label>Rol:</label>
                    <select name="rol" multiple>
                        <c:forEach items="${requestScope['llistaRol']}" var="rol">
                            <option>
                                    ${rol.getNomRol()}
                            </option>
                        </c:forEach>
                    </select>
                    <input type="submit">
                </form>
            </c:when>
            <c:otherwise>
                <p>No tens permisos per donar alta, torna a <a href="index.jsp">index</a> i torna-ho a provar</p>
            </c:otherwise>
        </c:choose>
    </c:when>
</c:choose>






