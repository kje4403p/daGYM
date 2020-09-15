package com.kh.dagym.admin.model.vo;

public class PT {
	
	private int memberNo;
	private int trainerNo;
	private String scheduleTime;
	private String ptStatus;
	private String memberName;
	private String trainerName;
	
	public PT() {}

	public PT(int memberNo, int trainerNo, String scheduleTime, String ptStatus, String memberName,
			String trainerName) {
		super();
		this.memberNo = memberNo;
		this.trainerNo = trainerNo;
		this.scheduleTime = scheduleTime;
		this.ptStatus = ptStatus;
		this.memberName = memberName;
		this.trainerName = trainerName;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	@Override
	public String toString() {
		return "PT [memberNo=" + memberNo + ", trainerNo=" + trainerNo + ", scheduleTime=" + scheduleTime
				+ ", ptStatus=" + ptStatus + ", memberName=" + memberName + ", trainerName=" + trainerName + "]";
	}
	
}
