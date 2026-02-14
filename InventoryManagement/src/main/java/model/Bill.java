package model;

import java.sql.Date;

public class Bill {
 private int bill_id;
 private Date bill_date;
 private float total_amount;
 private String payment_method;
 private  int staff_id;
 public int getBill_id() {
	return bill_id;
 }
 public void setBill_id(int bill_id) {
	this.bill_id = bill_id;
 }
 public Date getBill_date() {
	return bill_date;
 }
 public void setBill_date(Date date) {
	this.bill_date = date;
 }

 public float getTotal_amount() {
	return total_amount;
 }
 public void setTotal_amount(float total_amount) {
	this.total_amount = total_amount;
 }
 public String getPayment_method() {
	return payment_method;
 }
 public void setPayment_method(String payment_method) {
	this.payment_method = payment_method;
 }
 public int getStaff_id() {
	return staff_id;
 }
 public void setStaff_id(int staff_id) {
	this.staff_id = staff_id;
 }

 
}
