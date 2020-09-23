package com.kh.dagym.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MyBoard {
	private int boardNo;
	private int boardWriter;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Date boardEnrollDate;
	private Date boardModiftDate;
	private String boardStatus;
	private int qnaCode;
	private Date startDate;
	private Date endDate;
	private int views;
	private String boardCategory;
	
	public MyBoard() {
	}

	public MyBoard(int boardNo, int boardWriter, int boardType, String boardTitle, String boardContent,
			Date boardEnrollDate, Date boardModiftDate, String boardStatus, int qnaCode, Date startDate, Date endDate,
			int views, String boardCategory) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardEnrollDate = boardEnrollDate;
		this.boardModiftDate = boardModiftDate;
		this.boardStatus = boardStatus;
		this.qnaCode = qnaCode;
		this.startDate = startDate;
		this.endDate = endDate;
		this.views = views;
		this.boardCategory = boardCategory;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(int boardWriter) {
		this.boardWriter = boardWriter;
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

	public Date getBoardModiftDate() {
		return boardModiftDate;
	}

	public void setBoardModiftDate(Date boardModiftDate) {
		this.boardModiftDate = boardModiftDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
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

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	@Override
	public String toString() {
		return "MyBoard [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardType=" + boardType
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardEnrollDate="
				+ boardEnrollDate + ", boardModiftDate=" + boardModiftDate + ", boardStatus=" + boardStatus
				+ ", qnaCode=" + qnaCode + ", startDate=" + startDate + ", endDate=" + endDate + ", views=" + views
				+ ", boardCategory=" + boardCategory + "]";
	}
	
	
	
	
	
}
