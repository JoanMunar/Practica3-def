<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<form action="llistaUsuari" method="POST">

    <input type="hidden" name="nom" value="<%= request.getParameter("actualitzarUsuari") %>">
    Nom actual: <input type="text" value="<%= request.getParameter("modUsuari") %>" disabled>
    Nou nom: <input type="text" name="nouNom" value="">
    <input type="submit">
</form>
