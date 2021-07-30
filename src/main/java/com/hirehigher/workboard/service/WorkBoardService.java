package com.hirehigher.workboard.service;

import java.util.ArrayList;


import com.hirehigher.command.WorkBoardVO;
import com.hirehigher.util.WorkBoardCriteria;

public interface WorkBoardService {

	public ArrayList<WorkBoardVO> getWorkBoardList(WorkBoardCriteria cri); // 제작자게시판 리스트 불러오기 
	public int getTotal(String Category); //제작자 게시판 카테고리별 총 게시글수 불러오기
}
