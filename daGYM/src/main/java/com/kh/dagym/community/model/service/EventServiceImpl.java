package com.kh.dagym.community.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.dao.EventDAO;

@Repository
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private PageInfo pInfo;


	/** 페이징 처리를 위한 Service
	 * @param BOARD_TYPE
	 * @param cp
	 * @return pInfo
	 */
	public PageInfo pagenation(int BOARD_TYPE, int cp) {
		// 1) 전체 게시글 수 조회
		int listCount = eventDAO.getListCount();

		// 2) setPageInfo 호출
		pInfo.setLimit(6);
		pInfo.setPageInfo(cp, listCount, BOARD_TYPE);		

		return pInfo;
	}


	/** 게시글 목록 조회
	 * @param pInfo
	 * @return eventList
	 */ 
	@Override
	public List<Board> selectList(PageInfo pInfo) {
		return eventDAO.selectList(pInfo);
	}


	/** 게시글 삽입
	 * @param board, images, savePath
	 * @return int
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(Board board, List<MultipartFile> images, String savePath) {
		int result = 0;

		int boardNo = eventDAO.selectNextNo();

		if (boardNo > 0) { // 다음 번호를 정상적으로 얻어 왔을 때
			// 다음 번호 board 객체에 세팅
			board.setBoardNo(boardNo);

			// 크로스 사이트 스크립트 방지 문자
			board.setBoardContent(replaceParameter(board.getBoardContent()));
			result = eventDAO.insertBoard(board);
			System.out.println("1");
			// 파일 정보 DB 저장
			List<Attachment> files = new ArrayList<>();

			Attachment at = null;
			String filePath = "/resources/uploadImages";
			System.out.println("HELLO");
			System.out.println("images size : " + images.size());
			for(int i = 0; i < images.size(); i++) {
				if (!images.get(i).getOriginalFilename().equals("") ) {
					String chageName = rename(images.get(i).getOriginalFilename());

					at = new Attachment(boardNo, images.get(i).getOriginalFilename(), chageName, filePath, i);

					result = eventDAO.insertAttachment(at);
				}
				files.add(at);
			}

			System.out.println("2");


			// 파일을 서버에 저장
			if (result > 0) {
				for(int i = 0; i <images.size(); i++) {

					if(!images.get(i).getOriginalFilename().equals("")) {
						//이미지가 업로드가 되었다면

						// transferTo : 지정한 경로에 업로드된 바이트상태의 파일을 실제 파일로 변환해서 저장해라
						try {
							images.get(i).transferTo(new File(savePath + "/" + files.get(i).getFileChangeName()));
						} catch (Exception e) {
							e.printStackTrace();

							// 서버에 파일 저장 중 문제가 발생할 경우
							// 이미 DB에 삽입되어 있는 파일 정보를 삭제하는 DAO 호출
							eventDAO.deleteAttachment(boardNo);
						}
					}
				}
			}
		}
		return result;
	}
	
	
	
	/** 게시글 조회
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int boardNo) {
		Board board = eventDAO.selectBoard(boardNo);
		
		if (board != null) {
			int result = eventDAO.increaseCount(boardNo);

			// 조회된 게시글(board)의 조회 수를 1증가 시킴
			if (result > 0) 
				board.setViews(board.getViews()+ 1);
		}

		// 조회 성공 시 조회수 증가
		return board;
	}
	

	/**
	 * event 삭제 메소드
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteEvent(int boardNo) {
		int result = eventDAO.deleteEvent(boardNo);
		
		if (result > 0) {
			List<Attachment> deleteFiles = eventDAO.selectFiles(boardNo);
			
			if (! deleteFiles.isEmpty() ) {
				eventDAO.deleteAttachment(boardNo);
				for (Attachment at : deleteFiles) {
					String filePath = "/resources/uploadImages";
					File file = new File(filePath + "/" + at.getFileChangeName());
					file.delete();
				}
			}
		}
		
		return result;
	}


	/**
	 * 파일 불러오기
	 */
	@Override
	public List<Attachment> selectFiles(int boardNo) {
		return eventDAO.selectFiles(boardNo);
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
