package com.human.exam;

public class Member {
	
	String userid;
	String passcode;
	public Member(String userid, String passcode) {
		this.userid = userid;
		this.passcode = passcode;
	}
	public Member() {
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	
}
