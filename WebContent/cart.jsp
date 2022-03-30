<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="libServices.*" %>
<%@ page import="java.util.List" %>
<%@ page import="models.*" %>
<%@ page import="dao.MemberDAOImpl" %>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
 <head>
    <link href="css/style.css"  rel="stylesheet" type="text/css"  />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" type="text/javascript"></script>
    <title>BurgerINSA</title>
  </head>
  <header>
    <jsp:include page="header.jsp"></jsp:include>
  </header>
  <body>
      <jsp:useBean id="produit" class="models.Produit" scope="page">
      </jsp:useBean>
      <jsp:useBean id="produits" class="models.Produits" scope="page">
      </jsp:useBean>
    <jsp:useBean id="produitsList" class="dao.ProduitDAOImpl" scope="page">
    </jsp:useBean>
<style media="screen">

.price {
  color: black;
}

.quantity {
  color: black;
}
.menu {
  padding-top: 100px;
}
.selectQuantity{
  background-color: #04AA6D;
  color: white;
}

.image{
  float: left;
  height: 200px;
  width: 250px;
}

.button{
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  text-align: center;
  display: block;
  float: right;
  margin-left: 5px;
  margin-right: 5px;
}

.button:hover {
  background-color: red;
  color: white;
}
.buttonEdit{
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  text-align: center;
  display: none;
  float: right;
  margin-left: 5px;
  margin-right: 5px;
}

.buttonSave{
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  text-align: center;
  display: none;
  float: right;
  margin-left: 5px;
  margin-right: 5px;
}

.buttonSave:hover {
  background-color: red;
  color: white;
}
.buttonEdit:hover {
  background-color: red;
  color: white;
}
.box{
    width: 100%;
    text-align:center;
}
.search {
  color: black;
}
.vide {
  position: absolute;
  top: 50%;
  left: 50%;
  /* bring your own prefixes */
  transform: translate(-50%, -50%);
  color: black;
}

.vide .btn {
  position: relative;
  top: 50%;
  left: 50%;
  text-align: center;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  background-color: rgb(245, 57, 0);
  color: black;
  font-size: 15px;
  padding: 10px 10px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  display: inline-block;
}


</style>
<% 
Panier cart = (Panier)session.getAttribute("cart");
if (cart == null){
%>
<div class="vide">
  <form action="/BurgerINSA/WebContent/menu.jsp" >
    <button class="btn">Your cart is empty. Click here for the menu.</button>
 </form>

</div>
<%
}else{
%>


    <div class="menu">
        <%
        float total=0;
          for(Object prod : cart.getProduits()) {
            //if(((Produit)prod).getQuantity()>0){
        %>
        <div class="row">
            <div class="col-md-4">
                <h3 class="nameProduct" contenteditable="false" id="<%= ((Produit)prod).getName().replace(" ", "_")%>"><%= ((Produit)prod).getName()%></h3>
                <hr>
                <div class="col-md-8 text-right">
                  <img class="image" src="images/<%= ((Produit)prod).getImage() %>" alt="" width="20%">
                </div>
                <h4 contenteditable="false" class="price"> Price: <%= ((Produit)prod).getPrice()*((Produit)prod).getQuantity()%></h4>
                <h4 contenteditable="false" class="price"> Quantity: <%= ((Produit)prod).getQuantity()%></h4>
                <% total+=((Produit)prod).getPrice()*((Produit)prod).getQuantity();%>
                <br>
                <form action="/BurgerINSA/ModifyPanier" method="post">
                  <input type="hidden" name="id" value="<%= ((Produit)prod).getId() %>">
                  <ul class="prosuct-qty">
                    <span class="quantity">Quantity :</span>
                    <select name="Quantity" class="selectQuantity">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                    </select>
                  </ul>
                  <input type="submit" value="Update order"  class="button"/>
                </form>
            </div>
        </div>
        <%
             // }
            }
            %>
            <h4 contenteditable="false" class="price"> Total: <%= total%></h4>
    </div>

    <button onclick="verif()" class="button">Pay</button>
        <script type="text/javascript">
          function verif(){
            swal({
              title: "Payment done!",
              text: "Thank you for your order!",
              icon: "success",
              button: "Close!",
              timer: 3000,
            });
          }
        </script>


  </body>
  <%
}
%>
</html>