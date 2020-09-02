package com.kh.dagym.common;

import java.security.Timestamp;

public class Board {
	private int boardNo;
	private int memberNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardEnrollDate;
	private Timestamp boardModiftDate;
	private String boardStatus;
	private int qnaCode;
	private Timestamp startDate;
	private Timestamp endDate;
	private int views;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, int memberNo, int boardType, String boardTitle, String boardContent,
			Timestamp boardEnrollDate, Timestamp boardModiftDate, String boardStatus, int qnaCode, Timestamp startDate,
			Timestamp endDate, int views) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
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
		return "Board [boardNo=" + boardNo + ", memberNo=" + memberNo + ", boardType=" + boardType + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardEnrollDate=" + boardEnrollDate
				+ ", boardModiftDate=" + boardModiftDate + ", boardStatus=" + boardStatus + ", qnaCode=" + qnaCode
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", views=" + views + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((boardContent == null) ? 0 : boardContent.hashCode());
		result = prime * result + ((boardEnrollDate == null) ? 0 : boardEnrollDate.hashCode());
		result = prime * result + ((boardModiftDate == null) ? 0 : boardModiftDate.hashCode());
		result = prime * result + boardNo;
		result = prime * result + ((boardStatus == null) ? 0 : boardStatus.hashCode());
		result = prime * result + ((boardTitle == null) ? 0 : boardTitle.hashCode());
		result = prime * result + boardType;
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + memberNo;
		result = prime * result + qnaCode;
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + views;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Board other = (Board) obj;
		if (boardContent == null) {
			if (other.boardContent != null)
				return false;
		} else if (!boardContent.equals(other.boardContent))
			return false;
		if (boardEnrollDate == null) {
			if (other.boardEnrollDate != null)
				return false;
		} else if (!boardEnrollDate.equals(other.boardEnrollDate))
			return false;
		if (boardModiftDate == null) {
			if (other.boardModiftDate != null)
				return false;
		} else if (!boardModiftDate.equals(other.boardModiftDate))
			return false;
		if (boardNo != other.boardNo)
			return false;
		if (boardStatus == null) {
			if (other.boardStatus != null)
				return false;
		} else if (!boardStatus.equals(other.boardStatus))
			return false;
		if (boardTitle == null) {
			if (other.boardTitle != null)
				return false;
		} else if (!boardTitle.equals(other.boardTitle))
			return false;
		if (boardType != other.boardType)
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (memberNo != other.memberNo)
			return false;
		if (qnaCode != other.qnaCode)
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (views != other.views)
			return false;
		return true;
	}
	
	


	

}
