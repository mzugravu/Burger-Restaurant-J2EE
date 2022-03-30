package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAOImpl;
import extra.Strings;
import models.Member;


@WebServlet({ "/Register" })
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Register() {
		super();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAOImpl userDao = new MemberDAOImpl();
		RequestDispatcher rd;

		String email = (String) request.getParameter("email");
		String password1 = (String) request.getParameter("password");
		String password2 = (String) request.getParameter("password-repeat");
		String fullName = (String) request.getParameter("uname");
		String phone = (String) request.getParameter("phone");

		Member user = new Member();

		if (userDao.EmailExist(email) == 0) {
			user.setEmail(email);
			user.setPassword(password1);
			user.setFullname(fullName);
			user.setRole("client");
			user.setPhone(phone);
			userDao.addUser(user);

			response.sendRedirect("/BurgerINSA/WebContent/login.jsp");
			//rd = request.getRequestDispatcher("/WebContent/login.jsp");
			//rd.forward(request, response);
		} else if (userDao.EmailExist(email) == 1) {
			String error = Strings.ERROR_EMAIL_EXIST;
			request.setAttribute("error", error);
			rd = request.getRequestDispatcher("/WebContent/register.jsp");
			rd.forward(request, response);

		} else {
			request.setAttribute("error", "Connexion Error");
			rd = request.getRequestDispatcher("/WebContent/register.jsp");
			rd.forward(request, response);
		}

	}

}
