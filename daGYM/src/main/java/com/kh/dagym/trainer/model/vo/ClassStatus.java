package com.kh.dagym.trainer.model.vo;

public class ClassStatus {
	private int memberNo;
	private int trainerNo;
	private int classCnt;
	
	public ClassStatus() {
		// TODO Auto-generated constructor stub
	}

	public ClassStatus(int memberNo, int trainerNo, int classCnt) {
		super();
		this.memberNo = memberNo;
		this.trainerNo = trainerNo;
		this.classCnt = classCnt;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public int getClassCnt() {
		return classCnt;
	}

	public void setClassCnt(int classCnt) {
		this.classCnt = classCnt;
	}

	@Override
	public String toString() {
		return "ClassStatus [memberNo=" + memberNo + ", trainerNo=" + trainerNo + ", classCnt=" + classCnt + "]";
	}


}
