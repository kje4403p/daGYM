package com.kh.dagym.trainer.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Review {

	private int reviewNo;
	private String reviewContent;
	private int reviewRating;
	private Date reviewCreateDate;
	private String reviewStatus;
	private int memberNo;
	private int trainerNo;
	private String memberId;
	private String trainerNM;
	private String merchantUid;
	

	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, String reviewContent, int reviewRating, Date reviewCreateDate, String reviewStatus,
			int memberNo, int trainerNo, String memberId, String trainerNM, String merchantUid) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewRating = reviewRating;
		this.reviewCreateDate = reviewCreateDate;
		this.reviewStatus = reviewStatus;
		this.memberNo = memberNo;
		this.trainerNo = trainerNo;
		this.memberId = memberId;
		this.trainerNM = trainerNM;
		this.merchantUid = merchantUid;
	}

	public String getMerchantUid() {
		return merchantUid;
	}
	
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public Date getReviewCreateDate() {
		return reviewCreateDate;
	}

	public void setReviewCreateDate(Date reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTrainerNM() {
		return trainerNM;
	}

	public void setTrainerNM(String trainerNM) {
		this.trainerNM = trainerNM;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewRating=" + reviewRating
				+ ", reviewCreateDate=" + reviewCreateDate + ", reviewStatus=" + reviewStatus + ", memberNo=" + memberNo
				+ ", trainerNo=" + trainerNo + ", memberId=" + memberId + ", trainerNM=" + trainerNM + "]";
	}
	
	
}
