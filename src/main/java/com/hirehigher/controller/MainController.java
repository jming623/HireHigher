package com.hirehigher.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hirehigher.counter.service.CounterService;
import com.hirehigher.util.Counter;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/main")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/*
	 * Simply selects the home view to render by returning its name.
	 */

	//차트데이터 뽑기 위한 인젝션
	@Inject
	private Counter counter;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		//-----------------------Counter 리스너 클래스에서 차트 데이터 처리 결과 가져오는 처리----------------
		
		/*
		 * Counter 클래스의 chartDataCounter함수 리턴 값 ArrayList<ArrayList<Integer>> 자료형 이고 0번 인덱스에는 
		 * 일일 방문자 수 리스트가 담겨있고, 1번 인덱스에는 일일 게시글 수 리스트가 각 7일치씩 담겨있음, 이렇게 꺼낸 ArrayList<Integer>
		 * 에서 다시 안에 담긴 Integer 랩퍼 객체(내부에 일일 데이터) 꺼낸 후 모델에 담고, 스크립트 태그 내부 차트 datasets에 넣어서 
		 * 동적으로 데이터 처리함
		 */
		//일일 방문자 수 가져오기 
		for (int i = 1; i <= 7; i++) {
			model.addAttribute("visitsPerDay" + i, counter.chartDataCounter().get(0).get(i-1));
		}
		
		//일일 게시글 수 가져오기
		for (int i = 1; i <= 7; i++) {
			model.addAttribute("postsPerDay" + i, counter.chartDataCounter().get(1).get(i-1));
		}
		
		//-----------------------Counter 리스너 클래스에서 CHART DATA 가져오는 처리----------------

		
		return "main/main";
	}
	
}
