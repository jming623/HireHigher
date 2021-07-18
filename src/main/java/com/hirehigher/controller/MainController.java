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
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	//차트데이터 뽑기 위한 인젝션
	@Inject
	private Counter counter;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		//-----------------------Counter 리스너 클래스에서 CHART DATA 가져오는 처리----------------
		
		model.addAttribute("visitsPerDay", counter.chartDataCounter().get(0).get(7));
		model.addAttribute("postsPerDay", counter.chartDataCounter().get(1).get(7));
		
		//-----------------------Counter 리스너 클래스에서 CHART DATA 가져오는 처리----------------

		
		return "main/main";
	}
	
}
