<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>


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






