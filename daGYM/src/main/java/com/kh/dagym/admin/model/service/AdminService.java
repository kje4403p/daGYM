package com.kh.dagym.admin.model.service;

import java.util.List;

import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.Trainer;

public interface AdminService {

	/** 회원 전체 조회 Service
	 * @return mList
	 */
	public abstract List<Member> selectMList();

	/** 트레이너 전체 조회 Service
	 * @return tList
	 */
	public abstract List<Trainer> selectTList();

}
