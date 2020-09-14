package com.kh.dagym.serviceCenter.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.serviceCenter.vo.Sreply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 댓글 조회 서비스 DAO
	 * @param boardNo
	 * @return rList
	 */
	public List<Sreply> selectList(int boardNo) {
		
		return sqlSession.selectList("serviceMapper.selectList2", boardNo);
	}

	
	/** 댓글 수정 서비스 DAO
	 * @param reply
	 * @return result
	 */
	public int updateReply(Sreply reply) {
		return sqlSession.update("serviceMapper.updateReply", reply);
	}


	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return result
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("serviceMapper.deleteReply",replyNo);
	}


	/** 댓글 삽입 DAO
	 * @param reply
	 * @return result
	 */
	public int insertReply(Sreply reply) {

		return sqlSession.insert("serviceMapper.insertReply", reply);
	}


	

}
