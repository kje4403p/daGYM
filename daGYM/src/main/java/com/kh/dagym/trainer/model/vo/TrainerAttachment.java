package com.kh.dagym.trainer.model.vo;

public class TrainerAttachment {
	public int fileNo;
	public int parentTrainerNo;
	public String fileOriginName;
	public String fileChangeName;
	public String filePath;
	public int fileLevel;
	
	public TrainerAttachment() {
		// TODO Auto-generated constructor stub
	}

	public TrainerAttachment(int fileNo, int parentTrainerNo, String fileOriginName, String fileChangeName, String filePath,
			int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.parentTrainerNo = parentTrainerNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}
	
	public TrainerAttachment(int parentTrainerNo, String fileOriginName, String fileChangeName, String filePath,
			int fileLevel) {
		super();
		this.parentTrainerNo = parentTrainerNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getParentTrainerNo() {
		return parentTrainerNo;
	}

	public void setParentTrainerNo(int parentTrainerNo) {
		this.parentTrainerNo = parentTrainerNo;
	}

	public String getFileOriginName() {
		return fileOriginName;
	}

	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "TrainerAttachment [fileNo=" + fileNo + ", trainerNo=" + parentTrainerNo + ", fileOriginName=" + fileOriginName
				+ ", fileChangeName=" + fileChangeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + "]";
	}
	
}
