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
	
	
	//업데이트
	public int update(JobBoardDetailVO jobBoardDetailVO) {
		return jobBoardMapper.update(jobBoardDetailVO);
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
	
	//등록
	@Override
	public int regist(JobBoardDetailVO jobBoardDetailVO) {
		return jobBoardMapper.regist(jobBoardDetailVO);
	}
	
	//삭제
	public int delete(int bno) {
		return jobBoardMapper.delete(bno);
	}
	
	//조회수
	public int viewCount(int bno) {
		return jobBoardMapper.viewCount(bno);
	}
	

}