package com.hirehigher.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hirehigher.command.WorkBoardVO;
import com.hirehigher.util.WorkBoardCriteria;
import com.hirehigher.util.WorkPageVO;
import com.hirehigher.workboard.service.WorkBoardService;


@Controller
@RequestMapping("/workBoard")
public class WorkBoardController {
	
	@Autowired
	@Qualifier("workBoardService")
	private WorkBoardService workBoardService;

	@RequestMapping("/workBoard") //get방식으로 받겠다
	public String workBoard(WorkBoardCriteria cri , Model model) {
			

		System.out.println("확인2:" + cri.toString());
		
		
		ArrayList<WorkBoardVO> workBoardList = workBoardService.getWorkBoardList(cri);
		
		if(workBoardList != null) {
			model.addAttribute("listVO", workBoardList);
		}else {
			System.out.println("리스트가 없음");
		}
		
//		String Category = cri.getCategory();
		
//		if(Category == null) {
//			return "main/main";
//		}
		
		int Total = workBoardService.getTotal(cri.getCategory());
		
		System.out.println("Total값:"+ Total);
		
		WorkPageVO workPageVO = new WorkPageVO(cri, Total);
		
		System.out.println("PageVO값:"+workPageVO.toString());
		
		model.addAttribute("pageVO", workPageVO);
		
		return "workBoard/workBoard";
	}
		
	
//	@RequestMapping({"/workDetail", "/workModify"})
//	public void getDetail(@RequestParam("bno") int bno, 
//						  Model model) {
//		
//		WorkBoardVO boardVO = workBoardService.getDetail(bno);
//		model.addAttribute("boardVO", boardVO);
//		
//	}
	@RequestMapping("/workDetail")
	public String workDetail() {
		return"workBoard/workDetail";
	}
	
	
	@RequestMapping("/workModify")
	public String workModify() {
		return"workBoard/workModify";
	}
	
}