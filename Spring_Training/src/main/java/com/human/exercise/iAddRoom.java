package com.human.exercise;

import java.util.ArrayList;

public interface iAddRoom {
	ArrayList<room> getRoomList();
	void addRoom(String name, int type, int howmany, int howmuch); // dto가 필요없어서 void를 씀
	}

