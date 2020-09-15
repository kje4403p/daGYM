package com.kh.dagym.member.model.vo;

import java.sql.Date;

public class MyPass {
	private String merchantUid; // 결제번호
	private int classNm; // 상품명
	private int amount; // 결제 금액
	private Date raymentDate; // 결제 날짜
	private String trainerName; // 트레이너 이름
	private int classCnt; // 이용권(횟수)
	private int trainerNo;

	public MyPass() {
	}

	public MyPass(String merchantUid, int classNm, int amount, Date raymentDate, String trainerName, int classCnt, int trainerNo) {
		super();
		this.merchantUid = merchantUid;
		this.classNm = classNm;
		this.amount = amount;
		this.raymentDate = raymentDate;
		this.trainerName = trainerName;
		this.classCnt = classCnt;
		this.trainerNo=trainerNo;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public int getClassNm() {
		return classNm;
	}

	public void setClassNm(int classNm) {
		this.classNm = classNm;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getRaymentDate() {
		return raymentDate;
	}

	public void setRaymentDate(Date raymentDate) {
		this.raymentDate = raymentDate;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public int getClassCnt() {
		return classCnt;
	}

	public void setClassCnt(int classCnt) {
		this.classCnt = classCnt;
	}

	@Override
	public String toString() {
		return "MyPass [merchantUid=" + merchantUid + ", classNm=" + classNm + ", amount=" + amount + ", raymentDate="
				+ raymentDate + ", trainerName=" + trainerName + ", classCnt=" + classCnt + "]";
	}

	
	
	
}
