package com.kh.dagym.serviceCenter.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.ServiceDAO;



@Service
public class ServiceBoardImpl implements ServiceBoard{

	@Autowired
	private ServiceDAO serviceDAO;
	
	@Autowired //의존성 주입(DI)
	private PageInfo pInfo;

	@Override
	public PageInfo pagination(int type, int cp) {
		
		int listCount = serviceDAO.getListCount(type);
		
		pInfo.setPageInfo(cp, listCount, type);
		
		return pInfo;
	}

	// 게시글 목록 조회  Service구현
	@Override
	public List<Board> selectList(PageInfo pInfo) {
			
		return serviceDAO.selectList(pInfo);
	}
	
	
	
	
	
	
	
	

}
