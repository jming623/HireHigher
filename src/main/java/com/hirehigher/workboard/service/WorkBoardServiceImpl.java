package com.hirehigher.workboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirehigher.command.WorkBoardVO;
import com.hirehigher.util.WorkBoardCriteria;
import com.hirehigher.workboard.mapper.WorkBoardMapper;

@Service("workBoardService")
public class WorkBoardServiceImpl implements WorkBoardService {

	@Autowired
	private WorkBoardMapper workBoardMapper;

	@Override
	public ArrayList<WorkBoardVO> getWorkBoardList(WorkBoardCriteria cri) {
		
		return workBoardMapper.getWorkBoardList(cri);
	}

	@Override
	public int getTotal(String Category) {
	
		return workBoardMapper.getTotal(Category);
	}
	
}
