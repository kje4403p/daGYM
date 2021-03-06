package com.kh.dagym.common;

import java.sql.Timestamp;


public class Reply {
	private int replyNo;
	private int boardNo;
	private int memberNo;
	private String replyContent;
	private Timestamp replyEnrollDt;
	private String replyStatus;
	private String memberId;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int replyNo, int boardNo, int memberNo, String replyContent, Timestamp replyEnrollDt,
			String replyStatus, String memberId) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.replyContent = replyContent;
		this.replyEnrollDt = replyEnrollDt;
		this.replyStatus = replyStatus;
		this.memberId = memberId;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyEnrollDt() {
		return replyEnrollDt;
	}

	public void setReplyEnrollDt(Timestamp replyEnrollDt) {
		this.replyEnrollDt = replyEnrollDt;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", memberNo=" + memberNo + ", replyContent="
				+ replyContent + ", replyEnrollDt=" + replyEnrollDt + ", replyStatus=" + replyStatus + "]";
	}
	
	

}
