package com.hirehigher.creator.service;

import com.hirehigher.command.CreatorVO;
import com.hirehigher.command.UserVO;

public interface CreatorService {
	
	public int apply(CreatorVO creatorvo); // 제작자 신청
	public int apply1(UserVO userVO); // users 테이블 userType 변경
}
