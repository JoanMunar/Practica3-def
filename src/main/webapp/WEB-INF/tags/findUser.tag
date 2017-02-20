<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="llistaUsuaris" method="GET">
    <label>Cercar usuari</label>
    <input type="text" name="findUser">
    <input type="checkbox" name="fillRol" value="fillRol">

    <input type="submit">
</form>

<c:choose>
    <c:when test="${requestScope['findUser'] != null}">
       <p>${requestScope['findUser'].getNom()}
           <c:forEach items="${requestScope['findUser'].getAllRols()}" var="rol">
               <c:out value="${rol.getNomRol()}"/>
           </c:forEach>
       </p>
    </c:when>
    <c:when test="${requestScope['error'] != null}">
        <p style="color: darkred">${requestScope['error']}</p>
    </c:when>

</c:choose>