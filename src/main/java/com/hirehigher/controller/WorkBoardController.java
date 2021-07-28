package com.hirehigher.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hirehigher.command.WorkBoardVO;
import com.hirehigher.util.WorkBoardCriteria;
import com.hirehigher.util.WorkPageVO;
import com.hirehigher.workboard.service.WorkBoardService;

@Controller
@RequestMapping("/workBoard")
public class WorkBoardController {
	
	@Autowired
	@Qualifier("workBoardSerivce")
	private WorkBoardService workBoardService;

	@RequestMapping("/workBoard?Category=2D_ART")
	public String workBoard(WorkBoardCriteria cri , Model model) {
		
		ArrayList<WorkBoardVO> workBoardList = workBoardService.getWorkBoardList(cri);
		
		if(workBoardList != null) {
			model.addAttribute("listVO", workBoardList);
		} 
		
		String Category = cri.getCategory();
		
		if(Category == null) {
			return "main/main";
		}
		
		int Total = workBoardService.getTotal(Category);
		
		WorkPageVO workPageVO = new WorkPageVO(cri, Total);
		
		model.addAttribute("pageVO", workPageVO);
		
		return "workBoard/workBoard";
	}
		
	
	@RequestMapping("/workDetail")
	public String workDetail() {
		return "workBoard/workDetail";
	}
	
	@RequestMapping("/workModify")
	public String workModify() {
		return"workBoard/workModify";
	}
	
}
