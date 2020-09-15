package com.kh.dagym.admin.model.vo;

import java.sql.Date;

public class Trainer {
	private int trainerNo;
	private int memberNo;
	private String trainerId;
	private String trainerPwd;
	private String trainerName;
	private String trainerPhone;
	private String trainerEmail;
	private Date trainerEnrollDate;
	private String trianerStatus;
	private String trainerGrade;
	private String trainerCareer;
	private int trainerMemberCount;
	private int trainerPrice;
	private String trainerSNS;
	private String trainerComment;
	private String trainerAward;
	
	public Trainer() {}

	public Trainer(int trainerNo, int memberNo, String trainerId, String trainerPwd, String trainerName,
			String trainerPhone, String trainerEmail, Date trainerEnrollDate, String trianerStatus, String trainerGrade,
			String trainerCareer, int trainerMemberCount, int trainerPrice, String trainerSNS, String trainerComment,
			String trainerAward) {
		super();
		this.trainerNo = trainerNo;
		this.memberNo = memberNo;
		this.trainerId = trainerId;
		this.trainerPwd = trainerPwd;
		this.trainerName = trainerName;
		this.trainerPhone = trainerPhone;
		this.trainerEmail = trainerEmail;
		this.trainerEnrollDate = trainerEnrollDate;
		this.trianerStatus = trianerStatus;
		this.trainerGrade = trainerGrade;
		this.trainerCareer = trainerCareer;
		this.trainerMemberCount = trainerMemberCount;
		this.trainerPrice = trainerPrice;
		this.trainerSNS = trainerSNS;
		this.trainerComment = trainerComment;
		this.trainerAward = trainerAward;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	public String getTrainerPwd() {
		return trainerPwd;
	}

	public void setTrainerPwd(String trainerPwd) {
		this.trainerPwd = trainerPwd;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public String getTrainerPhone() {
		return trainerPhone;
	}

	public void setTrainerPhone(String trainerPhone) {
		this.trainerPhone = trainerPhone;
	}

	public String getTrainerEmail() {
		return trainerEmail;
	}

	public void setTrainerEmail(String trainerEmail) {
		this.trainerEmail = trainerEmail;
	}

	public Date getTrainerEnrollDate() {
		return trainerEnrollDate;
	}

	public void setTrainerEnrollDate(Date trainerEnrollDate) {
		this.trainerEnrollDate = trainerEnrollDate;
	}

	public String getTrianerStatus() {
		return trianerStatus;
	}

	public void setTrianerStatus(String trianerStatus) {
		this.trianerStatus = trianerStatus;
	}

	public String getTrainerGrade() {
		return trainerGrade;
	}

	public void setTrainerGrade(String trainerGrade) {
		this.trainerGrade = trainerGrade;
	}

	public String getTrainerCareer() {
		return trainerCareer;
	}

	public void setTrainerCareer(String trainerCareer) {
		this.trainerCareer = trainerCareer;
	}

	public int getTrainerMemberCount() {
		return trainerMemberCount;
	}

	public void setTrainerMemberCount(int trainerMemberCount) {
		this.trainerMemberCount = trainerMemberCount;
	}

	public int getTrainerPrice() {
		return trainerPrice;
	}

	public void setTrainerPrice(int trainerPrice) {
		this.trainerPrice = trainerPrice;
	}

	public String getTrainerSNS() {
		return trainerSNS;
	}

	public void setTrainerSNS(String trainerSNS) {
		this.trainerSNS = trainerSNS;
	}

	public String getTrainerComment() {
		return trainerComment;
	}

	public void setTrainerComment(String trainerComment) {
		this.trainerComment = trainerComment;
	}

	public String getTrainerAward() {
		return trainerAward;
	}

	public void setTrainerAward(String trainerAward) {
		this.trainerAward = trainerAward;
	}

	@Override
	public String toString() {
		return "Trainer [trainerNo=" + trainerNo + ", memberNo=" + memberNo + ", trainerId=" + trainerId
				+ ", trainerPwd=" + trainerPwd + ", trainerName=" + trainerName + ", trainerPhone=" + trainerPhone
				+ ", trainerEmail=" + trainerEmail + ", trainerEnrollDate=" + trainerEnrollDate + ", trianerStatus="
				+ trianerStatus + ", trainerGrade=" + trainerGrade + ", trainerCareer=" + trainerCareer
				+ ", trainerMemberCount=" + trainerMemberCount + ", trainerPrice=" + trainerPrice + ", trainerSNS="
				+ trainerSNS + ", trainerComment=" + trainerComment + ", trainerAward=" + trainerAward + "]";
	}

}
