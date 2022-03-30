package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import extra.Strings;

import models.*;


/**
 * Servlet implementation class Cart
 */
@WebServlet("/cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd;
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");

        if (user == null) {
			System.out.println("user null");
			response.sendRedirect("/BurgerINSA/WebContent/login.jsp");
		}else if (session.getAttribute("cart") == null) {
            response.sendRedirect("/BurgerINSA/WebContent/menu.jsp");
		} else {
            response.sendRedirect("/BurgerINSA/WebContent/cart.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
