package com.kh.dagym.serviceCenter.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Sreply {

	private int replyNo;
	private String content;
	private int boardNo;
	private String memberId;
	private Timestamp enrollDate;
	private String replyStatus;
	private int memberNo;
	
	public Sreply() {
		// TODO Auto-generated constructor stub
	}

	public Sreply(int replyNo, String content, int boardNo, String memberId, Timestamp enrollDate, String replyStatus,
			int memberNo) {
		super();
		this.replyNo = replyNo;
		this.content = content;
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.enrollDate = enrollDate;
		this.replyStatus = replyStatus;
		this.memberNo = memberNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Timestamp getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Sreply [replyNo=" + replyNo + ", content=" + content + ", boardNo=" + boardNo + ", memberId=" + memberId
				+ ", enrollDate=" + enrollDate + ", replyStatus=" + replyStatus + ", memberNo=" + memberNo + "]";
	}
	
	

}
