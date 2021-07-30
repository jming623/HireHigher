package com.hirehigher.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hirehigher.command.UserVO;

public class LoginSuccessHandler extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception { //Controller가 실행된뒤 실행되는 postHandle메서드 매개변수 modelAndView에는 컨트롤러에서 넘어온 값이 담겨있습니다.
		
		System.out.println("로그인 핸들러");
		
		ModelMap mv = modelAndView.getModelMap(); //컨트롤러로 부터 받아온 ModelAndView값을 꺼내는 매서드 반환타입=ModelMap
		
		UserVO userVO =(UserVO)mv.get("login"); //컨트롤러에서 addObject(키,값)으로 담은 값을 꺼내옴 \
		
		if(userVO != null) { 
			//로그인에 성공하였다면 세션에 유저정보를 저장합니다. 
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
			response.sendRedirect(request.getContextPath()); //홈화면으로 이동
		}
		
		//ModelAndView객체에 이동할 view정보를 저장, 이정보는 다시 컨트롤러로 이동
		modelAndView.setViewName("user/userLogin");
		
	}
	
	
}
