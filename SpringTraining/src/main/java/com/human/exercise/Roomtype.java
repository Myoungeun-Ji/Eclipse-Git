package com.human.exercise;

public class Roomtype {
	private int typecode;
	private String typename;
	
	public Roomtype() {
	}
	
	public Roomtype(int typecode, String typename) {
		this.typecode = typecode;
		this.typename = typename;
	}
	
	public int getTypecode() {
		return typecode;
	}
	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	public String getName() {
		return typename;
	}
	public void setName(String typename) {
		this.typename = typename;
	}
	
}
