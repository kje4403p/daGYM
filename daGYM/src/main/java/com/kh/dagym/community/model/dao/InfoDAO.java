package com.kh.dagym.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.common.Reply;
import com.kh.dagym.community.model.vo.BoardLikes;

@Repository
public class InfoDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public InfoDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	/** 게시글 수 가져오기
	 * @return
	 */
	public int getListCount(Map<String, String> map) {
		return sqlSession.selectOne("eventMapper.getInfoListCount", map);
	}


	public List<Board> selectList(PageInfo pInfo, Map<String, String> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("eventMapper.selectInfoList", map, rowBounds);

	}


	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("eventMapper.selectInfo", boardNo);
	}


	public int increaseCount(int boardNo) {
		return sqlSession.update("eventMapper.increaseCount", boardNo);
	}


	public int getBoardLike(BoardLikes boardLikes) {
		return sqlSession.selectOne("eventMapper.getBoardLike", boardLikes);
	}


	public Object deleteLikes(BoardLikes boardLikes) {
		return sqlSession.delete("eventMapper.deleteLikes", boardLikes);
	}


	public int insertLikes(BoardLikes boardLikes) {
		return sqlSession.delete("eventMapper.insertLikes", boardLikes);
	}


	public int likesCount(int boardNo) {
		return sqlSession.selectOne("eventMapper.likesCount", boardNo);
	}


	public int insertReply(Reply reply) {
		return sqlSession.insert("eventMapper.insertReply", reply);
	}


	public List<Reply> selectReplys(int boardNo) {
		return sqlSession.selectList("eventMapper.selectReplys", boardNo);
	}


	public int deleteReply(int replyNo) {
		return sqlSession.update("eventMapper.deleteReply", replyNo);
	}


	public List<Board> selectBest(int BOARD_TYPE) {
		return sqlSession.selectList("eventMapper.selectBest", BOARD_TYPE);
	}


	public String selectReply(int replyNo) {
		return sqlSession.selectOne("eventMapper.selectReply", replyNo);
	}


	public int updateReply(Reply reply) {
		return sqlSession.update("eventMapper.updateReply", reply);
	}

}
