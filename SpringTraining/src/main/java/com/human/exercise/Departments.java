package com.human.exercise;

public class Departments {
	int department_id;	
	String upperdep;
	String lowerdep;
	String manager_name;
	
	public Departments() {
	}

	public Departments(int department_id, String upperdep, String lowerdep, String manager_name) {
		this.department_id = department_id;
		this.upperdep = upperdep;
		this.lowerdep = lowerdep;
		this.manager_name = manager_name;
	}

	public int getdepartment_id() {
		return department_id;
	}

	public void setdepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getUpperdep() {
		return upperdep;
	}

	public void setUpperdep(String upperdep) {
		this.upperdep = upperdep;
	}

	public String getLowerdep() {
		return lowerdep;
	}

	public void setLowerdep(String lowerdep) {
		this.lowerdep = lowerdep;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	
	
}
