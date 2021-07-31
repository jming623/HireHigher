package com.hirehigher.creator.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirehigher.command.BackgroundImgVO;
import com.hirehigher.command.CreatorPageVO;
import com.hirehigher.command.CreatorVO;
import com.hirehigher.command.ProfileImgVO;
import com.hirehigher.command.UserVO;
import com.hirehigher.command.WorkBoardVO;
import com.hirehigher.creator.mapper.CreatorMapper;


@Service("creatorService")
public class CreatorServiceImpl implements CreatorService {

	@Autowired
	private CreatorMapper creatorMapper;
	
	@Override
	public int apply(CreatorVO creatorVO) {
		
		return creatorMapper.apply(creatorVO);
	}

	@Override
	public int apply1(UserVO userVO) {
		
		return creatorMapper.apply1(userVO);
	}

	@Override
	public int pageRegist(CreatorPageVO pageVO) {
		
		return creatorMapper.pageRegist(pageVO);
	}

	@Override
	public int profileRegist(ProfileImgVO profileVO) {
		
		return creatorMapper.profileRegist(profileVO);
	}

	@Override
	public int backgroundRegist(BackgroundImgVO backgroundVO) {
		
		return creatorMapper.backgroundRegist(backgroundVO);
	}

	@Override
	public CreatorPageVO pageDetail(String pageId) {
		
		return creatorMapper.pageDetail(pageId);
	}

	@Override
	public CreatorVO creatorDetail(String creatorId) {
		
		return creatorMapper.creatorDetail(creatorId);
	}

	@Override
	public ProfileImgVO profileGet(String profileId) {
		
		return creatorMapper.profileGet(profileId);
	}

	@Override
	public BackgroundImgVO backgroundGet(String backgroundId) {
		
		return creatorMapper.backgroundGet(backgroundId);
	}

	@Override
	public int getTotal(String creatorName) {
		
		return creatorMapper.getTotal(creatorName);
	}

	@Override
	public ArrayList<WorkBoardVO> getList(int pageNum, int amount, String creatorName) {
		
		return creatorMapper.getList(pageNum, amount, creatorName);
	}

	@Override
	public int profileUpdate(CreatorPageVO pageVO) {
		
		return creatorMapper.profileUpdate(pageVO);
	}

	@Override
	public int infoUpdate(CreatorVO creatorVO) {
		
		return creatorMapper.infoUpdate(creatorVO);
	}

}
