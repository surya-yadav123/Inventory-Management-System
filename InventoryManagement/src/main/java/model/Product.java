package model;

import java.util.Date;

public class Product {
	    private int product_id;
	    private String name;

	    private double quantity;     
	    private String unit;         
	    private String barcode;
	    public String getBarcode() {
			return barcode;
		}
		public void setBarcode(String barcode) {
			this.barcode = barcode;
		}
		private double price;       
	    private String category;    
	    private String description;

	    private double minStockLevel;
	    private java.sql.Date date;
  
	public java.sql.Date getDate() {
	return date;
}
  public void setDate(java.sql.Date date) {
	this.date = date;
  }
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getMinStockLevel() {
		return minStockLevel;
	}
	public void setMinStockLevel(double minStockLevel) {
		this.minStockLevel = minStockLevel;
	}
    
}

