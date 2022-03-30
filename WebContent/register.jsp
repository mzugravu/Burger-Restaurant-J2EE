<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAOImpl" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>BurgerINSA</title>
<header>
  <jsp:include page="header.jsp"></jsp:include>
</header>
</head>
<body>
  <%
  String tmpMail = (String)session.getAttribute("email");
  String tmpPass = (String)session.getAttribute("password");

  if (tmpMail!=null && tmpPass!=null){
    if (MemberDAOImpl.passwordVerification(tmpMail,tmpPass)){
      session.setAttribute("attemptToReLogin","true");
      response.sendRedirect("account.jsp");
    }
  }
  %>
  <div class="register-photo">
      <div class="form-container" id="register">
          <div class="image-holder"></div>
          <form action="/BurgerINSA/Register" method="POST">
              <h2 class="text-center"><strong>Create</strong> an account.</h2>
              <div class="form-group"><input class="form-control" type="text" name="uname" placeholder="Name"></div>
              <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email"></div>
              <div class="form-group"><input class="form-control" type="tel" name="phone" placeholder="Phone"></div>
              <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
              <div class="form-group"><input class="form-control" type="password" name="password-repeat" placeholder="Password (repeat)"></div>
              <div class="form-group"><button class="btn btn-success btn-block" type="submit">Sign Up</button></div><a class="already" href="login.jsp">You already have an account? Login here.</a>
          </form>
      </div>
  </div>
</body>
</html>
