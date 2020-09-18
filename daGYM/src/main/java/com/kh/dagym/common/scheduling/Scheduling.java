package com.kh.dagym.common.scheduling;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.dagym.admin.model.service.AdminService;

@Component
public class Scheduling {

	private Logger logger = LoggerFactory.getLogger(Scheduling.class);
	
	@Autowired
	private AdminService adminService;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void test() {
		logger.debug("================= 스케쥴링 테스트 =================");
		int result = adminService.dormantAccount();
	}
}
