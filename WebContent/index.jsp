<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.MemberDAOImpl" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <!-- Importing all ui libs -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<header>
  <jsp:include page="header.jsp"></jsp:include>
</header>
<body class="burger">
<% 
if ((String) session.getAttribute("isConnected") == "true"){%>
      <script type="text/javascript">
        swal({
          title: "You are connected!",
          text: "Now you can discover our lovely products :) ",
          icon: "success",
          button: "Close!",
        });
      </script>
<%
      session.setAttribute("isConnected", "null");
}%>
</body>

</html>
