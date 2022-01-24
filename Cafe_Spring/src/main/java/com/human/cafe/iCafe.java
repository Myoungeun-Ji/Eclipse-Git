package com.human.cafe;

import java.util.ArrayList;

public interface iCafe { // 인터페이스 메소드 선언
   ArrayList<Menu> getMenuList();
   void insertMenu(String name,int price);
   void updateMenu(int code, String name, int price);
   void deleteMenu(int code);
   void insertSales(int menu_code,int qty, int price, String mobile);
   ArrayList<Cafe_sales> getSales();	//여러개를 리턴할때는 어레이리스트
   ArrayList<Sales> salesMenu();
   ArrayList<Sales> salesMobile();
}