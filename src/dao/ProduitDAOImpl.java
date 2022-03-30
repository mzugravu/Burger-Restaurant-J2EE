package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import extra.DatabaseConnection;

import java.util.*;

import models.*;

public class ProduitDAOImpl implements ProduitDAO {
	private static Connection con;
	private static Statement st;
	private static PreparedStatement ps;
	private static ResultSet rs;
	private static String query;

	public ProduitDAOImpl() {
		con = DatabaseConnection.getConnexion();
	}

	@Override
	public Produits getProduits() {
		try
		{
			query = "SELECT * from PRODUIT";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			Produits prods = new Produits();
			//ArrayList<Produit> prods = new ArrayList<Produit>();
			while(rs.next()){
				Produit prod = new Produit();

				prod.setId(rs.getInt(1));
				prod.setName(rs.getString(2));
				prod.setDesciption(rs.getString(3));
				prod.setPrice(rs.getFloat(4));
				prod.setImage(rs.getString(5));
				prod.setQuantity(rs.getInt(6));

				prods.addProduit(prod);
			}
			if (prods.getNbProduits()>0) {
				return prods;
			}else{return null;}

			}catch (SQLException e){
				// do something appropriate with the exception, *at least*:
				e.printStackTrace();
				return null;
			}
	}

	public Produit getProductById(int id){
		try {
			query = "SELECT * from PRODUIT where id=?";
			ps = con.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				Produit prod = new Produit();

				prod.setId(rs.getInt(1));
				prod.setName(rs.getString(2));
				prod.setDesciption(rs.getString(3));
				prod.setPrice(rs.getFloat(4));
				prod.setImage(rs.getString(5));
				prod.setQuantity(rs.getInt(6));

				return prod;
			} else {
				return null;
			}

		} catch (Exception e) {
			System.out.println("Error");
		}
		return null;
	};

	@Override
	public List<Produit> getProduitsSearch(String chaine) {
		try {
			ResultSet rs;
			ps = con.prepareStatement("Select * from PRODUIT where name like \""+chaine+"%\"");
			rs = ps.executeQuery();
			List<Produit> produitslist = new ArrayList<Produit>();
			while (rs.next()) {
				Produit produit = getProductById(rs.getInt(1));
				System.out.println(produit.getName());
				produitslist.add(produit);
			}

			return produitslist;

		} catch (Exception e) {
			System.out.println("Connection error : getCourses");
		}
		return null;
	}


}
