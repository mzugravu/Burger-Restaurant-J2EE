package controllers;

import java.io.IOException;
import dao.MemberDAOImpl;
import extra.DatabaseConnection;
import models.Member;

import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import extra.Strings;


@WebServlet({ "/Edit" })
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public Edit() {
		super();

	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DatabaseConnection.getConnexion();
		RequestDispatcher rd;
		HttpSession session = request.getSession();

		Member user = (Member) session.getAttribute("email");
		if (user == null) {
			rd = request.getRequestDispatcher("/BurgerINSA/WebContent/login.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("/BurgerINSA/WebContent/index.jsp");
		}

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		RequestDispatcher rd;
		PrintWriter out = response.getWriter();
		String fullnameSession = (String) session.getAttribute("fullname");
		System.out.println(fullnameSession);
		response.setContentType("text/html");
		String mail = (String) request.getParameter("email");
		String phone = (String) request.getParameter("phone");
		String address = (String) request.getParameter("address");

		MemberDAOImpl userDao = new MemberDAOImpl();
		int feedbackUpdate = userDao.updateUser(fullnameSession,mail,phone,address);
		System.out.println(feedbackUpdate);
		session.setAttribute("email", mail);
		rd = request.getRequestDispatcher("WebContent/account.jsp");
		rd.forward(request, response);
	}

}
