<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="theme/css/ajoutStyle.css">
    <link rel="stylesheet" href="theme/css/headerStyle.css">
    <title>Gestion des employès</title>
</head>
<body>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("index.jsp");
    }
%>
<%@include file="header.jsp" %>

<div class="container form">
    <h1>
        <c:if test="${employe != null}">
            Edit Employe
        </c:if>
        <c:if test="${employe == null}">
            Ajouter un employé
        </c:if>

    </h1>
    <div >
        <c:if test="${userExist==true}">
            <p style="color: #792700">Employé deja existant.Verifier le numéro du votre CIN!</p>
        </c:if>
        <c:if test="${CINVerif==true}">
            <p style="color: #792700">CIN doit etre 8 chiffres.</p>
        </c:if>

        <c:if test="${SuccessAdd==true}">
            <p style="color: green">Employé est bien enregistré!</p>
        </c:if>
        <c:if test="${employe!=null}">
            <form action="ServletUpdateEmploye" method="post">
        </c:if>
        <c:if test="${employe==null}">
            <form action="ServletAddEmploye" method="post" >

                </c:if>
<c:if test="${employe!=null}">
                    <input  name="oldid"  type="hidden"   value="<c:out value='${employe.getId()}'/>" />
</c:if>

            <p> Nom</p>
            <input type="text" value="<c:out value='${employe.getNom()}'/>" name="nom" placeholder="entrer le nom de l'employé" required>
            <p>Prenom</p>
            <input type="text" value="<c:out value='${employe.getPrenom()}'/>" name="prenom" placeholder="entrer le Prenom" required>
            <p> Age</p>
            <input type="number" name="age"  value="<c:out value='${employe.getAge()}'/>"  placeholder="entrer l'age de l'employé" required>

            <p>Numéro de CIN</p>
            <input  name="id"  pattern=".{8,8}"  type="number" required  minlength="8" value="<c:out value='${employe.getId()}'/>" placeholder="entrer le cin de l'employé"/>

            <p> Sexe</p>
            <input type="text" name="sexe"  value="<c:out value='${employe.getSexe()}'/>" placeholder="entrer le sexe de l'employé" required>
            <p> Email</p>
            <input type="email" name="email"  value="<c:out value='${employe.getEmail()}'/>" placeholder="entrer le mail" required>
            <p> Adresse</p>
            <input type="text" name="adresse"  value="<c:out value='${employe.getAdresse()}'/>" placeholder="entrer l'addresse de l'employé" required>
            <p>Post</p>
            <input type="text" name="post"  value="<c:out value='${employe.getPost()}'/>" placeholder="entrer la post de l'employé" required>
                    <c:if test="${employe != null}">
                        <input type="submit"  class="button" value="Modifier ">
                    </c:if>
                    <c:if test="${employe == null}">
                        <input type="submit"  class="button" value="Ajouter ">
                    </c:if>


        </form>

    </div>

</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html>





