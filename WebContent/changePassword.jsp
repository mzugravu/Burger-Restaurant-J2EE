<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAOImpl" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" type="text/javascript"></script>
<title>BurgerINSA</title>
<header>
  <jsp:include page="header.jsp"></jsp:include>
</header>
</head>
<body>
  <div class="register-photo">
      <div class="form-container">
          <div class="image-holder2"></div>
          <form action="/BurgerINSA/ChangePassword" method="post">
              <h2 class="text-center"><strong>Change</strong> your password</h2>
              <div class="form-group"><input class="form-control" type="email" name="email" id="email" placeholder="Email"></div>
              <div class="form-group"><input class="form-control" type="password" name="password1" id="password1" placeholder="Password"></div>
              <div class="form-group"><input class="form-control" type="password" name="password2" id="password2" placeholder="Password repeat"></div>
              <div class="form-group"><button class="btn btn-success btn-block" type="submit" name="login">Change it</button></div>
      </div>
  </div>
</body>
</html>
