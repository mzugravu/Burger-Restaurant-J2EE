package models;

public class Produit {

	private String name, description, image;
	private int id, quantity;
    private Float price;


	public Produit() {
		super();
	}
    
	public Produit(int id, String name, String description, Float price, String image, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDesciption(String desc) {
		this.description = desc;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float prix) {
		this.price = prix;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String img) {
		this.image = img;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer q) {
		this.quantity = q;
	}


}
