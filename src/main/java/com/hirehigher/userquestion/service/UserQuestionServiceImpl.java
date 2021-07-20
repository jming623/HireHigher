package com.hirehigher.userquestion.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirehigher.command.FaqListPageVO;
import com.hirehigher.user.mapper.UserMapper;
import com.hirehigher.userquestion.mapper.UserQuestionMapper;

@Service("userQuestion")
public class UserQuestionServiceImpl implements UserQuestionService{

	
	@Autowired
	private UserQuestionMapper userQuestionMapper;

	@Override
	public ArrayList<FaqListPageVO> getFaqList() {
		return userQuestionMapper.getFaqList();
	}
}
