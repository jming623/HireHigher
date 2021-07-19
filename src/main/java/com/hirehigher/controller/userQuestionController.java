package com.hirehigher.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hirehigher.command.FaqListPageVO;
import com.hirehigher.user.service.UserService;
import com.hirehigher.userquestion.service.UserQuestionService;


@Controller
@RequestMapping("/userQuestion")
public class userQuestionController {
	
	
	@Autowired
	@Qualifier("userQuestion")
	private UserQuestionService userQuestionService;	
	
	//FAQ고객센터페이지 ---------------------------------
	@RequestMapping("/faqList")
	public String getfaqList(Model model) {
		
		ArrayList<FaqListPageVO> faqlist = userQuestionService.getFaqList();
		model.addAttribute("faqlist",faqlist);
		
		return "userQuestion/faqList";
	}
	
	//문의 등록 페이지 ---------------------------------
	@RequestMapping("/insertPage")
	public String insertPage() {
		
		return "userQuestion/insertPage";
	}
	//문의 내역 리스트 페이지 ---------------------------------
	@RequestMapping("/mtomPage")
	public void mtomPage() {
		
	}
	//문의 내역 답변 및 상세 페이지 ---------------------------------
	@RequestMapping("/questionDetail")
	public String questionDetail() {
		
		return "userQestion/questionDetail";
	}
	//문의 내역 수정 페이지 ---------------------------------
	@RequestMapping("/updatePage")
	public String updatePage() {
		return "userQuestion/insertPage";
	}
	
}
