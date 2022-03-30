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


@WebServlet({ "/Login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public Login() {
		super();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = (String) request.getParameter("email");
		String password = (String) request.getParameter("password");

		MemberDAOImpl userDao = new MemberDAOImpl();

		Member user = new Member();
		if (userDao.verifyLogin(email, password) == 1) {
			user = userDao.getUserByEmail(email);
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("password",password);
			session.setAttribute("isConnected","true");
			response.sendRedirect("/BurgerINSA/WebContent/index.jsp");

		} else if (userDao.verifyLogin(email, password) == 0) {

			String error = Strings.ERROR_LOGIN;
			request.setAttribute("error", error);
			rd = request.getRequestDispatcher("/WebContent/login.jsp");
			rd.forward(request, response);
		} else {
			String error = Strings.ERROR_DB_PROBLEM;
			request.setAttribute("error", error);
			rd = request.getRequestDispatcher("/WebContent/login.jsp");
			rd.forward(request, response);
		}

	}

}
