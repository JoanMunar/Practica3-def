<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<c:choose>
    <c:when test="${requestScope['admin'] != null}">
        <c:choose>
            <c:when test="${requestScope['admin']}">
                <h1> Alta Rols</h1>

                <tag:navegador></tag:navegador>

                <form action="formRol" method="post">
                    <label>Nom:</label>
                    <input type="text" name="nom">
                    <label>Descripcio:</label>
                    <input type="text" name="desc">
                    <input type="submit">
                </form>

            </c:when>
            <c:otherwise>
                <p>No tens permisos per donar alta, torna a <a href="index.jsp">index</a> i torna-ho a provar</p>
            </c:otherwise>
        </c:choose>
    </c:when>
</c:choose>
