package models;

import java.beans.*;
import java.util.*;
import java.io.*;

public class Produits implements Serializable {

  private Vector produits;

  public Produits() { produits= new Vector();}

  

  public void addProduit(Produit produit) {
    produits.add(produit);
  }

  public Vector getProduits() {
    return produits;
  }

  public int getNbProduits() {
    return produits.size();
  }

  
}
