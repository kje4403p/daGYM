package com.kh.dagym.trainer.model.vo;

import java.sql.Timestamp;

public class TrainerSchedule {
	private String scheduleTime;
	private int trainerNo;
	
	public TrainerSchedule() {
		// TODO Auto-generated constructor stub
	}

	public TrainerSchedule(String scheduleTime, int trainerNo) {
		super();
		this.scheduleTime = scheduleTime;
		this.trainerNo = trainerNo;
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

	@Override
	public String toString() {
		return "TrainerSchedule [scheduleTime=" + scheduleTime + ", trainerNo=" + trainerNo + "]";
	}
	
	
}
