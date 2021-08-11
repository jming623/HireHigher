package com.hirehigher.jobboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirehigher.command.JobBoardDetailVO;
import com.hirehigher.command.JobBoardVO;
import com.hirehigher.jobboard.mapper.JobBoardMapper;
import com.hirehigher.util.JobCriteria;

@Service("jobBoardService")
public class JobBoardServiceImpl implements JobBoardService {
	
	//----------------------------MAPPER 연결----------------------------
	
	@Autowired
	private JobBoardMapper jobBoardMapper;
	
	//----------------------------MAPPER 연결----------------------------
	
	//등록
	@Override
	public int regist1(JobBoardVO jobBoardVO) {
		return jobBoardMapper.regist1(jobBoardVO);
	}
	
	@Override
	public int regist2(JobBoardDetailVO jobBoardDetailVO) {
		return jobBoardMapper.regist2(jobBoardDetailVO);
	}
	
	//수정
	public int update1(JobBoardDetailVO jobBoardDetailVO) {
		return jobBoardMapper.update1(jobBoardDetailVO);
	}
	
	public int update2(JobBoardVO jobBoardVO) {
		return jobBoardMapper.update2(jobBoardVO);
	}
	
	//삭제
	public int delete1(int bno) {
		return jobBoardMapper.delete1(bno);
	}
	
	public int delete2(int bno) {
		return jobBoardMapper.delete2(bno);
	}

	//총 게시글 수
	@Override
	public int getTotal(JobCriteria cri) {
		return jobBoardMapper.getTotal(cri);
	}
	
	//조회
	@Override 
	public ArrayList<JobBoardVO> getList(JobCriteria cri) {
		return jobBoardMapper.getList(cri);
	}

	//상세화면
	@Override
	public JobBoardDetailVO getDetail(int bno) {
		return jobBoardMapper.getDetail(bno);
	}
	
	//조회수
	public int viewCount(int bno) {
		return jobBoardMapper.viewCount(bno);
	}
	

}