package com.kh.dagym.member.model.vo;

public class reservationCancel {
	private String scheduleTime;
	private String memberName;
	private String memberPhone;
	private int memberNo;
	
	public reservationCancel() {
		// TODO Auto-generated constructor stub
	}

	public reservationCancel(String scheduleTime, String memberName, String memberPhone, int memberNo) {
		super();
		this.scheduleTime = scheduleTime;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberNo = memberNo;
	}

	public String getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "reservationCancel [scheduleTime=" + scheduleTime + ", memberName=" + memberName + ", memberPhone="
				+ memberPhone + ", memberNo=" + memberNo + "]";
	}

	
	
	
	
	
}
