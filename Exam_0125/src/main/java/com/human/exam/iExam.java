package com.human.exam;

import java.util.ArrayList;

import com.human.exam.Member;

public interface iExam {
	void DoSignon(String name,String gender,String userid, String passcode, String interest);
	void Signon_check(String userid, String passcode);
	void update(String userid);
	void update1(String userid);
	ArrayList<Member> Signon_check();
}
