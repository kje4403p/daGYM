package com.kh.dagym.serviceCenter.vo;

import java.util.Arrays;

public class Search {

	private String[] ct;
	private String sKey;
	private String sVal;
	private String memberId;
	
	public Search() {
		// TODO Auto-generated constructor stub
	}

	public String[] getCt() {
		return ct;
	}

	public void setCt(String[] ct) {
		this.ct = ct;
	}

	public String getsKey() {
		return sKey;
	}

	public void setsKey(String sKey) {
		this.sKey = sKey;
	}

	public String getsVal() {
		return sVal;
	}

	public void setsVal(String sVal) {
		this.sVal = sVal;
	}
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Search [ct=" + Arrays.toString(ct) + ", sKey=" + sKey + ", sVal=" + sVal + ", memberId=" + memberId
				+ "]";
	}

	

	

	
	
	
}
