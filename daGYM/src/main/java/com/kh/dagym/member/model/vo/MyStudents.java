package com.kh.dagym.member.model.vo;

public class MyStudents {
	private String studentsName;
	private String studentsPhone;
	
	 public MyStudents() {
	}

	public MyStudents(String studentsName, String studentsPhone) {
		super();
		this.studentsName = studentsName;
		this.studentsPhone = studentsPhone;
	}

	public String getStudentsName() {
		return studentsName;
	}

	public void setStudentsName(String studentsName) {
		this.studentsName = studentsName;
	}

	public String getStudentsPhone() {
		return studentsPhone;
	}

	public void setStudentsPhone(String studentsPhone) {
		this.studentsPhone = studentsPhone;
	}

	@Override
	public String toString() {
		return "MyStudents [studentsName=" + studentsName + ", studentsPhone=" + studentsPhone + "]";
	}
	
	
}
	
