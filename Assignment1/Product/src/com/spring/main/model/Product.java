package com.spring.main.model;

import org.springframework.stereotype.Component;

@Component
public class Product {
	private int id;
	private String name;
	private double price;
	private String describ; 
	private String category;
	public Product(int id, String name, double price, String describ, String category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.describ = describ;
		this.category = category;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescrib() {
		return describ;
	}
	public void setDescrib(String describ) {
		this.describ = describ;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return " ID:" + id + " |_| " + name + " |_| " + price + " |_| " + describ + " |_| "+ category + " |_| ";
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	}