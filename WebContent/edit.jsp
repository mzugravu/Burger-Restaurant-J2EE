<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <div class="register-photo">
      <div class="form-container" id="register">
          <div class="image-holder2"></div>
          <form action="/BurgerINSA/Edit" method="post">
              <h2 class="text-center"><strong>Modify</strong> your profile.</h2>
              <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email"></div>
              <div class="form-group"><input class="form-control" type="tel" name="phone" placeholder="Phone"></div>
              <div class="form-group"><input class="form-control" type="text" name="address" placeholder="Address"></div>
              <div class="form-group"><button class="btn btn-success btn-block" type="submit">Save Profile</button></div>
          </form>
      </div>
  </div>
</body>
</html>
