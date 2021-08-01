package com.hirehigher.creator.service;

import java.util.ArrayList;

import com.hirehigher.command.BackgroundImgVO;
import com.hirehigher.command.CreatorPageVO;
import com.hirehigher.command.CreatorVO;
import com.hirehigher.command.ProfileImgVO;
import com.hirehigher.command.UserVO;
import com.hirehigher.command.WorkBoardVO;


public interface CreatorService {
	
	public int apply(CreatorVO creatorVO); // 제작자 신청
	public int apply1(UserVO userVO); // users 테이블 userType 변경
	public int pageRegist(CreatorPageVO pageVO); // creatorPage에 기본 내용 등록
	public int profileRegist(ProfileImgVO profileVO); // profile 이미지 기본 내용 등록
	public int backgroundRegist(BackgroundImgVO backgroundVO); // background 이미지 기본내용 등록
	public CreatorPageVO pageDetail(String pageId); // creatorPage 상세
	public CreatorVO creatorDetail(String creatorId); // creator 상세
	public ProfileImgVO profileGet(String profileId); // 프로필 이미지 조회
	public BackgroundImgVO backgroundGet(String backgroundId); // 백그라운드 이미지 조회
	public int getTotal(String creatorName); // 총 게시글 수
	public ArrayList<WorkBoardVO> getList(int pageNum, int amount, String creatorName); // 게시글 리스트
	
	
}
