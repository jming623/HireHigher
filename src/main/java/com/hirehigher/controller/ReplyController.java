package com.hirehigher.controller;

import java.util.ArrayList;
import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hirehigher.command.WorkReplyVO;
import com.hirehigher.reply.service.ReplyService;
import com.hirehigher.util.ReplyCriteria;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	@Qualifier("replyService")
	private ReplyService replyService;
	
	@ResponseBody
	@PostMapping(value = "/replyRegist", produces = "application/json" ) //컨패스/reply/replyRegist
	public int replyRegist(WorkReplyVO vo) {
		System.out.println(vo.toString());
		int result = replyService.regist(vo);
		System.out.println("성공실패:" + result);
		
		
		return result;
	}
	
	//조회메서드 get
		@GetMapping("/getList/{bno}/{pageNum}")
		public HashMap<String, Object> getList(@PathVariable("bno") int bno,
											  @PathVariable("pageNum") int pageNum) {
		
			ReplyCriteria cri = new ReplyCriteria(pageNum, 20); //20개씩 데이터조회
			ArrayList<WorkReplyVO> list = replyService.getList(bno, cri);
			
			int total = replyService.getTotal(bno);
					
			HashMap<String, Object> map = new HashMap<>();
			map.put("list", list); //댓글 목록
			map.put("total", total); //전체게시글 수
			
			return map;
		}
		
		//수정요청
		@PostMapping(value = "update", produces = "application/json")
		public int update(@RequestBody WorkReplyVO vo) {
		
				return replyService.update(vo);
			
		}
		

}