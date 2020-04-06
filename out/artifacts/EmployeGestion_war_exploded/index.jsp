<%@ page import="com.GestionEmploye.Employe" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
  <title> Gestion des employès </title>
  <link rel="stylesheet" href="./styling.css">
</head>
<body class="body1">
<div class="login">
  <h2>Administrateur</h2>
  <form action="ServletLogin" method="post" >
    <p> Username</p>
    <input type="text"  name="username" placeholder="entrer le nom d'utilisateur" required>
    <p>Password</p>
    <input type="password" name="password" placeholder="entrer le mot de passe" required>
    <br>
    <br>
    <br>
    <input type="submit" class="button" value="Sign in ">

  </form>

</div>
</body>
</html>
<!--
<html>
<head>
<title>$Title$</title>
</head>
<body>
<form action="/MiniProjetGestionEmployes_war_exploded/add" method="post">
<button type="submit">Add</button>
</form>
<form action="/MiniProjetGestionEmployes_war_exploded/get" method="get">
<button type="submit">Get all</button>
</form>
<form action="/MiniProjetGestionEmployes_war_exploded/delete" method="post">
<button type="submit">Delete</button>
</form>
<form action="/MiniProjetGestionEmployes_war_exploded/update" method="post">
<button type="submit">Update</button>
</form>
>>>>>>> b17eecfe3804151e84a6aa1f8ab25fc94c7b80da
</body>
-->


