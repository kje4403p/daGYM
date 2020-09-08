package com.kh.dagym.admin.model.vo;

import java.sql.Date;
import java.sql.Date;

public class Board {

	private int boardNo;
	private String memberId;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Date boardEnrollDate;
	private Date boardModifyDate;
	private String boardStatus;
	private String questionType;
	private Date startDate;
	private Date endDate;
	private int views;
	
	public Board() {}

	public Board(int boardNo, String memberId, int boardType, String boardTitle, String boardContent,
			Date boardEnrollDate, Date boardModifyDate, String boardStatus, String questionType,
			Date startDate, Date endDate, int views) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardEnrollDate = boardEnrollDate;
		this.boardModifyDate = boardModifyDate;
		this.boardStatus = boardStatus;
		this.questionType = questionType;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
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
				+ ", boardModifyDate=" + boardModifyDate + ", boardStatus=" + boardStatus + ", questionType="
				+ questionType + ", startDate=" + startDate + ", endDate=" + endDate + ", views=" + views + "]";
	}

}
