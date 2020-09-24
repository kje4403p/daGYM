package com.kh.dagym.main.model.service;

import java.util.List;

import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.common.Attachment;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;

public interface HomeService {

	List<Attachment> eventViews();

	List<Board> eventTitle();


}
