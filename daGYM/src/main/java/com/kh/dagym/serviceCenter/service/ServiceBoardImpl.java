package com.kh.dagym.serviceCenter.service;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.ServiceDAO;
import com.kh.dagym.serviceCenter.vo.QnaBoard;
import com.kh.dagym.serviceCenter.vo.Search;



@Service
public class ServiceBoardImpl implements ServiceBoard{

	@Autowired
	private ServiceDAO serviceDAO;
	
	@Autowired //의존성 주입(DI)
	private PageInfo pInfo;
	
	@Autowired
	private com.kh.dagym.serviceCenter.vo.PageInfoSv pInfo2;

	@Override
	public PageInfo pagination(int type, int cp) {
		
		//전체 게시글 수 조회
		int listCount = serviceDAO.getListCount(type);
				
		pInfo.setPageInfo(cp, listCount, type);
	
		return pInfo;
	}

	
	//faq 리스트 조회 service구현
	@Override
	public List<Board> selectFaqList(PageInfo pInfo) {
		
		return serviceDAO.selectFaqList(pInfo);
	}

	//faq 게시글 상세조회 Service구현
	
	@Override
	public Board selectFaqBoard(int boardNo,int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("type", type);
		
		Board board = serviceDAO.selectFaqBoard(map);
		
		if(board != null) {
			
			
			int result = serviceDAO.increaseCount(boardNo);
			System.out.println(board.getViews());
			if(result>0) {
				board.setViews(board.getViews()+1);
				
			}
		}
		
		
		return board;
	}

	// 검색 조건이 추가된 faq,qna페이징 처리 구현
	@Override
	public PageInfo pagination(int type, int cp, Search search) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("type",type);
		
		if(type ==3) {
			
			int searchListCount = serviceDAO.getSearchListQnaCount(map);
			pInfo.setPageInfo(cp, searchListCount, type);
		}else {
		
			int searchListCount = serviceDAO.getSearchListCount(map);
			
			pInfo.setPageInfo(cp, searchListCount, type);
		}
		return pInfo;
	}

	// faq보드넘버 조회 service구현
	@Override
	public List<Board> selectBoardNo(PageInfo pInfo) {
		
		return serviceDAO.selectFaqBoardNo(pInfo);
	}

	//faq 멤버 Id 리스트 조회 
	@Override
	public List<Member> selectMemberId(PageInfo pInfo) {
		
		return serviceDAO.selectFaqMemberIdList(pInfo);
	}


	//faq 검색 목록 조회 Service구현
	@Override
	public Map<String, Object> selectSearchList(PageInfo pInfo, Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("type", pInfo.getBoardType());
		
		List<Board> bList = new ArrayList<Board>();
		List<QnaBoard> qList = new ArrayList<QnaBoard>();
		
		if(pInfo.getBoardType()==3) {
			
			qList = serviceDAO.selectQnaSearchList(pInfo,map);
			map.put("qList", qList);
			
		}else {
			bList  =serviceDAO.selectSearchList(pInfo,map);
			map.put("bList", bList);
		}
		return map;
	}


	//faq 글 등록 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertFaq(Board board, List<MultipartFile> images, String savePath) {

		int result =0;
		
		int boardNo = serviceDAO.selectNextNo(board.getBoardType());
		
		if(boardNo>0) {
			
			board.setBoardNo(boardNo);
			
			board.setBoardContent(replaceParameter(board.getBoardContent()));
			
			result = serviceDAO.insertFaq(board);
			
			List<Attachment> files = new ArrayList<Attachment>();
			
			Attachment at = null;
			
			String filePath = "/resources/uploadImages";
			
			for(int i=0; i<images.size(); i++) {
				
				if(!images.get(i).getOriginalFilename().equals("")) {
					
					String changeName = rename(images.get(i).getOriginalFilename());
					
					at = new Attachment(boardNo,images.get(i).getOriginalFilename(),
							changeName, filePath, i);
					
					result = serviceDAO.insertFaqAttachment(at);
				}
				
				files.add(at);
					
			}
			
			if(result>0) {
				
				for(int i=0; i<images.size(); i++) {
					
					if(!images.get(i).getOriginalFilename().equals("")) {
						
						try {
							images.get(i).transferTo(new File(savePath+"/"+files.get(i).getFileChangeName()));
						} catch (Exception e) {
							e.printStackTrace();
							
							serviceDAO.deleteFaqAttachment(boardNo);
						}
					}
				}
			}
			
		}
		return result;
	}
	
	
	
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

	        String str = "_" + String.format("%05d", ranNum);
	        //String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
	        // %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)

	        String ext = originFileName.substring(originFileName.lastIndexOf("."));

	        return date + "" + str + ext;
	    }


	 //faq 이미지 조회 service 구현
	@Override
	public List<Attachment> selectFaqFiles(int boardNo) {

		return serviceDAO.selectFaqFiles(boardNo);
	}

	//게시글 업데이트 Service 구현
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateFaqBoard(Board upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages) {
		
		upBoard.setBoardContent(replaceParameter(upBoard.getBoardContent()));
		
		int result = serviceDAO.updateFaqBoard(upBoard);
		
		if(result>0) {
			List<Attachment> oldFiles = serviceDAO.selectFaqFiles(upBoard.getBoardNo());
			
			String filePath = "/resources/uploadImages";
			
			List<Attachment> files = new ArrayList<Attachment>();
			List<Attachment> removeFiles = new ArrayList<Attachment>();
			Attachment at = null;
			
			for(int i=0; i<images.size(); i++) {
				if(!images.get(i).getOriginalFilename().equals("")) {
					
					String changeFileName = rename(images.get(i).getOriginalFilename());
					
					at = new Attachment(upBoard.getBoardNo(), 
							images.get(i).getOriginalFilename(), 
							changeFileName, filePath, i);
					
					boolean flag = false;
					for(Attachment old: oldFiles) {
						if(old.getFileLevel()==i) {
							flag = true;
							removeFiles.add(old);
							
							at.setFileNo(old.getFileNo());
							
							break;
							
						}
					}
					
					if(flag) {
						result = serviceDAO.updateFaqAttachment(at);
					}else {
						result = serviceDAO.insertFaqAttachment(at);
					}
					
				}else {
					if(deleteImages[i]) {
						for(Attachment old:oldFiles) {
							
							if(old.getFileLevel() ==i) {
								result = serviceDAO.deleteFaqAttachment2(old.getFileNo());
								removeFiles.add(old);
							}
						}
					}
				}
				files.add(at);
			}
			
			if(result>0) {
				for(int i=0; i<images.size(); i++) {
					if(!images.get(i).getOriginalFilename().equals("")) {
						try {
							images.get(i).transferTo(new File(savePath+"/"+files.get(i).getFileChangeName()));
							
						} catch (Exception e) {

							serviceDAO.deleteFaqAttachment(upBoard.getBoardNo());
						}
					}
				}
			}
			for(Attachment removeFile : removeFiles) {
				File rm = new File(savePath + "/" + removeFile.getFileChangeName());
				rm.delete();
			}
			
		}
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteFaqBoard(int boardNo) {
		return serviceDAO.deleteFaqBoard(boardNo);
	}

	// qaList 페이징 처리 service 구현
	@Override
	public com.kh.dagym.serviceCenter.vo.PageInfoSv paginationQa(int type, int cp,int loginMemberNo) {
		int listCount = serviceDAO.getQaListCount(type,loginMemberNo);
		pInfo2.setPageInfo(cp, listCount, type);
		pInfo2.setMemberNo(loginMemberNo);
		return pInfo2;
		}
	

	//Qa 리스트 조회 service구현
	@Override
	public List<QnaBoard> selectQaList(com.kh.dagym.serviceCenter.vo.PageInfoSv pInfo) {
		
		return serviceDAO.selectQaList(pInfo);
	}

	// queset 게시글 상세 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectQnaBoard(int boardNo) {
		
		Board board = serviceDAO.selectQnaBoard(boardNo);
		board.setBoardWriter(serviceDAO.selectMemberId(board.getBoardWriter()));
		
		if(board!= null) {
			int result = serviceDAO.increaseCount2(boardNo);
			
			if(result>0) {
				board.setViews(board.getViews()+1);
			}
		}
		return board;
	}


	//qa게시글 등록 서비스 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertQaBoard(Board board, List<MultipartFile> images, String savePath) {
		
		int result = 0;
		
		int boardNo = serviceDAO.selectNextNo(board.getBoardType());
		
		if(boardNo>0) {
			board.setBoardNo(boardNo);
			
			board.setBoardContent(replaceParameter(board.getBoardContent()));
			
			result = serviceDAO.insertFaq(board);
			
			
		}
		
		return 0;
	}


	//게시글 이미지 여부 Service구현
	@Override
	public List<Attachment> selectImgList(String boardWriter) {
		
		return serviceDAO.selectImgList(boardWriter);
	}


	

}
