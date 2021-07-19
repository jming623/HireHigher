package com.hirehigher.userquestion.service;

import java.util.ArrayList;

import com.hirehigher.command.FaqListPageVO;

public interface UserQuestionService {
	
	public ArrayList<FaqListPageVO> getFaqList(); //faq게시판 질문 답변 한번에 가져오기

}
