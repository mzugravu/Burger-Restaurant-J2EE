<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<style media="screen">
/* The dropdown container */
.dropdown {
float: left;
overflow: hidden;
}

/* Dropdown button */
.dropdown .dropbtn {
font-size: 16px;
border: none;
outline: none;
color: white;
padding: 14px 16px;
background-color: inherit;
font-family: inherit; /* Important for vertical align on mobile phones */
margin: 0; /* Important for vertical align on mobile phones */
}


/* Dropdown content (hidden by default) */
.dropdown-content {
display: none;
position: absolute;
background-color: #f9f9f9;
min-width: 160px;
box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
float: none;
color: black;
padding: 12px 16px;
text-decoration: none;
display: block;
text-align: left;
}

/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
display: block;
}
</style>
  <div class="navbar">
        <div class="logo">
            <img src="/BurgerINSA/WebContent/images/logo.png" alt="Logo Image">
        </div>
        <ul class="nav-links">
            <li><a href="/BurgerINSA/WebContent/index.jsp">Home</a></li>
            <li><a href="/BurgerINSA/WebContent/about.jsp">About</a></li>
            <li><a href="/BurgerINSA/WebContent/menu.jsp">Menu</a></li>
            <li><a href="/BurgerINSA/WebContent/gallery.jsp">Gallery</a></li>
            <li><a href="/BurgerINSA/WebContent/contact.jsp">Contact</a></li>
            <div class="dropdown">
              <button class="dropbtn">CUSTOMER
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                <a href="/BurgerINSA/WebContent/register.jsp">Register</a>
                <a href="/BurgerINSA/WebContent/login.jsp">Login</a>
                <a href="/BurgerINSA/WebContent/account.jsp">Profile</a>
              </div>
            </div>
            <form>
					    <input type="text" id="search" placeholder="Search something" onkeyup="searchProducts()" size="15" style="color:black;">
				    </form>
				    <div id="searchProduits" style="background-color: white;">

				    </div>
            <li><a href="/BurgerINSA/WebContent/cart.jsp"><i class="fa fa-fw fa-shopping-cart"></i></a></li>
        </ul>
    </div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script>
	function searchProducts() {
		var search = document.getElementById('search').value;
		var parametre = {
			searchToFind : search,
		};

		$.ajax({
		type: 'POST',
		url: '/BurgerINSA/Recherche',
		data: parametre,
		success: function(received) {
			console.log(search.length);
			if(search.length == 0) {
				document.getElementById("searchProduits").hidden = true;
			}
			else {
				document.getElementById("searchProduits").hidden = false;
			}
			document.getElementById("searchProduits").innerHTML = received;
		},
		error: function () {
			alert('AJAX problem');
		}
		});
	}
	</script>
