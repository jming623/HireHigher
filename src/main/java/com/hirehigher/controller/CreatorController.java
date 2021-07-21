package com.hirehigher.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hirehigher.command.CreatorVO;
import com.hirehigher.command.UserVO;
import com.hirehigher.creator.service.CreatorService;

@Controller
@RequestMapping("/creator")
public class CreatorController {

	@Autowired
	@Qualifier("creatorService")
	private CreatorService creatorService;
	
	// 제작자 신청 화면
	@RequestMapping("/creatorApply")
	public String creatorApply() {
		
		
		return "/creator/creatorApply";
	}
	
	// 제작자 신청 요청
	@RequestMapping("applyForm")
	public String applyForm(UserVO userVO,
							CreatorVO creatorvo,
							HttpSession session,
							RedirectAttributes RA) {
		
		userVO = (UserVO)session.getAttribute("userVO"); // session에 있는 userVO를 얻음
		creatorvo.setCreatorId(userVO.getUserId()); // userId를 creatorVO의 creatorId에 저장
		String creatorId = creatorvo.getCreatorId(); // creatorId 변수에 creatorVO의 creatorId를 저장
		
		int result = creatorService.apply(creatorvo); // apply함수 결과를 result 변수에 저장
		
		if(result == 1) { // 요청 성공
			userVO.setUserType(1); // userVO의 userType 값을 1로 저장 (1인 경우 제작자)
			int userType = userVO.getUserType(); // userType 변수에 userVO의 userType을 저장
			creatorService.apply1(userVO); // apply1 함수 결과
			RA.addFlashAttribute("msg", "판매자 신청이 완료 되었습니다.");
		} else { // 요청 실패
			RA.addFlashAttribute("msg", "등록에 실패했습니다. 다시 시도해주세요");
		}
		
		return "redirect:/creator/creatorDetail";
	}
	
	// 제작자 페이지 화면
	@RequestMapping("/creatorDetail")
	public String creatorDetail() {
		
		
		
		return "/creator/creatorDetail";
	}

	// 제작자 페이지 수정 화면
	@RequestMapping("/creatorModify")
	public String creatorModify() {
		
		
		
		return "/creator/creatorModify";
	}
}
