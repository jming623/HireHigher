package com.hirehigher.util;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;

import com.hirehigher.counter.service.CounterService;

@Component
public class Counter implements HttpSessionListener, ApplicationContextAware{

	//-----------------------------SERVICE 연결-----------------------------
	@Autowired
	@Qualifier("CounterService")
	private CounterService cs;
	//-----------------------------SERVICE 연결-----------------------------

	/* 기본 짚고 가기:
	 * WAS와 브라우저의 통신 방식은 HTTP 프로토콜인데 이 방식은 비접속형 프로토콜로 WAS와 브라우저의 연결은 지속되지 않는다(HTTP = 접속시마다 새로운 네트워크 연결 생성)
	 * 따라서 WAS는 사용자 접속 정보를 유지하기 위해  세션을 만들어 사용자의 요청 header에 포함된 쿠키값의 세션값과 비교해서 사용자를 구분한다.
	 * 세션은 웹서버 접속마다 생성(새로고침도 새로운 세션 생성, 유지하려면 세션 유지 설정 따로), 브라우저 끄면 파괴
	 * 
	 * 리스너란 어떤 이벤트가 발생했을 때 호출되고 어떤 작업을 처리하는 객체를 의미
	 * HttpSessionListener를 구현하면 sessionCreated(HttpSessionEvent se), sessionDestroyed(HttpSessionEvent se) 
	 * 두개의 메서드를 구현해야 함. 세션이 생성(created) 또는 파괴(destroyed)될 때 이벤트가 발생해 해당 이벤트를 처리 할 수 있는 메서드이다.
	 */
	/* 객체, 메서드 설명:
	 * HttpSessionEvent 객체는 생성되거나 삭제되는 세션에 대한 정보를 담고, getSession() 메서드를 통해 가져온 세션 확인 가능
	 * HttpServletRequest 인터페이스의 getSession() 메서드는 서버에 생성된 세션이 있으면 그 세션 객체를 반환, 없으면 새로운 세션 객채 생성해서 반환
	 * HttpSession 인터페이스의 isNew()메서드는 새로운 세션(세션 ID가 할당 되지 않았을 경우)이면 true를 반환 
	 * 
	 * ApplicationContextAware 인터페이스를 상속받아서 구현할 메서드는 setApplicationContext()인데 이를 구현해주면 
	 * applicationContext에 접근해서 등록된 다른 bean 얻을수도 있다 
	 */
	/* 중요: 
	 * 리스너는 web.xml에 <listner></listenr> 태그를 사용해서 톰캣의 이벤트 리스너에 등록을 해서 사용한다 또는 @WebListener 어노테이션을 통해서 등록 가능하다 
	 * 하지만 리스너를 web.xml에 등록하면 스프링 컨테이너로 넘어오기 전에 WAS(?)에서 먼저 실행이 되기 때문에 Spring Container에서 관리하는 bean들을 가져올 수 없어서 Null이 뜬다
	 * 해결 방법은 ServletContext객체의 addListener() 메서드로 리스너가 스프링 컨테이너와 같이 등록되도록 설정하는 것인데
	 * ApplicationContextAware 인터페이스  상속받고 setApplicationContext메서드 오버라이딩해서 설정해주면 된다(상세 설명 아래 추가 설명)
	 */
	 
	
	//아래 작업 context에 대한 이해 필요
	//--------------------리스너에서 Spring Container에서 관리되는 bean들을 주입 가능하게 하기 위한 작업--------------------
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		if (applicationContext instanceof WebApplicationContext) {
			((WebApplicationContext) applicationContext).getServletContext().addListener(this);
			/* 
			 * addListner() 메서드 인자로 넣을 리스너를 넣는다(임의로 만든 리스너는 6가지 리스너중 하나를 반드시 구현 - 메서드 설명 참고),
			 * 그러면 리스너는 ServletContext에 추가되고(리스너는 보통 ServletContext, 즉 WAS단에서 실행되는게 보통), 
			 * getServletContext()를 메서드를 통해 리스너가 담긴 SevletCotnext를 반환하고
			 * applicationContext객체에 넣어준 뒤 WebApplicationContext로 형변환 하면, 이제 ApplicationContext에서 내가 만든
			 * 리스너  bean을 찾을수 있다! 내가 만든 리스너가 @Component 어노테이션을 통해서 bean으로 생성됨!
			 * 신기하게 ServletContext와 ApplicationContext는 결국 연결이 되어있는데 ApplicationContext를 확장(상속)한 인터페이스인 WebApplicationContext의
			 * getServletContext()메서드를 통해서 SevletContext를 가져올수 있기 때문!
			 * 
			 * ServletContext는 톰캣 서블렛 컨테이너 실행시 각 웹 애플리케이션마다 한 개씩 생성 (톰캣 종료시 소멸)
			 * ApplicationContext(스프링 최상위 context)는 스프링에 의해서 초기화, WebApplicationContext는 자식 context이다 
			 * ServletContext가 ApplicationContext(root(spring)과 servlet(spring))를 감싸고 있다
			 * DispatcherServlet은 WebApplicationContxet를 이용해서 자신을 설정
			 */
		} else {
			throw new RuntimeException("Web Application Context 내부에 위치시키세요");
		}
	}  
	//--------------------리스너에서 Spring Container에서 관리되는 bean들을 주입 가능하게 하기 위한 작업--------------------

	//[1-1]. 차트데이터 (MianController에서 Counter클래스 @Inject해서 뽑아서 모델에 담기위한 함수)
	//sessionScope으로는 js 적용 x!?
	public ArrayList<ArrayList<Integer>> chartDataCounter() {
		
			//일일 방문자 수
			//7번 = 오늘, 1번  = 6일 전 
			int visitsPerDay7 = cs.visitsPerDay7();
			int visitsPerDay6 = cs.visitsPerDay6();
			int visitsPerDay5 = cs.visitsPerDay5();
			int visitsPerDay4 = cs.visitsPerDay4();
			int visitsPerDay3 = cs.visitsPerDay3();
			int visitsPerDay2 = cs.visitsPerDay2();
			int visitsPerDay1 = cs.visitsPerDay1();
					
			//일일 게시글 수
			//7번 = 오늘, 1번  = 6일 전
			int postsPerDay7 = cs.postsPerDay7();
			int postsPerDay6 = cs.postsPerDay6();
			int postsPerDay5 = cs.postsPerDay5();
			int postsPerDay4 = cs.postsPerDay4();
			int postsPerDay3 = cs.postsPerDay3();
			int postsPerDay2 = cs.postsPerDay2();
			int postsPerDay1 = cs.postsPerDay1();
			
			//일일 방문자수 리스트
			ArrayList<Integer> visitsPerDayList = new ArrayList<Integer>();
			visitsPerDayList.add(visitsPerDay1);
			visitsPerDayList.add(visitsPerDay2);
			visitsPerDayList.add(visitsPerDay3);
			visitsPerDayList.add(visitsPerDay4);
			visitsPerDayList.add(visitsPerDay5);
			visitsPerDayList.add(visitsPerDay6);
			visitsPerDayList.add(visitsPerDay7);
			
			//일일 게시글 수 리스트
			ArrayList<Integer> postsPerDayList = new ArrayList<Integer>();
			postsPerDayList.add(postsPerDay1);
			postsPerDayList.add(postsPerDay2);
			postsPerDayList.add(postsPerDay3);
			postsPerDayList.add(postsPerDay4);
			postsPerDayList.add(postsPerDay5);
			postsPerDayList.add(postsPerDay6);
			postsPerDayList.add(postsPerDay7);
			
			//일일 데이터 리스트(일일 방문자 수 리스트 + 일일 게시글 수 리스트)
			ArrayList<ArrayList<Integer>> chartDataList = new ArrayList<ArrayList<Integer>>();
			chartDataList.add(visitsPerDayList);
			chartDataList.add(postsPerDayList);
			
		return chartDataList;		
	}
	
	//[1-2]. 세션이 생성되면 리스너가 감지하고 sessionCreated() 실행
	@Override
	public void sessionCreated(HttpSessionEvent sessionEvent) {

		//새로운 세션이라면 아래 정의한 coutner함수를 실행시켜 방문자 카운트 처리 작업 실행
		if(sessionEvent.getSession().isNew()) {
			counter(sessionEvent);
		}
	}
	//[1-3]. 누적데이터 작업 메서드
	public void counter(HttpSessionEvent sessionEvent) {

		try {
			//방문자 카운트
			cs.countVisits();
			//총 방문자 수
			int totalVisits	= cs.totalVisits();
			//총 게시글 수
			int totalPosts = cs.totalPosts();
			//총 유저 수
			int totalUsers = cs.totalUsers();
			
			HttpSession session = sessionEvent.getSession();

			//메인 페이지에 사용할 (비즈니스 로직에서 처리한) 데이터 세션에 저장 (main.jsp 에서 sessionScope 으로 받기)
			session.setAttribute("totalVisits", totalVisits);
			session.setAttribute("totalPosts", totalPosts);
			session.setAttribute("totalUsers", totalUsers);
			
		} catch (Exception e) {
			System.out.println("VisitorCounter 작동 실패");
			e.printStackTrace();
		}	

	}

	//[2]. 세션이 무효화되면 리스너가 감지하고 sessionDestroyed() 실행
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("세션 종료");
	}


	/* 생각해볼 것:
	 * 세션은 서버측에 데이터를 저장한다. 만약 엄청난 수의 방문자가 접속한다면 서버쪽에 
	 * 과부하가 올텐데 어떻게 해결할까
	 */
}

