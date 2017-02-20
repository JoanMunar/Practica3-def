<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>


                <h1> Alta Rols</h1>

                <tag:navegador></tag:navegador>

                <form action="formRol" method="post">
                    <label>Nom:</label>
                    <input type="text" name="nom">
                    <label>Descripcio:</label>
                    <input type="text" name="desc">
                    <input type="submit">
                </form>

