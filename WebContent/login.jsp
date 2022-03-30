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
  <%
    String tmpMail = (String)session.getAttribute("email");
    String tmpPass = (String)session.getAttribute("password");

    if (tmpMail!=null && tmpPass!=null){
      if (MemberDAOImpl.passwordVerification(tmpMail,tmpPass)){
        session.setAttribute("attemptToReLogin","true");
        response.sendRedirect("account.jsp");
      }
    }

    String profileBeforeConnection = (String)session.getAttribute("profileWithoutLogIn");
    if (profileBeforeConnection!=null){%>
      <script type="text/javascript">
        swal({
        title: "No profil found",
        text: "Please Login first!",
        icon: "error",
        button: "Close!",
        });
      </script>
<%    session.setAttribute("profileWithoutLogIn",null);
    }

    String mail = request.getParameter("email");
    String password = request.getParameter("password");

    if(mail!=null && password!=null){
      if (MemberDAOImpl.userExists(mail)){
        if (MemberDAOImpl.passwordVerification(mail,password)){
          session.setAttribute("email",mail);
          response.sendRedirect("account.jsp");
        }else{
          session.setAttribute("wrongPassword", "true");
          response.sendRedirect("login.jsp");
        }
      }else{
        session.setAttribute("isUknown", "true");
        response.sendRedirect("login.jsp");
      }
    }else{ %>
  <div class="register-photo">
      <div class="form-container">
          <div class="image-holder2"></div>
          <form action="/BurgerINSA/Login" method="post">
              <h2 class="text-center"><strong>Log in</strong></h2>
              <div class="form-group"><input class="form-control" type="email" name="email" id="email" placeholder="Email"></div>
              <div class="form-group"><input class="form-control" type="password" name="password" id="password" placeholder="Password"></div>
              <div class="form-group"><button class="btn btn-success btn-block" type="submit" name="login">Log in</button></div><a class="already" href="changePassword.jsp">Forgot your password? Change it here.</a>
          </form>
      </div>
  </div>
  <% if ((String)session.getAttribute("isUknown")!="Null"){
        if ((String) session.getAttribute("isUknown") == "true"){%>
          <script type="text/javascript">
            swal({
              title: "Unknown user!",
              text: "Please try again if not register!",
              icon: "error",
              button: "Close!",
              timer: 3000,
            });
          </script>
  <%
          session.setAttribute("isUknown", "Null");
        }
      } else {
        if ((String)session.getAttribute("wrongPassword")!="Null"){
          if ((String) session.getAttribute("wrongPassword") == "true"){%>
            <script type="text/javascript">
              swal({
              title: "Invalid password!",
              text: "Please try again!",
              icon: "error",
              button: "Close!",
              });
              </script>
  <%
            session.setAttribute("wrongPassword", "Null");
          }
        }
      }
    }
  %>
</body>
</html>
