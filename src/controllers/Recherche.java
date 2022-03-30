package controllers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import dao.*;
import models.*;

import extra.DatabaseConnection;

@WebServlet({ "/Recherche" })
public class Recherche extends HttpServlet {

	private static Connection con;
	public Statement statement;
	public ArrayList<String> description = null;
	private static PreparedStatement ps;
	private static ResultSet rs;
	private static String query;

  public Recherche() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void doGet(HttpServletRequest requete, HttpServletResponse reponse) throws ServletException, IOException {

        RequestDispatcher rd;
        requete.getRequestDispatcher("/WebContent/produits_recherche.jsp").forward(requete,reponse);

    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest requete, HttpServletResponse reponse)
			throws ServletException, IOException {

        DatabaseConnection.getConnexion();
        ProduitDAOImpl userDao = new ProduitDAOImpl();
        String chaine = requete.getParameter("searchToFind");
        RequestDispatcher rd;

        PrintWriter out = reponse.getWriter();
        List<Produit> produits = userDao.getProduitsSearch(chaine);
        out.print(produits);
        requete.setAttribute("produits", produits);
				requete.getRequestDispatcher("/WebContent/produits_recherche.jsp").forward(requete,reponse);
	}

}
