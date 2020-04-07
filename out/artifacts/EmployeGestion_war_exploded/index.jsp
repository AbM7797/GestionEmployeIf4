<%@ page import="com.GestionEmploye.Employe" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title> Gestion des employès </title>
  <link rel="stylesheet" href="theme/css/styling.css">
</head>
<body class="body1">
<div class="login">
  <h2>Administrateur</h2>
  <form action="ServletLogin" method="post" >
    <p> Username</p>
    <input type="text"  name="username" placeholder="entrer le nom d'utilisateur" required>
    <p>Password</p>
    <input type="password" name="password" placeholder="entrer le mot de passe" required>
    <c:if test="${wrong==true}">
    <p style="color: red"> Either user name or password is wrong.</p>
    </c:if>
    <input type="submit" class="button" value="Sign in ">
  </form>
</div>
</body>
</html>


