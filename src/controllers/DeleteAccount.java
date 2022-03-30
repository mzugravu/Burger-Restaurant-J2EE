package controllers;

import java.io.IOException;
import dao.MemberDAOImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public DeleteAccount() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mail = (String)session.getAttribute("email");
		MemberDAOImpl userDao = new MemberDAOImpl();
		userDao.deleteAccount(mail);
		response.sendRedirect("/BurgerINSA/WebContent/index.jsp");

	}

}
