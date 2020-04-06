<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Document</title>
</head>
<body>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("index.jsp");
    }
%>
<header role="banner">
    <nav class="naviguer" role="navigation">
        <div class="inner">
            <div class="m-left">
                <h1 class="logo"><a href="home.jsp">  Gestion des  employès </a> </h1>
            </div>
            <div class="m-right">
                <a href="Ajouter.jsp">Ajout</a>
                <a href="modifier.jsp">Modification</a>
                <a href="supprimer.jsp">Suppression</a>
                <a href="ServletLogout">Logout</a>
            </div>
        </div>
    </nav>
</header>
<br>
<br>
<br>
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
            <p style="color: #792700">User deja existant.</p>
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
<style>
    body
    {
        margin: 0;
        padding: 0;
        background-image: url(theme/images/two-women-standing-beside-brown-board-on-wall-3184296.jpg);
        -webkit-background-size: cover;
        background-size: cover;
        font-family: Arial, Helvetica, sans-serif;

    }
    .form
    {
        position: absolute;
        top: 45%;
        left: 50%;
        transform: translate(-50% , -50%);
        width: 500px;
        height: 750px;
        margin-top: 150px;
        box-sizing: border-box;
        background-color: rgba(78, 77, 77, 0.5);
        padding: 40px;
        border-radius: 15px;
        border: 1px solid #ffffff;

    }
    .form h3
    {
        margin: 0;
        padding: 0 0 20px;
        font-weight: bold;
        color: white;
        text-align: center;

    }
    .form p
    {
        margin: 0;
        padding: 0;
        font-weight: bold;
        color: white;
        text-align: center;
    }
    .form input {
        margin-bottom: 20px;
        width: 100%;

    }

    .naviguer
    {
        width: 100%;
        height: 66px;
        line-height: 66px;
        background: coral;



    }
    .inner
    {
        width: 80%;
        margin: auto;
    }
    .logo
    {
        color: darkslategrey ;
        margin: 0;
        padding: 0;
        text-transform: uppercase;
        font-family: fantasy;
        font-weight: 900;
        font-size: 30px;
        letter-spacing: 1px;
    }
    .m-left
    {
        float: left;

    }
    .m-right
    {
        float: right;
    }.m-right a
     {text-decoration: none;
         color: firebrick;
         text-transform: uppercase;
         font-weight: 700;
         padding: 0;
         margin: 0 10px;


     }

</style>
</html>





