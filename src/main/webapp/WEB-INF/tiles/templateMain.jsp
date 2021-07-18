<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HireHigher</title>
</head>
	
	<!-- chart.js참조링크 -->
	<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.esm.min.js"></script> -->
	<!-- 메인페이지 차트 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.esm.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.esm.min.js"></script>\

	<!--<script src="${ pageContext.request.contextPath }/resources/js/main-chart.js"/></script> <!-- 바디영역이 실행되기전에 id값을 받아올 수 없음, window.onload선언 필요 -->
	<script type="module" src="${ pageContext.request.contextPath }/resources/js/main.js"/></script>
	
	<!-- 메인페이지 스타일시트 -->
	<link href="${pageContext.request.contextPath }/resources/css/main.css?11" rel="stylesheet">
	<!-- 홈버튼 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
	<!-- 메뉴 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">

<body>
	<!-- 헤더영역 -->
	<tiles:insertAttribute name="header"/>
	<!-- 본문영역 -->
	<tiles:insertAttribute name="body"/>
	<!-- 푸터영역 -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>