package com.hirehigher.userquestion.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.jta.UserTransactionAdapter;

import com.hirehigher.command.BackgroundImgVO;
import com.hirehigher.command.FaqListPageVO;
import com.hirehigher.command.InsertQuestionPageVO;
import com.hirehigher.command.JobBoardVO;
import com.hirehigher.user.mapper.UserMapper;
import com.hirehigher.userquestion.mapper.UserQuestionMapper;
import com.hirehigher.util.mtomCriteria;

@Service("userQuestion")
public class UserQuestionServiceImpl implements UserQuestionService{

	
	@Autowired
	private UserQuestionMapper userQuestionMapper;

	@Override
	public ArrayList<FaqListPageVO> getFaqList() {
		return userQuestionMapper.getFaqList();
	}

	//등록
	@Override
	public int insertRegist(InsertQuestionPageVO vo) {
	
			return userQuestionMapper.insertRegist(vo);
	}
	
	@Override
	public int updateData(InsertQuestionPageVO vo) {
		
		return userQuestionMapper.updateData(vo);
	}

	@Override
	public ArrayList<InsertQuestionPageVO> getMtomList() {
		
		return userQuestionMapper.getMtomList();
	}

	@Override
	public InsertQuestionPageVO getUpdateInfo(int bno) {
		
		return userQuestionMapper.getUpdateInfo(bno);
	}

	@Override
	public int answerData(InsertQuestionPageVO vo) {
		
		return userQuestionMapper.answerData(vo);
	}

	@Override
	public int updatedelete(int bno) {
		
		return userQuestionMapper.updatedelete(bno);
	}

	//총게시글수
	@Override
	public int mtomgetTotal(mtomCriteria cri) {
		
		return userQuestionMapper.mtomgetTotal(cri);
	}

	@Override
	public ArrayList<InsertQuestionPageVO> mtomgetList(mtomCriteria cri) {
		
		return userQuestionMapper.mtomgetList(cri);
	}

	@Override
	public InsertQuestionPageVO imgDown(int bno) {
		
		return userQuestionMapper.imgDown(bno);
	}
}
