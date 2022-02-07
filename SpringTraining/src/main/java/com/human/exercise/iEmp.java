package com.human.exercise;

import java.util.ArrayList;

public interface iEmp {
	ArrayList<Employee> getEmpList();
	ArrayList<Countries> getCountryList();
	ArrayList<Departments> getDepList();
	ArrayList<Room> getRoomList();
	ArrayList<Menu> getMenuList();
	ArrayList<Roomtype> getRoomType();
	
	void addMenu(String menu_name, int price); // 타입과 순서는 꼭 일치해야하지만 이름은 아무거나 상관 없음
	void addRoom(String name, int type, int howmany, int howmuch); //insert는 DTO가 필요없어서 interface에 리턴값 없는 void로 선언
	void addType(int typecode, String typename);
	void deleteMenu(int code);
	void deleteRoom(int roomcode);
	void updateMenu(int code, String name, int price);
	void updateRoom(int roomcode, String name, int type, int howmany, int howmuch);
}
