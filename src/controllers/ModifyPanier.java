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
@WebServlet("/ModifyPanier")
public class ModifyPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyPanier() {
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
		}else  {
			Panier addcart = (Panier) session.getAttribute("cart");


            int i=0;
            int j=0;
            Produit temp=null;
			for(Object product : addcart.getProduits()){
                if(((Produit)product).getId()==id){
                    j=i;
                    if (quantity!=0) {
                        ((Produit)product).setQuantity(quantity);
                    }else{
                        temp=((Produit)product);
                    }
                    
                }
				System.out.println(j);
                i++;
			}
            if (quantity==0) {

                addcart.removeProduit(temp);
                
                System.out.println("removed");
            }
			session.setAttribute("cart", addcart);
		}

		//rd = request.getRequestDispatcher("/WebContent/menu.jsp");
		//rd.forward(request, response);
		response.sendRedirect("/BurgerINSA/WebContent/cart.jsp");
	}

}
