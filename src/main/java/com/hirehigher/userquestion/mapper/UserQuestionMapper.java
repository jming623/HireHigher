package com.hirehigher.userquestion.mapper;

import java.util.ArrayList;

import com.hirehigher.command.FaqListPageVO;

public interface UserQuestionMapper {

	public ArrayList<FaqListPageVO> getFaqList(); //모든 게시물 가져오기
}
