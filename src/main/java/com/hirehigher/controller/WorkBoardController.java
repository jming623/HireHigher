package com.hirehigher.controller;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/workBoard")
	public String workBoard(WorkBoardCriteria cri , Model model) {
			
//		System.out.println("확인2:" + cri.toString());
				
		ArrayList<WorkBoardVO> workBoardList = workBoardService.getWorkBoardList(cri);
					
		if(workBoardList != null) {
//			System.out.println(workBoardList.toString());
			model.addAttribute("listVO", workBoardList);
		}else {
			System.out.println("리스트가 없음");
		}
		
//		String Category = cri.getCategory();
		
//		if(Category == null) {
//			return "main/main";
//		}
		
		int Total = workBoardService.getTotal(cri.getCategory());
		
//		System.out.println("Total값:"+ Total);
		
		WorkPageVO workPageVO = new WorkPageVO(cri, Total);
		
//		System.out.println("PageVO값:"+workPageVO.toString());
		
		model.addAttribute("pageVO", workPageVO);
		
		return "workBoard/workBoard";
	}
	
	//이미지데이터 반환
	@ResponseBody
	@RequestMapping(value="/workBoardView/{productLocation}/{productName:.+}")
	public byte[] workBoardView(@PathVariable("productLocation") String productLocation,
								@PathVariable("productName") String productName) {
		
			
		byte[] result = null;
		
		try {
			//파일데이터를 바이트데이터로 변환해서 반환
			
			File file = new File(WORK_CONSTANT.UPLOAD_PATH + "\\" + productLocation + "\\" + productName);
					
			result = FileCopyUtils.copyToByteArray(file);
							
			} catch (Exception e) {
				e.printStackTrace();
		}
		
		return result;
	}
	
	//workBoard스크롤시 리스트추가
	
	@ResponseBody
	@PostMapping(value="addWorkList", produces="application/json")
	public ArrayList<WorkBoardVO> addWorkList(@RequestBody WorkBoardCriteria cri){
		
		System.out.println(cri.toString());
		
		ArrayList<WorkBoardVO> workBoardList = workBoardService.getWorkBoardList(cri);
		
		
		return workBoardList;
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
