package com.kh.dagym.trainer.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;

public interface TrainerService {

	/** 트레이너 리스트 Service
	 * @return trianerList
	 */
	List<Trainer> selectList();

	Trainer selectTrainer(int trainerNo);

	List<TrainerAttachment> selectThumbnailList(List<Trainer> trainerList);

	List<TrainerAttachment> selectFiles(int trainerNo);

	int insertTrainer(Trainer trainer, List<MultipartFile> images, String savePath);


}