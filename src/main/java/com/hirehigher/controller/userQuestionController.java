package com.hirehigher.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hirehigher.command.FaqListPageVO;
import com.hirehigher.command.InsertQuestionPageVO;
import com.hirehigher.command.QuestionDetailVO;
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
	public void insertPage() {
		
	}
	
	
	@RequestMapping(value="/insertQ",method=RequestMethod.POST)
	public String insertQ(InsertQuestionPageVO vo, 
							RedirectAttributes RA) {
		
		
		int result = userQuestionService.insertRegist(vo); //성공시 1반환, 실패시 0
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "등록 처리 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "등록에 실패했습니다. 다시 시도하세요");
		}
		
		return "redirect:/userQuestion/mtomPage";
	}
	
	
	
	
	//문의 내역 수정 페이지 ---------------------------------
//	@RequestMapping("/updatePage")
//	public String updatePage() {
//		return "userQuestion/updatePage";
//	}
		
//	@RequestMapping("/updatePage")
//	public String updatePage(Model model) {
//		
//		ArrayList<InsertQuestionPageVO> update = userQuestionService.getUpdateInfo();
//		model.addAttribute("update",update);
//		
//		return "userQuestion/updatePage";
//	}
	
	@RequestMapping("/updatePage")
	public void updatePage(@RequestParam("insertBno") int bno,Model model) {
		
		InsertQuestionPageVO update = userQuestionService.getUpdateInfo(bno);
		model.addAttribute("update",update);
		
		//return "userQuestion/updatePage";
	}
	
	@RequestMapping(value="/updateForm",method=RequestMethod.POST)
	public String updateData(InsertQuestionPageVO vo, 
							RedirectAttributes RA) {
		
		System.out.println(vo.toString());
		
		int result = userQuestionService.updateData(vo); //성공시 1반환, 실패시 0
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "등록 처리 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "등록에 실패했습니다. 다시 시도하세요");
		}
		
		return "redirect:/userQuestion/mtomPage";
	}
	
	
	
	//문의 내역 리스트 페이지 ---------------------------------
//	@RequestMapping("/mtomPage")
//	public void mtomPage() {
//		
//		
//	}
	@RequestMapping("/mtomPage")
	public String mtomPage(Model model) {
		
		ArrayList<InsertQuestionPageVO> mtomList = userQuestionService.getMtomList();
		model.addAttribute("mtomList",mtomList);
		
		return "userQuestion/mtomPage";
	}
	
	
	
	//문의 내역 답변 및 상세 페이지 ---------------------------------
	@RequestMapping("/questionDetail")
	public void questionDetail(@RequestParam("insertBno") int bno,
								Model model) {
		
		InsertQuestionPageVO qdetail = userQuestionService.getUpdateInfo(bno);
		model.addAttribute("qdetail",qdetail);
		
	}
	
	@RequestMapping("/answerForm")
	public String answerForm(InsertQuestionPageVO vo, RedirectAttributes RA) {

		System.out.println(vo.toString());
		
		int bno = vo.getInsertBno();
		
		int result = userQuestionService.answerData(vo); // 성공시 1반환, 실패시 0

		if (result == 1) {
			RA.addFlashAttribute("msg", "등록 처리 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "등록에 실패했습니다. 다시 시도하세요");
		}

		return "redirect:/userQuestion/questionDetail?insertBno="+bno;
	}
	
	//문의 내역 삭제 --------------------------------------------
	//글 삭제
	@RequestMapping("/updateDelete")
	public String updateDelete(@RequestParam("insertBno") int bno,RedirectAttributes RA) {
		
		int result = userQuestionService.updatedelete(bno); //성공시 1반환, 실패시 0
		
		if (result == 1) {
			RA.addFlashAttribute("msg", "삭제 처리 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "삭제에 실패했습니다. 다시 시도하세요");
		}

		
		return "redirect:/userQuestion/mtomPage";
	}
	
	
}
