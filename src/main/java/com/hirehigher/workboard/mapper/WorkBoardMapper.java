package com.hirehigher.workboard.mapper;

import java.util.ArrayList;

import com.hirehigher.command.ProfileImgVO;
import com.hirehigher.command.WorkBoardVO;
import com.hirehigher.util.WorkBoardCriteria;

public interface WorkBoardMapper {

	public ArrayList<WorkBoardVO> getWorkBoardList(WorkBoardCriteria cri); // 제작자게시판 리스트 불러오기 
	public int getTotal(String Category); //제작자 게시판 카테고리별 총 게시글수 불러오기
	public WorkBoardVO getDetail(int bno); //상세
	public ProfileImgVO getProfileImg(String creatorNick);//크리에이터 닉으로 프로필 정보 가져오기
}
