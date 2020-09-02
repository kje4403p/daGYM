package com.kh.dagym.admin.model.vo;

import java.sql.Timestamp;

public class Board {

	private int boardNo;
	private String memberId;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardEnrollDate;
	private Timestamp boardModifyDate;
	private String boardStatus;
	private int questionCode;
	private Timestamp startDate;
	private Timestamp endDate;
	private int views;
	
	public Board() {}

	public Board(int boardNo, String memberId, int boardType, String boardTitle, String boardContent,
			Timestamp boardEnrollDate, Timestamp boardModifyDate, String boardStatus, int questionCode,
			Timestamp startDate, Timestamp endDate, int views) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardEnrollDate = boardEnrollDate;
		this.boardModifyDate = boardModifyDate;
		this.boardStatus = boardStatus;
		this.questionCode = questionCode;
		this.startDate = startDate;
		this.endDate = endDate;
		this.views = views;
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

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
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

	public Timestamp getBoardEnrollDate() {
		return boardEnrollDate;
	}

	public void setBoardEnrollDate(Timestamp boardEnrollDate) {
		this.boardEnrollDate = boardEnrollDate;
	}

	public Timestamp getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Timestamp boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getQuestionCode() {
		return questionCode;
	}

	public void setQuestionCode(int questionCode) {
		this.questionCode = questionCode;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberId=" + memberId + ", boardType=" + boardType + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardEnrollDate=" + boardEnrollDate
				+ ", boardModifyDate=" + boardModifyDate + ", boardStatus=" + boardStatus + ", questionCode="
				+ questionCode + ", startDate=" + startDate + ", endDate=" + endDate + ", views=" + views + "]";
	}
	
}
