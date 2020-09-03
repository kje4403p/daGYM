package com.kh.dagym.trainer.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.trainer.model.dao.TrainerDAO;
import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;


@Service
public class TrainerServiceImpl implements TrainerService{
	
	@Autowired
	private TrainerDAO trainerDAO;
	
	@Override
	public List<Trainer> selectList() {
		
		return trainerDAO.selectList();
	}

	@Override
	public Trainer selectTrainer(int trainerNo) {
		
		return trainerDAO.selectTrainer(trainerNo);
	}

	@Override
	public List<TrainerAttachment> selectThumbnailList(List<Trainer> trainerList) {
		return trainerDAO.selectThumbnailList(trainerList);
	}

	@Override
	public List<TrainerAttachment> selectFiles(int trainerNo) {
		return trainerDAO.selectFiles(trainerNo);
	}
	
	@Transactional(rollbackFor= Exception.class)
	@Override
	public int insertBoard(Trainer trainer, List<MultipartFile> images, String savePath) {
int result = 0;
		

		int trainerNo = trainerDAO.selectNextNo();
			
		if(trainerNo >0) { 
			trainer.setTrainerNo(trainerNo);
			
			result = trainerDAO.insertTrainer(trainer);
	
			List<TrainerAttachment> files = new ArrayList<TrainerAttachment>();
			
			TrainerAttachment at = null;
			
			String filePath = "/resources/uploadImages";
			for(int i=0; i<images.size(); i++) {
				if(!images.get(i).getOriginalFilename().equals("")) {

					String changeName = rename(images.get(i).getOriginalFilename());

					at = new TrainerAttachment(trainerNo, images.get(i).getOriginalFilename(),
													changeName, filePath, i);
					
					result = trainerDAO.insertAttachment(at);
					
				}
				files.add(at);
			}
			if(result>0) {
				for(int i=0; i<images.size(); i++) {
					
					if(!images.get(i).getOriginalFilename().equals("")) {
						try {
							images.get(i).transferTo(new File(savePath + "/" + files.get(i).getFileChangeName()));
						} catch (Exception e) {
							e.printStackTrace();
							trainerDAO.deleteAttachment(trainerNo);
						}
					}
				}
			}
		}
		return result;
	}
	
	 // 파일명 변경
    public String rename(String originFileName) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
        String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

        int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성

        String str = "" + String.format("%05d", ranNum);
        //String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
        // %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)

        String ext = originFileName.substring(originFileName.lastIndexOf("."));

        return date + "" + str + ext;
    }
}