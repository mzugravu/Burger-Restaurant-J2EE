package dao;

import java.util.*;

import models.*;

public interface ProduitDAO {

	public Produits getProduits();

	public Produit getProductById(int id);

	public List<Produit> getProduitsSearch(String chaine) ;

}
