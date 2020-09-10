package com.kh.dagym.admin.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.admin.model.dao.AdminDAO;
import com.kh.dagym.admin.model.vo.Attachment;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.Page;
import com.kh.dagym.admin.model.vo.Reply;
import com.kh.dagym.admin.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.Payment;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private Page pInfo;
	
	// 회원 전체 조회 Service 구현
	@Override
	public List<Member> selectMList() {
		return adminDAO.selectMList();
	}

	// 트레이너 전체 조회 Service 구현
	@Override
	public List<Trainer> selectTList() {
		return adminDAO.selectTList();
	}

	// 게시판 목록 조회 Service 구현
	@Override
	public List<Board> selectList(Page pInfo) {
		return adminDAO.selectList(pInfo);
	}

	// 1:1 문의 답변 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAnswer(Reply reply) {
		return adminDAO.insertAnswer(reply);
	}

	// 페이징처리 Service 구현
	@Override
	public Page pagination(int type, int cp) {
		int listCount = adminDAO.getListCount(type);
		pInfo.setPageInfo(cp, listCount, type);
		
		return pInfo;
	}

	// 이벤트 작성 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertEvent(Board board, List<MultipartFile> images, String savePath) {
		int result = 0;
		// SEQ_BNO.NEXTVAL 얻어옴
		int boardNo = adminDAO.selectNextNo();
		
		if(boardNo > 0) {
			board.setBoardNo(boardNo);
			board.setBoardContent(replaceParameter(board.getBoardContent()));
			// BOARD에 DB 삽입
			result = adminDAO.insertEvent(board);
			
			List<Attachment> files = new ArrayList<Attachment>();
			
			Attachment at = null;
			String filePath = "/resources/uploadImages";
			for(int i=0; i<images.size(); i++) {
				if(!images.get(i).getOriginalFilename().equals("")) {
					String changeName = rename(images.get(i).getOriginalFilename());
					at = new Attachment(boardNo, images.get(i).getOriginalFilename(), changeName, filePath, i);
					result = adminDAO.insertAttachment(at);
				}
				files.add(at);
			}
			
			if(result > 0) {
				for(int i=0; i<images.size(); i++) {
					if(!images.get(i).getOriginalFilename().equals("")) {
						try {
							images.get(i).transferTo(new File(savePath + "/" + files.get(i).getFileChangeName()));
						} catch (Exception e) {
							e.printStackTrace();
							
							adminDAO.deleteAttachment(boardNo);
						}
					}
				}
			}
		}
		
		return result;
	}
	
	
	
	
	// 크로스 사이트 스크립트 방지 메소드
    private String replaceParameter(String param) {
        String result = param;
        if(param != null) {
            result = result.replaceAll("&", "&amp;");
            result = result.replaceAll("<", "&lt;");
            result = result.replaceAll(">", "&gt;");
            result = result.replaceAll("\"", "&quot;");
        }

        return result;
    }
    
    // 파일명 변경
    public String rename(String originFileName) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
        String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

        int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성

        String str = "_" + String.format("%05d", ranNum);
        //String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
        // %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)

        String ext = originFileName.substring(originFileName.lastIndexOf("."));

        return date + str + ext;
    }
    
 // 트레이너 매출 조회 Service 구현
 	@Override
 	public List<Payment> trainerChart(String ym) {
 		List<Payment> list = adminDAO.trainerChart(ym);
 		return list;
 	}
 	// 월별 매출 조회 Service 구현
 	@Override
 	public List<Payment> monthChartView(String year) {
 		List<Payment> list = adminDAO.monthChart(year);
 		return list;
 	}

}
