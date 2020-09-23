package com.kh.dagym.member.model.vo;

import java.sql.Date;

public class MyReply {
	private int replyNo;
	private int rarentBoardNo;
	private String rarentBoardTitle;
	private int rerlyMemberNo;
	private String rerlyContent;
	private Date rerlyEnrollDt;
	private char replyStatus;
	private int rarentBoardType;
	
	public MyReply() {
	}

	public MyReply(int replyNo, int rarentBoardNo, String rarentBoardTitle, int rerlyMemberNo, String rerlyContent,
			Date rerlyEnrollDt, char replyStatus, int rarentBoardType) {
		super();
		this.replyNo = replyNo;
		this.rarentBoardNo = rarentBoardNo;
		this.rarentBoardTitle = rarentBoardTitle;
		this.rerlyMemberNo = rerlyMemberNo;
		this.rerlyContent = rerlyContent;
		this.rerlyEnrollDt = rerlyEnrollDt;
		this.replyStatus = replyStatus;
		this.rarentBoardType = rarentBoardType;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRarentBoardNo() {
		return rarentBoardNo;
	}

	public void setRarentBoardNo(int rarentBoardNo) {
		this.rarentBoardNo = rarentBoardNo;
	}

	public String getRarentBoardTitle() {
		return rarentBoardTitle;
	}

	public void setRarentBoardTitle(String rarentBoardTitle) {
		this.rarentBoardTitle = rarentBoardTitle;
	}

	public int getRerlyMemberNo() {
		return rerlyMemberNo;
	}

	public void setRerlyMemberNo(int rerlyMemberNo) {
		this.rerlyMemberNo = rerlyMemberNo;
	}

	public String getRerlyContent() {
		return rerlyContent;
	}

	public void setRerlyContent(String rerlyContent) {
		this.rerlyContent = rerlyContent;
	}

	public Date getRerlyEnrollDt() {
		return rerlyEnrollDt;
	}

	public void setRerlyEnrollDt(Date rerlyEnrollDt) {
		this.rerlyEnrollDt = rerlyEnrollDt;
	}

	public char getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(char replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getRarentBoardType() {
		return rarentBoardType;
	}

	public void setRarentBoardType(int rarentBoardType) {
		this.rarentBoardType = rarentBoardType;
	}

	@Override
	public String toString() {
		return "MyReply [replyNo=" + replyNo + ", rarentBoardNo=" + rarentBoardNo + ", rarentBoardTitle="
				+ rarentBoardTitle + ", rerlyMemberNo=" + rerlyMemberNo + ", rerlyContent=" + rerlyContent
				+ ", rerlyEnrollDt=" + rerlyEnrollDt + ", replyStatus=" + replyStatus + ", rarentBoardType="
				+ rarentBoardType + "]";
	}

	
	
}
