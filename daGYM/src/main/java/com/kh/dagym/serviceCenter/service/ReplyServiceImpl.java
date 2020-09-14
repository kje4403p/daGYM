package com.kh.dagym.serviceCenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dagym.serviceCenter.dao.ReplyDAO;
import com.kh.dagym.serviceCenter.vo.Sreply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replyDAO;
	
	
	//댓글 조회 Service구현
	@Override
	public List<Sreply> selectList(int boardNo) {
		return replyDAO.selectList(boardNo);
	}


	//댓글 수정 Service구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReply(Sreply reply) {
		
		reply.setContent(replaceParameter(reply.getContent()));
		
		reply.setContent(reply.getContent().replace("\n", "<br>"));
		return replyDAO.updateReply(reply);
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


	//댓글 삭제 service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReply(int replyNo) {
		return replyDAO.deleteReply(replyNo);
	}


	//댓글 삽입 Service구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Sreply reply) {
		
		reply.setContent(replaceParameter(reply.getContent()));
		
		reply.setContent(reply.getContent().replaceAll("\n", "<br>"));
		return replyDAO.insertReply(reply);
	}

}
