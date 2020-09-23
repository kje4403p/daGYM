package com.kh.dagym.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.common.Reply;
import com.kh.dagym.community.model.dao.InfoDAO;
import com.kh.dagym.community.model.vo.BoardLikes;

@Service
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	private InfoDAO infoDAO;
	
	@Autowired
	private PageInfo pInfo;
	

	@Override
	public PageInfo pagenation(int cp, Map<String, String> map, int BOARD_TYPE) {
		// 1) 전체 게시글 수 조회
		int listCount = infoDAO.getListCount(map);
		pInfo.setPageInfo(cp, listCount, BOARD_TYPE);


		return pInfo;
	}


	@Override
	public List<Board> selectList(PageInfo pInfo, Map<String, String> map) {
		return infoDAO.selectList(pInfo, map);
	}

	@Transactional
	@Override
	public Board selectInfo(int boardNo) {
		Board board = infoDAO.selectBoard(boardNo);
		
		if (board != null) {
			int result = infoDAO.increaseCount(boardNo);

			// 조회된 게시글(board)의 조회 수를 1증가 시킴
			if (result > 0) 
				board.setViews(board.getViews()+ 1);
		}

		// 조회 성공 시 조회수 증가
		return board;
	}


	@Override
	public int getBoardLike(BoardLikes boardLikes) {
		return infoDAO.getBoardLike(boardLikes);
	}


	@Transactional
	@Override
	public void deleteLikes(BoardLikes boardLikes) {
		infoDAO.deleteLikes(boardLikes);
	}

	@Transactional
	@Override
	public int insertLikes(BoardLikes boardLikes) {
		return infoDAO.insertLikes(boardLikes);
	}
	
	public int likesCount(int boardNo) {
		return infoDAO.likesCount(boardNo);
	}

	@Transactional
	@Override
	public int insertReply(Reply reply) {
		reply.setReplyContent(replaceParameter(reply.getReplyContent()));
		
		return infoDAO.insertReply(reply);
	}
	
	
	
	@Override
	public List<Reply> selectReplys(int boardNo) {
		return infoDAO.selectReplys(boardNo);
	}
	
	@Transactional
	@Override
	public int deleteReply(int replyNo) {
		return infoDAO.deleteReply(replyNo);
	}
	

	@Override
	public List<Board> selectBest(int BOARD_TYPE) {
		return infoDAO.selectBest(BOARD_TYPE);
	}
	
	
	@Override
	public String selectReply(int replyNo) {
		return infoDAO.selectReply(replyNo);
	}
	
	@Transactional
	@Override
	public int updateReply(Reply reply) {
		return infoDAO.updateReply(reply);
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

	
	
	
	
	
	

}
