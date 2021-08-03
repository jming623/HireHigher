package com.hirehigher.jobboard.service;

import java.util.ArrayList;

import com.hirehigher.command.JobBoardDetailVO;
import com.hirehigher.command.JobBoardVO;
import com.hirehigher.util.JobCriteria;

public interface JobBoardService {
		//등록
		public int regist1(JobBoardVO jobBoardVO); 
		public int regist2(JobBoardDetailVO jobBoardDetailVO); 
		
		//수정
		public int update1(JobBoardDetailVO jobBoardDetailVO);
		public int update2(JobBoardVO jobBoardVO);
		
		//삭제
		public int delete1(int bno); 
		public int delete2(int bno);
		
		public int getTotal(JobCriteria cri); //총 게시글 수
		public ArrayList<JobBoardVO> getList(JobCriteria cri); //조회	
		public JobBoardDetailVO getDetail(int bno); //상세
		public int viewCount(int bno); //조회수
}
