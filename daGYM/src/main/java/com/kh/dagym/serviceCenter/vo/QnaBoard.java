package com.kh.dagym.serviceCenter.vo;

import java.sql.Date;

public class QnaBoard {
	
	private int boardNo;
	private String memberId;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private Date boardEnrollDate;
	private Date boardModifyDate;
	private String boardStatus;
	private String questionType;
	private int views;
	private int boardType;
	
	public QnaBoard() {
		// TODO Auto-generated constructor stub
	}

	public QnaBoard(int boardNo, String memberId, int memberNo, String boardTitle, String boardContent,
			Date boardEnrollDate, Date boardModifyDate, String boardStatus, String questionType, int views,
			int boardType) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.memberNo = memberNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardEnrollDate = boardEnrollDate;
		this.boardModifyDate = boardModifyDate;
		this.boardStatus = boardStatus;
		this.questionType = questionType;
		this.views = views;
		this.boardType = boardType;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardEnrollDate() {
		return boardEnrollDate;
	}

	public void setBoardEnrollDate(Date boardEnrollDate) {
		this.boardEnrollDate = boardEnrollDate;
	}

	public Date getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "QnaBoard [boardNo=" + boardNo + ", memberId=" + memberId + ", memberNo=" + memberNo + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardEnrollDate=" + boardEnrollDate
				+ ", boardModifyDate=" + boardModifyDate + ", boardStatus=" + boardStatus + ", questionType="
				+ questionType + ", views=" + views + ", boardType=" + boardType + "]";
	}
	
	
	
}
