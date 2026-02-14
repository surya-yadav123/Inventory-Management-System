package model;

public class BillItem {
	private int bill_item_id;
	private int bill_id;
	private int product_id;
	private int quantity;
	private float price;
	public int getBill_item_id() {
		return bill_item_id;
	}
	public void setBill_item_id(int bill_item_id) {
		this.bill_item_id = bill_item_id;
	}
	public int getBill_id() {
		return bill_id;
	}
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
}
