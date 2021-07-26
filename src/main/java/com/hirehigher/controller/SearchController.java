package com.hirehigher.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hirehigher.command.JobBoardVO;
import com.hirehigher.jobboard.service.JobBoardService;
import com.hirehigher.util.JobCriteria;
import com.hirehigher.util.JobPageVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	

	@Autowired
	@Qualifier("jobBoardService")
	private JobBoardService jobBoardService;
	
	
	//리스트 화면
	@RequestMapping("/WORKS")
	public String jobList(Model model, JobCriteria cri) { //Model은 스프링에서 자동 주입, jobList.jsp 검색, 댓글 form 태그에서 값 받음

		ArrayList<JobBoardVO> jobVOList = jobBoardService.getList(cri);
		int total = jobBoardService.getTotal(cri);
		JobPageVO jobPageVO = new JobPageVO(cri, total); //(기준 페이지, 총 페이지 수)

		//model에 담아서 화면으로
		model.addAttribute("jobPageVO", jobPageVO); //페이지 네이션 전달
		model.addAttribute("jobVOList", jobVOList); //게시글 리스트 전달

		return "jobBoard/jobList";
		//return type void로 주고 return 없애면 자동으로 jobList로 가짐
	}
}
