package com.kh.dagym.serviceCenter;

import java.util.Arrays;

public class Search {

	private String[] ct;
	private String skey;
	private String sVal;
	
	public Search() {
		// TODO Auto-generated constructor stub
	}

	public String[] getCt() {
		return ct;
	}

	public void setCt(String[] ct) {
		this.ct = ct;
	}

	public String getSkey() {
		return skey;
	}

	public void setSkey(String skey) {
		this.skey = skey;
	}

	public String getsVal() {
		return sVal;
	}

	public void setsVal(String sVal) {
		this.sVal = sVal;
	}

	@Override
	public String toString() {
		return "Search [ct=" + Arrays.toString(ct) + ", skey=" + skey + ", sVal=" + sVal + "]";
	}
	
	
}
