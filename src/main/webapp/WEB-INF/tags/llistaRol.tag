<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:choose>
<c:when test="${requestScope['llistaRol'] != null}">
    <!--Es crea la taula-->
    <table>
        <tr>
            <th>Rol</th>
            <th>Descripcio</th>
        </tr>

        <c:forEach items="${requestScope['llistaRol']}" var="rol">
            <tr>
                <td><c:out value="${rol.getNomRol()}"/></td>
                <td><c:out value="${rol.getDescripcioRol()}"/></td>
                <c:choose>
                    <c:when test="${requestScope['admin']}">
                        <td>
                            <form action="actualitzarRol.jsp" method="get">
                                <button type="submit" name="actualitzarRol" value="${rol.getNomRol()}">Modifica</button>
                            </form>
                        </td>
                        <td>
                            <form action="llistaRol" method="post">
                                <button type="submit" name="baixaRol" value="${rol.getNomRol()}">Donar de baixa</button>
                            </form>
                        </td>
                    </c:when>
                </c:choose>
            </tr>
        </c:forEach>
    </table>

</c:when>
</c:choose>


