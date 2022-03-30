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


</style>
<% MemberDAOImpl user = new MemberDAOImpl();
String mail = (String)session.getAttribute("email");
String role = user.getRole(mail);
System.out.println(role);
%>


    <div class="menu">
        <%
          for(Object prod : produitsList.getProduits().getProduits()) {
        %>
        <div class="row">
            <div class="col-md-4">
                <h3 class="nameProduct" contenteditable="false" id="<%= ((Produit)prod).getName().replace(" ", "_")%>"><%= ((Produit)prod).getName()%></h3>
                <hr>
                <div class="col-md-8 text-right">
                  <img class="image" src="images/<%= ((Produit)prod).getImage() %>" alt="" width="20%">
                </div>
                <h4 contenteditable="false" class="price"> Price: <%= ((Produit)prod).getPrice()%></h4>
                <p contenteditable="false" class="description"> Ingredients: <%= ((Produit)prod).getDescription() %></p>
                <br>
                  <form action="/BurgerINSA/AddPanier" method="post">
                    <input type="hidden" name="id" value="<%= ((Produit)prod).getId() %>">
                    <ul class="prosuct-qty">
                      <span class="quantity">Quantity :</span>
                      <select name="Quantity" class="selectQuantity">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                      </select>
                    </ul>
                    <input type="submit" value="Add to cart"  class="button"/>
                    <input type="button" id="buttonEdit" value="Edit" class="buttonEdit" onclick="editContent()"/>
                    <form action="" method="post">
                      <input type="button" value="Save"  class="buttonSave" onClick="saveContent()"/>
                    </form>


                    <script type="text/javascript">
                      window.onload = function () {
                        role = "<%=role%>";
                        //alert(role);
                        for (el of document.getElementsByClassName("buttonEdit")){
                          if (role=="admin"){
                            console.log("admin");
                            el.style.display = "block";
                          }else{
                            console.log(role);
                            el.style.display = "none";
                          }
                        }
                        for (el of document.getElementsByClassName("buttonSave")){
                          if (role=="admin"){
                            console.log("admin");
                            el.style.display = "block";
                          }else{
                            console.log(role);
                            el.style.display = "none";
                          }
                        }
                      }
                    </script>
                    <script type="text/javascript">
                     function editContent() {
                       for (el of document.getElementsByClassName("nameProduct")){
                         el.contentEditable="true";
                       }
                       for (el of document.getElementsByClassName("price")){
                         el.contentEditable="true";
                       }
                       for (el of document.getElementsByClassName("description")){
                         el.contentEditable="true";
                       }

                        }
                    </script>
                    <script type="text/javascript">
                     function saveContent() {
                       for (el of document.getElementsByClassName("nameProduct")){
                         el.contentEditable="false";
                       }
                       for (el of document.getElementsByClassName("price")){
                         el.contentEditable="false";
                       }
                       for (el of document.getElementsByClassName("description")){
                         el.contentEditable="false";
                       }
                        }
                    </script>
                  </form>
            </div>
        </div>
        <%
              }

            %>
    </div>

  </body>
</html>
