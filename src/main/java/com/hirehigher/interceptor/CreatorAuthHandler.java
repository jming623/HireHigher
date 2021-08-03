package com.hirehigher.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hirehigher.command.UserVO;

public class CreatorAuthHandler extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("userVO");//request객체에서 세션을 얻어오고, 세션에서 userVO값을 얻어온다.
		
		if(userVO == null) {//로그인 되지않은상태
			response.sendRedirect(request.getContextPath()+"/user/access_fail");
		}	
		
		if(userVO.getUserType() == 1) { // 크리에이터인 유저 
			
			response.sendRedirect(request.getContextPath()+"/creator/creator_access_fail");
			
			return false;
		}else {
			return true;
		}
		
		
	}

	
}
