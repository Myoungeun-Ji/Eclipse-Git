package com.human.exercise;

public class Room {
	
	int roomcode;
	String name;
	int type;
	int howmany;
	int howmuch;
	int typecode;
	String typename;
	
	public Room() {
	}
	public Room(int roomcode, String name, int type, int howmany, int howmuch, int typecode, String typename) {
		this.roomcode = roomcode;
		this.name = name;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.typecode = typecode;
		this.typename = typename;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public int getTypecode() {
		return typecode;
	}
	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
}
