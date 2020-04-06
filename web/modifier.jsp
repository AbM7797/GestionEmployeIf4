<%@ page import="com.GestionEmploye.Employe" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Employe" class="com.GestionEmploye.Employe"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title> Gestion des employès </title>

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

<div class="container border">
    <h1>Les employées</h1>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Numéro CIN</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Age</th>
                <th>Sexe</th>
                <th>Mail</th>
                <th>Adresse</th>
                <th>Post</th>
                <th>Modifier</th>
            </tr>
            </thead>
            <tbody>
            <%  for (com.GestionEmploye.Employe em: Employe.getAllEmployes()) { %>
            <tr>
                <td><%=em.getId()%></td>
                <td><%=em.getNom()%></td>
                <td><%=em.getPrenom()%></td>
                <td><%=em.getAge()%></td>
                <td><%=em.getSexe()%></td>
                <td><%=em.getEmail()%></td>
                <td><%=em.getAdresse()%></td>
                <td><%=em.getPost()%></td>
                <td>
                    <a href="ServletUpdateEmploye?id=<%=em.getId()%>">Edit</a>

                </td>

            </tr>
            <% } %>


            </tbody>
        </table>

    </div>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
<style>
    html , body
    {
        margin: 0;
        padding: 0;
        font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif;

        background-image: url(theme/images/photo-of-people-sitting-beside-table-3182755.jpg);
        -webkit-background-size: cover;
        background-repeat: no-repeat;
        background-size:  cover,contain;
        background-position: center;

    }
    .table
    {
        background-color: #FFDDCC;

        border-color: #792700;
        width: 100%;
        border-collapse: collapse;
    }
    .table th
    {
        background: #999690;
        color: white;
        font-weight: bold;
    }

    .button {
        color: #0f6674;
        margin-bottom: 20px;
        width: 30%;

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