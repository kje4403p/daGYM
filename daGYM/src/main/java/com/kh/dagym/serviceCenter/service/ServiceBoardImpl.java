package com.kh.dagym.serviceCenter.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
				
		return null;
	}
	
	
	
	

}
