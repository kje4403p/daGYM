package com.kh.dagym.admin.model.vo;

import java.security.Timestamp;

public class Reply {
	private int replyNo;
	private int parentBoardNo;
	private int memberNo;
	private String replyContent;
	private Timestamp replyEnrollDate;
	private String replyStatus;
	
	public Reply() {}

	public Reply(int replyNo, int parentBoardNo, int memberNo, String replyContent, Timestamp replyEnrollDate,
			String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.parentBoardNo = parentBoardNo;
		this.memberNo = memberNo;
		this.replyContent = replyContent;
		this.replyEnrollDate = replyEnrollDate;
		this.replyStatus = replyStatus;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getParentBoardNo() {
		return parentBoardNo;
	}

	public void setParentBoardNo(int parentBoardNo) {
		this.parentBoardNo = parentBoardNo;
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

	public Timestamp getReplyEnrollDate() {
		return replyEnrollDate;
	}

	public void setReplyEnrollDate(Timestamp replyEnrollDate) {
		this.replyEnrollDate = replyEnrollDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", parentBoardNo=" + parentBoardNo + ", memberNo=" + memberNo
				+ ", replyContent=" + replyContent + ", replyEnrollDate=" + replyEnrollDate + ", replyStatus="
				+ replyStatus + "]";
	}
	
}
