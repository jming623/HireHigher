package com.hirehigher.creator.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirehigher.command.CreatorVO;
import com.hirehigher.command.UserVO;
import com.hirehigher.creator.mapper.CreatorMapper;

@Service("creatorService")
public class CreatorServiceImpl implements CreatorService {

	@Autowired
	private CreatorMapper creatorMapper;
	
	@Override
	public int apply(CreatorVO creatorvo) {
		
		return creatorMapper.apply(creatorvo);
	}

	@Override
	public int apply1(UserVO userVO) {
		
		return creatorMapper.apply1(userVO);
	}

}
