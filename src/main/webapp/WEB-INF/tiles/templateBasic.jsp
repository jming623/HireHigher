<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HireHigher</title>
	
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
      
    <!-- Masonry -핀터레스트형식 게시판 라이브러리 -->
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script> 
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>
    
    <!-- jcrop 이미지 편집기(사용고려)-->
    <link rel="stylesheet" href="https://unpkg.com/jcrop/dist/jcrop.css">
    <script src="https://unpkg.com/jcrop"></script>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
      
  	<!-- 카카오톡 공유하기 -->
  	<script src="${ pageContext.request.contextPath }/resources/js/star.js"/></script>
  	<!-- 메인화면 차트 -->
  	<script src="${ pageContext.request.contextPath }/resources/js/main-chart.js"/></script>
  	<!-- 카카오 로그인 -->
  	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  	
    <!-- 스타일시트(개인 css)는 아래에 추가해주세요 (src/webapp/resources/css에 필요한 css파일 추가하고 이곳에 선언해줍니다.)-->
    <!-- 기본선언 css,사이드바 -->
  	<link href="${pageContext.request.contextPath }/resources/css/Basic.css?113" rel="stylesheet">
  	<link href="${pageContext.request.contextPath }/resources/css/sideBar.css?111" rel="stylesheet">
  	<link href="${pageContext.request.contextPath }/resources/css/responsiveBasic.css" rel="stylesheet">
  	<!-- 헤더 검색창 분류 박스-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/headerjquery.js"></script>
  	<!-- 홈버튼 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
	<!-- 메뉴 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <!-- 준명 -->
    <link href="${pageContext.request.contextPath }/resources/css/workBoard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/creator.css?3" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/mypage.css?2" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/creator.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/mypage.css?5" rel="stylesheet">
    <!-- 우현이형 -->
    <link href="${pageContext.request.contextPath }/resources/css/userJoin.css?2" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/userLogin.css?2" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/creatorApply.css?1" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/jobBoard.css?22" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/jobDetail.css?22" rel="stylesheet">
    <!-- 우현이형 >> jobModify 지혁 추가 수정 본 -->
    <link href="${pageContext.request.contextPath }/resources/css/jobModify.css?11" rel="stylesheet">
    <!-- 우진 -->
    <!-- 4d5cac4ade929922b4a884e5a7d924d0 = 카카오톡 js키 -->
    <link href="${pageContext.request.contextPath }/resources/css/kakao.css?1" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/workDetail.css?2" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/workModify.css?1" rel="stylesheet">
     <!-- 현우 -->
    <!-- FAQ 고객센터 페이지 -->
    <link href="${pageContext.request.contextPath }/resources/css/faqList.css?1" rel="stylesheet">   
	<!-- 문의 등록 페이지 -->
	<link href="${pageContext.request.contextPath }/resources/css/insertPage.css?1" rel="stylesheet">
	<!--  1:1 문의 내역 페이지 -->
	<link href="${pageContext.request.contextPath }/resources/css/mtomPage.css?2" rel="stylesheet">
	<!-- 1:1 문의 내역 상세페이지 -->
	<link href="${pageContext.request.contextPath }/resources/css/questionDetail.css?2" rel="stylesheet">
	<!-- 1:1 문의 수정 페이지 -->
	<link href="${pageContext.request.contextPath }/resources/css/updatePage.css?2" rel="stylesheet">
	<!-- 모달 -->
	<link href="${pageContext.request.contextPath }/resources/css/questionModal.css?1" rel="stylesheet">
</head>
<body>
	<!-- 헤더영역 -->
	<tiles:insertAttribute name="header"/>
	<!-- 사이드바 -->
	<tiles:insertAttribute name="side"/>
	<!-- 본문영역 -->
	<tiles:insertAttribute name="body"/>
	<!-- 푸터영역 -->
	<tiles:insertAttribute name="footer"/>
	<!-- 반응형 메뉴, 사이드바 애니메이션 -->
	<script src="${ pageContext.request.contextPath }/resources/js/responsivemenu.js?22"/></script>
</body>
</html>