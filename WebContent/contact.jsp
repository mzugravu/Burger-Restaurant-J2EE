<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>BurgerINSA</title>
<header>
  <jsp:include page="header.jsp"></jsp:include>
</header>
</head>
<body>

    <div class="register-photo">
        <div class="form-container" id="register">
            <div class="image-holder"></div>
            <form action="/BurgerINSA/Register" method="POST">
                <h2 class="text-center"><strong>Contact</strong> us.</h2>
                <div class="divMail"><input class="form-control" type="email" name="email" placeholder="Email"></div>
                <label class="subject"for="Subject">Subject</label>
                  <select id="subject" name="subject" class="dropSelect">
                    <option value="information">Information</option>
                    <option value="problem">Technical problem</option>
                    <option value="complaint">Complaint</option>
                  </select>
                  <div class="divTextArea">
                    <textarea class="textarea"id="subject" name="subject" placeholder="Write something.." style="height:200px" rows="30"></textarea>
                  </div>
                  <div class="btn"><button class="button" type="submit">Send</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
