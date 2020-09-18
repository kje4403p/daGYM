package com.kh.dagym.trainer.model.vo;

import java.sql.Date;

public class Trainer {
	
	private int trainerNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String trainerCareer;
	private int trainerMcnt;
	private Date memberEnrollDate;
	private String memberStatus;
	private int trainerPrice;
	private String trainerSNS;
	private String trainerComment;
	private String trainerAward;
	private int reviewGrade;

	public Trainer() {
		// TODO Auto-generated constructor stub
	}

	public Trainer(int trainerNo, String memberId, String memberPwd, String memberName, String memberPhone,
			String memberEmail, String trainerCareer, int trainerMcnt, Date memberEnrollDate, String memberStatus,
			int trainerPrice, String trainerSNS, String trainerComment, String trainerAward) {
		super();
		this.trainerNo = trainerNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.trainerCareer = trainerCareer;
		this.trainerMcnt = trainerMcnt;
		this.memberEnrollDate = memberEnrollDate;
		this.memberStatus = memberStatus;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getTrainerCareer() {
		return trainerCareer;
	}

	public void setTrainerCareer(String trainerCareer) {
		this.trainerCareer = trainerCareer;
	}

	public int getTrainerMcnt() {
		return trainerMcnt;
	}

	public void setTrainerMcnt(int trainerMcnt) {
		this.trainerMcnt = trainerMcnt;
	}

	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}

	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
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
	
	

	public int getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	@Override
	public String toString() {
		return "Trainer [trainerNo=" + trainerNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail
				+ ", trainerCareer=" + trainerCareer + ", trainerMcnt=" + trainerMcnt + ", memberEnrollDate="
				+ memberEnrollDate + ", memberStatus=" + memberStatus + ", trainerPrice=" + trainerPrice
				+ ", trainerSNS=" + trainerSNS + ", trainerComment=" + trainerComment + ", trainerAward=" + trainerAward
				+ ", reviewGrade=" + reviewGrade + "]";
	}

	
	
	

}
