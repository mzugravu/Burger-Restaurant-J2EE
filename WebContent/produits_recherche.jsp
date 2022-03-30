<%@ page import="java.util.*" %>
<%@ page import="models.Produit" %>


<% List<Produit> produits = (List<Produit>)request.getAttribute("produits");%>

 <%for(Produit p : produits){ %>
    <div>
        <a style="color:black;" href="/BurgerINSA/WebContent/menu.jsp#<%=p.getName().replace(" ","_")%>"><%= p.getName() %></a>
    </div>
<%}%>
