package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProduitDAOImpl;
import models.*;

/**
 * Servlet implementation class addcart
 */
@WebServlet("/AddPanier")
public class AddPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPanier() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer quantity = Integer.parseInt(request.getParameter("Quantity"));
		ProduitDAOImpl produitDao = new ProduitDAOImpl();
		Produit produit = produitDao.getProductById(id);

		String user = (String) session.getAttribute("email");
		if (user == null) {
			System.out.println("user null");
			response.sendRedirect("/BurgerINSA/WebContent/login.jsp");
		}else if (session.getAttribute("cart") == null) {
			//System.out.println((String)produit.getName());
			Panier addcart = new Panier();

			produit.setQuantity(quantity);
			addcart.addProduit(produit);

			session.setAttribute("cart", addcart);

			//System.out.println("Voilà" +session.getAttribute("cart"));
			for(Object product : addcart.getProduits()){
				System.out.println(((Produit)product).getName());
			}
			/* List<Produit> produitlist = addcart.getProductList(); */

		} else {
			Panier addcart = (Panier) session.getAttribute("cart");
			produit.setQuantity(quantity);


			addcart.addProduit(produit);
			for(Object product : addcart.getProduits()){
				System.out.println(((Produit)product).getName()+" "+((Produit)product).getQuantity());
			}
			session.setAttribute("cart", addcart);
		}

		//rd = request.getRequestDispatcher("/WebContent/menu.jsp");
		//rd.forward(request, response);
		response.sendRedirect("/BurgerINSA/WebContent/menu.jsp");
	}

}
