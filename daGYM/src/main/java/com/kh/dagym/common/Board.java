package com.kh.dagym.common;

import java.security.Timestamp;

public class Board {
	private int boardNo;
	private int memberNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardEnrollDt;
	private Timestamp boardModiftDt;
	private String boardStatus;
	private int qnaCode;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, int memberNo, int boardType, String boardTitle, String boardContent,
			Timestamp boardEnrollDt, Timestamp boardModiftDt, String boardStatus, int qnaCode) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardEnrollDt = boardEnrollDt;
		this.boardModiftDt = boardModiftDt;
		this.boardStatus = boardStatus;
		this.qnaCode = qnaCode;
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

	public Timestamp getBoardEnrollDt() {
		return boardEnrollDt;
	}

	public void setBoardEnrollDt(Timestamp boardEnrollDt) {
		this.boardEnrollDt = boardEnrollDt;
	}

	public Timestamp getBoardModiftDt() {
		return boardModiftDt;
	}

	public void setBoardModiftDt(Timestamp boardModiftDt) {
		this.boardModiftDt = boardModiftDt;
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

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNo=" + memberNo + ", boardType=" + boardType + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardEnrollDt=" + boardEnrollDt
				+ ", boardModiftDt=" + boardModiftDt + ", boardStatus=" + boardStatus + ", qnaCode=" + qnaCode + "]";
	}
	

}
