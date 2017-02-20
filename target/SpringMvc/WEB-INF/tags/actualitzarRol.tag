<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<form action="llistaRol" method="POST">

    <input type="hidden" name="rol" value="<%= request.getParameter("modRol") %>">
    Rol actual: <input type="text" value="<%= request.getParameter("modRol") %>" disabled>
    Nou rol: <input type="text" name="nouRol" value="">
    <input type="submit">
</form>
