package com.kh.dagym.trainer.model.vo;

import java.sql.Date;

public class Trainer {
	private int trainerNo;
	private String trainerId;
	private String trainerPwd;
	private String trainerName;
	private String trainerGender;
	private String trainerPhone;
	private int trainerCareer;
	private int trainerMcnt;
	private Date trainerEnrollDate;
	private String trianerStatus;
	private int trainerPrice;
	
	public Trainer() {
		// TODO Auto-generated constructor stub
	}

	public Trainer(int trainerNo, String trainerId, String trainerPwd, String trainerName, String trainerGender,
			String trainerPhone, int trainerCareer, int trainerMcnt, Date trainerEnrollDate, String trianerStatus,
			int trainerPrice) {
		super();
		this.trainerNo = trainerNo;
		this.trainerId = trainerId;
		this.trainerPwd = trainerPwd;
		this.trainerName = trainerName;
		this.trainerGender = trainerGender;
		this.trainerPhone = trainerPhone;
		this.trainerCareer = trainerCareer;
		this.trainerMcnt = trainerMcnt;
		this.trainerEnrollDate = trainerEnrollDate;
		this.trianerStatus = trianerStatus;
		this.trainerPrice = trainerPrice;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
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

	public String getTrainerGender() {
		return trainerGender;
	}

	public void setTrainerGender(String trainerGender) {
		this.trainerGender = trainerGender;
	}

	public String getTrainerPhone() {
		return trainerPhone;
	}

	public void setTrainerPhone(String trainerPhone) {
		this.trainerPhone = trainerPhone;
	}

	public int getTrainerCareer() {
		return trainerCareer;
	}

	public void setTrainerCareer(int trainerCareer) {
		this.trainerCareer = trainerCareer;
	}

	public int getTrainerMcnt() {
		return trainerMcnt;
	}

	public void setTrainerMcnt(int trainerMcnt) {
		this.trainerMcnt = trainerMcnt;
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

	public int getTrainerPrice() {
		return trainerPrice;
	}

	public void setTrainerPrice(int trainerPrice) {
		this.trainerPrice = trainerPrice;
	}

	@Override
	public String toString() {
		return "Trainer [trainerNo=" + trainerNo + ", trainerId=" + trainerId + ", trainerPwd=" + trainerPwd
				+ ", trainerName=" + trainerName + ", trainerGender=" + trainerGender + ", trainerPhone=" + trainerPhone
				+ ", trainerCareer=" + trainerCareer + ", trainerMcnt=" + trainerMcnt + ", trainerEnrollDate="
				+ trainerEnrollDate + ", trianerStatus=" + trianerStatus + ", trainerPrice=" + trainerPrice + "]";
	}
	
	
}
