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


@WebServlet({ "/ChangePassword" })
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ChangePassword() {
		super();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String mail = (String) request.getParameter("email");
		String password1 = (String) request.getParameter("password1");

		MemberDAOImpl userDao = new MemberDAOImpl();
		userDao.changePassword(mail,password1);
		response.sendRedirect("/BurgerINSA/WebContent/login.jsp");


	}

}
