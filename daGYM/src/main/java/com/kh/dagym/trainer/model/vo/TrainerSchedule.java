package com.kh.dagym.trainer.model.vo;

import java.sql.Timestamp;

public class TrainerSchedule {
	private String scheduleTime;
	private int trainerNo;
	private String scheduleStatus;
	public TrainerSchedule() {
		// TODO Auto-generated constructor stub
	}
	public TrainerSchedule(String scheduleTime, int trainerNo, String scheduleStatus) {
		super();
		this.scheduleTime = scheduleTime;
		this.trainerNo = trainerNo;
		this.scheduleStatus = scheduleStatus;
	}
	public String getScheduleTime() {
		return scheduleTime;
	}
	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}
	public int getTrainerNo() {
		return trainerNo;
	}
	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}
	public String getScheduleStatus() {
		return scheduleStatus;
	}
	public void setScheduleStatus(String scheduleStatus) {
		this.scheduleStatus = scheduleStatus;
	}
	@Override
	public String toString() {
		return "TrainerSchedule [scheduleTime=" + scheduleTime + ", trainerNo=" + trainerNo + ", scheduleStatus="
				+ scheduleStatus + "]";
	}

	
	
}
