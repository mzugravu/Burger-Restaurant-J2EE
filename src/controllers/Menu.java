package controllers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Menu extends HttpServlet {

    public void doGet(HttpServletRequest requete, HttpServletResponse reponse) throws ServletException, IOException {
  
      this.getServletContext().getRequestDispatcher("/WebContent/index.jsp").forward(requete, reponse);
    }
  }
  