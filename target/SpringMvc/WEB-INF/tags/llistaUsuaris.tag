<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
    <c:when test="${requestScope['llistaUsuaris'] != null}">
        <table>
            <tr>
                <th>Nom usuari</th>
            </tr>
            <c:forEach items="${requestScope['llistaUsuaris']}" var="nom">
                <tr>
                    <td><c:out value="${ nom.getNom()}"/></td>
                    <c:choose>
                        <c:when test="${requestScope['admin']}">
                            <td>
                                <form action="actualitzarUsuari.jsp" method="get">
                                    <button type="submit" name="modUser" value="${nom.getNom()}">Modifica</button>
                                </form>
                            </td>
                            <td>
                                <form action="llistaUsuaris" method="post">
                                    <button type="submit" name="baixaUser" value="${nom.getNom()}">Donar de baixa</button>
                                </form>
                            </td>
                        </c:when>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>

    </c:when>
</c:choose>
