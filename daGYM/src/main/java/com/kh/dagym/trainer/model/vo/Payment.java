package com.kh.dagym.trainer.model.vo;

import java.sql.Date;

public class Payment {
	private String merchantUid;
	private String impUid;
	private int classNm;
	private int amount;
	private int memberNo;
	private int trainerNo;
	private String memberEmail;
	private String memberPhone;
	private String paymentDate;
	private String trainerName;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public Payment(String merchantUid, String impUid, int classNm, int amount, int memberNo, int trainerNo,
			String memberEmail, String memberPhone, String paymentDate) {
		super();
		this.merchantUid = merchantUid;
		this.impUid = impUid;
		this.classNm = classNm;
		this.amount = amount;
		this.memberNo = memberNo;
		this.trainerNo = trainerNo;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.paymentDate = paymentDate;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
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

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	@Override
	public String toString() {
		return "Payment [merchantUid=" + merchantUid + ", impUid=" + impUid + ", classNm=" + classNm + ", amount="
				+ amount + ", memberNo=" + memberNo + ", trainerNo=" + trainerNo + ", memberEmail=" + memberEmail
				+ ", memberPhone=" + memberPhone + ", paymentDate=" + paymentDate + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}