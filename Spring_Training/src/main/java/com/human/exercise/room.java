package com.human.exercise;

public class room {
	private int code;
	private String name;
	private String t_name;
	private int price;
	private int people;
	public room(int code, String name, String t_name, int price, int people) {
		this.code = code;
		this.name = name;
		this.t_name = t_name;
		this.price = price;
		this.people = people;
	}
	public room() {
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	
}

