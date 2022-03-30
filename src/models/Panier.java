package models;

import java.beans.*;
import java.util.*;
import java.io.*;

public class Panier implements Serializable {

  private Vector produits;

  public Panier() { produits= new Vector();}

  

  public void addProduit(Produit produit) {
    produits.add(produit);
    
  }

  public void removeProduit(Produit produit) {
    produits.remove(produit);
  }

  public Vector getProduits() {
    return produits;
  }

  public int getNbProduits() {
    return produits.size();
  }

  
}
