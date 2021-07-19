package com.hirehigher.jobboard.mapper;

import java.util.ArrayList;

import com.hirehigher.command.JobBoardDetailVO;
import com.hirehigher.command.JobBoardVO;
import com.hirehigher.util.JobCriteria;

public interface JobBoardMapper {

	public int getTotal(JobCriteria cri); //총 게시글 수
	public ArrayList<JobBoardVO> getList(JobCriteria cri); //조회
	public JobBoardDetailVO getDetail(int bno); //상세
}
