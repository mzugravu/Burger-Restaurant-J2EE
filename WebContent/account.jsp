<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*, java.util.*,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement,extra.DatabaseConnection,models.Member"%>
<html>
    <!-- Importing all ui libs -->
    <link rel="stylesheet" href="/BurgerINSA/WebContent/css/style.css">
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <style media="screen">

    .buttonAccount{
      margin-left: 10px;
      margin-right: 10px;
      margin-top: 10px;
      background-color: #04AA6D;
      color: white;
      padding-top: 10px;
      padding-bottom: 10px;
      padding: 12px 20px 5px 5px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      margin-bottom: 5px;
      margin-bottom: 5px;
      font-weight: bold;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }

    .centerAccount {
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .strongText {
      color: #000000;
      font-size: 1em;
      line-height: 50px;
    }
    .row {
      padding-left: 20px;
    }
    .centerButton {
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .centerAvatar {
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .containerAccount {
      padding-top: 100px;
    }
    .info {
      color: #000000;
      font-size: 1em;
      line-height: 50px;
    }
    </style>

</head>
<header>
  <div class="headerAccount">
    <jsp:include page="header.jsp"></jsp:include>
  </div>

</header>
<body>
  <%
  if ((String)session.getAttribute("attemptToReLogin")=="true"){%>
    <script type="text/javascript">
      swal({
      title: "Already logged in!",
      text: "You are being redirected to your account.",
      icon: "warning",
      button: "Close!",
      });
    </script>
<%    session.setAttribute("attemptToReLogin","null");
  }

  if ((String)session.getAttribute("email")==null){
    session.setAttribute("profileWithoutLogIn","true");
    response.sendRedirect("login.jsp");
  }

  Connection con = DatabaseConnection.getConnexion();
  Statement st;
  PreparedStatement ps;
  ResultSet rs;
  String query;
  String mail = (String)session.getAttribute("email");
  String databaseFullname = "";
  String databasePhone = "";
  String databaseAddress = "";
  System.out.println(mail);
  if (mail!=null){
    try {
			ps = con.prepareStatement("SELECT fullname, phone, address from users where mail=?");
			ps.setString(1, mail);
			rs = ps.executeQuery();
			if (rs.next()){
        databaseFullname = rs.getString("fullname");
        session.setAttribute("fullname", databaseFullname);
        databasePhone = rs.getString("phone");
        session.setAttribute("phone", databasePhone);
        databaseAddress = rs.getString("address");
        session.setAttribute("address", databaseAddress);

      }
		} catch (Exception e) {
			System.out.println("Connection error : get fullname where email is given");
		}
	}
%>
  <div class="containerAccount">
    <div class="centerAvatar">
      <img src="/BurgerINSA/WebContent/images/avatar.jpg" alt="Admin" class="avatar" width="150">
    </div>
    <div class="row">
      <div class="col-sm-3">
        <h6 class="strongText">Full Name</h6>
      </div>
      <div class="info">
        <%= databaseFullname%>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-sm-3">
        <h6 class="strongText">Email</h6>
      </div>
      <div class="info">
        <%= mail%>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-sm-3">
        <h6 class="strongText">Phone</h6>
      </div>
      <div class="info">
        <%= databasePhone%>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-sm-3">
        <h6 class="strongText">Address</h6>
      </div>
      <div class="info">
        <%= databaseAddress%>
      </div>
    </div>
    <hr>
    <div class="centerButton">
      <form  action="/BurgerINSA/WebContent/edit.jsp" method="get">
        <button type="submit" class="buttonAccount">Edit</button>
      </form>
      <form  action="/BurgerINSA/WebContent/edit.jsp" method="post">
        <button class="buttonAccount">My orders</button>
      </form>
      <form  action="/BurgerINSA/DeleteAccount" method="get">
        <button class="buttonAccount">Delete my account</button>
      </form>
      <form  action="/BurgerINSA/Logout" method="get">
        <button class="buttonAccount">Logout</button>
      </form>

    </div>

</body>

</html>
