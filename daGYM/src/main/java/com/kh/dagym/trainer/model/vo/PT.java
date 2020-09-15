package com.kh.dagym.trainer.model.vo;

public class PT {
	private int memberNo;
	private int trainerNo;
	private String scheduleTime;
	private String ptStatus;
	public PT() {
		// TODO Auto-generated constructor stub
	}
	public PT(int memberNo, int trainerNo, String scheduleTime, String ptStatus) {
		super();
		this.memberNo = memberNo;
		this.trainerNo = trainerNo;
		this.scheduleTime = scheduleTime;
		this.ptStatus = ptStatus;
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
	public String getScheduleTime() {
		return scheduleTime;
	}
	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}
	public String getPtStatus() {
		return ptStatus;
	}
	public void setPtStatus(String ptStatus) {
		this.ptStatus = ptStatus;
	}
	@Override
	public String toString() {
		return "PT [memberNo=" + memberNo + ", trainerNo=" + trainerNo + ", scheduleTime=" + scheduleTime
				+ ", ptStatus=" + ptStatus + "]";
	}

	
	
}
