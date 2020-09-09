package com.kh.dagym.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MyBoard {
	private int boardNo;
	private String boardWriter;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardEnrollDate;
	private Timestamp boardModiftDate;
	private String boardStatus;
	private int qnaCode;
	private Date startDate;
	private Date endDate;
	private int views;
	
	public MyBoard() {
		// TODO Auto-generated constructor stub
	}

	public MyBoard(int boardNo, String boardWriter, int boardType, String boardTitle, String boardContent,
			Timestamp boardEnrollDate, Timestamp boardModiftDate, String boardStatus, int qnaCode, Date startDate,
			Date endDate, int views) {
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
	}



	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberNo() {
		return boardWriter;
	}

	public void setMemberNo(String boardWriter) {
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

	public Timestamp getBoardEnrollDate() {
		return boardEnrollDate;
	}

	public void setBoardEnrollDate(Timestamp boardEnrollDate) {
		this.boardEnrollDate = boardEnrollDate;
	}

	public Timestamp getBoardModiftDate() {
		return boardModiftDate;
	}

	public void setBoardModiftDate(Timestamp boardModiftDate) {
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
	
	

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNo=" + boardWriter + ", boardType=" + boardType + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardEnrollDate=" + boardEnrollDate
				+ ", boardModiftDate=" + boardModiftDate + ", boardStatus=" + boardStatus + ", qnaCode=" + qnaCode
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", views=" + views + "]";
	}
}
