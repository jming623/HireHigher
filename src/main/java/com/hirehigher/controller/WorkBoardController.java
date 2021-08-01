package com.hirehigher.controller;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		//1. workBoard요청이 처음 들어오면 cri값으로 매핑되어 들어오는 값이 없어서 기본생성자로 생성될 때 선언된 값들로 초기화됨 (기본값 1 , 20 , 2D_ART)(WorkBoardCriteria클래스 참고)
//		System.out.println("확인2:" + cri.toString());
		
		//2. pageNum,amount,Category값을 가진 cri변수를 통해 DB에서 해당하는 리스트를 불러옴
		ArrayList<WorkBoardVO> workBoardList = workBoardService.getWorkBoardList(cri);
		
		//3. 만약 list를 잘 가지고 나와 null이 아니라면 아래 리턴 경로("workBoard/workBoard")로 값을 실어 보내줄 model객체에 list를 담아줌
		if(workBoardList != null) {
//			System.out.println(workBoardList.toString());
			model.addAttribute("listVO", workBoardList);
		}else {
			System.out.println("리스트가 없음");
		}
		
		//4. realEnd를 구하기위해 토탈값을 불러옴(카테고리별로 토탈값을 불러오기위해 cri에 Category값을 매개변수로 넣음)
		int Total = workBoardService.getTotal(cri.getCategory());
		
//		System.out.println("Total값:"+ Total);
		
		//5. cri에 담긴 pageNum과 amount, total값으로 페이지 정보를 불러옴
		WorkPageVO workPageVO = new WorkPageVO(cri, Total);
		
//		System.out.println("PageVO값:"+workPageVO.toString());
		
		//6. 아래 리턴 경로("workBoard/workBoard")로 값을 실어 보내줄 model객체에 pageVO를 담아줌
		model.addAttribute("pageVO", workPageVO);
		
		//7번은 workBoard.jsp에서 시작		
		return "workBoard/workBoard";
	}
	
	//이미지데이터 반환
	@ResponseBody
	@RequestMapping(value="/workBoardView/{productLocation}/{productName:.+}")
	public byte[] workBoardView(@PathVariable("productLocation") String productLocation,
								@PathVariable("productName") String productName) {
	
		//27. workBoard.jsp이미지 src경로에 pathValialve형식으로 이미지가 담긴 폴더명과 , 이미지의 파일명이 넘어옴.
		//실행경로 workBoard.jsp에 이미지 src요청 -> 컨트롤러에서 데이터를 받아 return값을 다시 페이지에 넘김 -> 컨트롤러로부터 받은 데이터를 토대로 화면에 이미지를 호출
			
		byte[] result = null;
		
		try {
			//파일데이터를 바이트데이터로 변환해서 반환
			
			//28. WORK_CONSTANT.UPLOAD_PATH에 경로를 자신의 로컬환경에 다시 맞춰야 이미지가 정상적으로 나옴.(이후 배포시 업로드 경로는 변경될 예정)
			File file = new File(WORK_CONSTANT.UPLOAD_PATH + "\\" + productLocation + "\\" + productName);
			
			//29. 이미지파일을 byte배열 형식으로 변경해 result변수에담음
			result = FileCopyUtils.copyToByteArray(file);
							
			} catch (Exception e) {
				e.printStackTrace();
		}
		
		//30. 화면단(workBoard.jsp)으로 이미지를 담은 byte[]를 반환 
		return result;
	}
	
	//workBoard스크롤시 리스트추가
	//31. workboard.jsp에 21번 요청과 연결됨
	@ResponseBody
	@PostMapping(value="addWorkList", produces="application/json")
	public ArrayList<WorkBoardVO> addWorkList(@RequestBody WorkBoardCriteria cri){
		
		System.out.println(cri.toString());
		
		ArrayList<WorkBoardVO> workBoardList = workBoardService.getWorkBoardList(cri);
		
		
		return workBoardList;
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
	public String workDetail(WorkBoardVO vo,Model model) {
		
		int boardBno = vo.getBno();
		
		WorkBoardVO boardVO = workBoardService.getDetail(boardBno);
		
//		System.out.println(boardVO.toString());
		
		model.addAttribute("boardVO", boardVO);
		
		return"workBoard/workDetail";
	}
	
	
	@RequestMapping("/workModify")
	public String workModify() {
		return"workBoard/workModify";
	}
	
}