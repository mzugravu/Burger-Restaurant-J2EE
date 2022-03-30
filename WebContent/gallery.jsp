<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <!-- Importing all ui libs -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<header>
  <jsp:include page="header.jsp"></jsp:include>
</header>

<body>
  <!-- Container for the image gallery -->
<div class="container">

 <!-- Full-width images with number text -->
 <div class="mySlides">
     <img src="images/gallery1.jpg" style="width:100%">
 </div>

 <div class="mySlides">
     <img src="images/gallery2.jpg" style="width:100%">
 </div>

 <div class="mySlides">
     <img src="images/gallery3.jpg" style="width:100%">
 </div>

 <div class="mySlides">
     <img src="images/gallery4.jpg" style="width:100%">
 </div>

 <div class="mySlides">
     <img src="images/gallery5.jpg" style="width:100%">
 </div>

 <div class="mySlides">
     <img src="images/gallery6.jpg" style="width:100%">
 </div>

 <!-- Next and previous buttons -->
 <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
 <a class="next" onclick="plusSlides(1)">&#10095;</a>


 <!-- Thumbnail images -->
 <div class="row">
   <div class="column">
     <img class="demo cursor" src="images/gallery1.jpg" style="width:100%" onclick="currentSlide(1)" alt="The Woods">
   </div>
   <div class="column">
     <img class="demo cursor" src="images/gallery2.jpg" style="width:100%" onclick="currentSlide(2)" alt="Cinque Terre">
   </div>
   <div class="column">
     <img class="demo cursor" src="images/gallery3.jpg" style="width:100%" onclick="currentSlide(3)" alt="Mountains and fjords">
   </div>
   <div class="column">
     <img class="demo cursor" src="images/gallery4.jpg" style="width:100%" onclick="currentSlide(4)" alt="Northern Lights">
   </div>
   <div class="column">
     <img class="demo cursor" src="images/gallery5.jpg" style="width:100%" onclick="currentSlide(5)" alt="Nature and sunrise">
   </div>
   <div class="column">
     <img class="demo cursor" src="images/gallery6.jpg" style="width:100%" onclick="currentSlide(6)" alt="Snowy Mountains">
   </div>
 </div>
</div>

</body>
<footer>
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}

</script>
</footer>

</html>
