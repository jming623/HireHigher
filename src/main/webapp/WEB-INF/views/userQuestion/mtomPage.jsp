<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <section>
	<div class="container">
	   <div class="row">
			 <div class="MtoM-all">
				<!---------- 상단 선택 박스 영역 -------------->
				<div class="MtoM-question-mtom">
				   <p>1:1 문의 내역</p>
				   <div class="MtoM-question-mtom-go">
				  
					  <button type="button" class="btn btn-danger"
						 onclick="location.href='insertPage'">문의하기</button>
					
				   </div>
				</div>
 
				<div class="MtoM-top-select-box">
				  
					<form action="mtom-optionForm">
				   <div class="MtoM-top-select-right">
				   
				   
					  <select name="mtomSelect" id="mtomSelect" style="margin-bottom:10px;">
						 <!-- 선택박스 오른쪽 영역-->
						 
						 <option value="5" 
						 <c:if test="${mtomPageVO.displayRow eq 5}">selected</c:if>>5개 보기
						 </option>
						 
						 <option value="10"
						 <c:if test="${mtomPageVO.displayRow eq 10}">selected</c:if>>10개 보기
						 </option>
						 
						 <option value="30"
						 <c:if test="${mtomPageVO.displayRow eq 30}">selected</c:if>>30개 보기
						 </option>
					  </select>
					  
			   
				   </div>
				 </form> 
 
				</div>
				<!------------ 하단 문의내역 박스 영역 ----------->
				<div class="MtoM-bottom-question-box">
 
				   <ul class="MtoM-bottom-question-box-ul">
					  <!-- 체크박스-->
					  <li class="MtoM-question-num">번호</li>
					  <li class="MtoM-question-sel">분류</li>
					  <li class="MtoM-question-ck">작성자</li>
					  <li class="MtoM-question-title">제목</li>
					  <li class="MtoM-question-show">답변 상태</li>
					  <li class="MtoM-question-date">작성일</li>
					  <li class="MtoM-question-option">관리</li>
				   </ul>
 
				</div>
 
				<!-- 문의 내역---------------------- -->
				<form action="" name="mtomPageForm">
				<c:forEach var="mtom" items="${mtomList}" varStatus="index">
 
				   <div class="MtoM-answer-box">
					  <!-- 글 1 -->
					  <ul class="MtoM-answer-box-ul">
						
						 
						 <li class="MtoM-answer-box-num">${mtom.insertBno}</li>
						 <!-- 번호 -->
						 <li class="MtoM-answer-box-sel">${mtom.insertKind}</li>
						 <!-- 분류-->
						  <li class="MtoM-answer-box-ck">${mtom.insertId}</li><!-- 아이디 넣기 -->
						  <!-- 아이디 -->
						 <li class="MtoM-answer-box-title"><a href="questionDetail?insertBno=${mtom.insertBno}">${mtom.insertTitle}</a></li>
						 <!-- 제목-->
						 <li class="MtoM-answer-box-show">${mtom.answerStatus}</li>
						 <!--답변 상태 -->
						 <li class="MtoM-answer-box-date">${mtom.insertDate}</li>
						 <!-- 작성일-->
						 <li class="MtoM-answer-box-option">
							<!-- 관리-->
							
							<button type="button" class="MtoM-btn-go btn btn-default"
							   onclick="location.href='questionDetail?insertBno=${mtom.insertBno}'">상세보기</button>
							<button type="button" class="MtoM-btn-update btn btn-default">수정</button>
							<button type="button" class="MtoM-btn-del btn btn-default">삭제</button>
						 	
						 	<!-- onclick="location.href='updateDelete?insertBno=${mtom.insertBno}'" -->
					
						 	
						 </li>
					  </ul>
					  <!-- 글 종료 -->
				   </div>
				   <!-- 문의 내역 종료 -->
				</c:forEach>
				
				<div class="mtomListpage-num">
						 
				   <c:if test="${mtomPageVO.mtomprev}">         
				   <button type="button" class="mtom-btn-before btn btn-default" 
					  onclick="location.href='mtomPage?currentPage=${mtomPageVO.beginPage-1}&displayRow=${mtomPageVO.displayRow}'">이전</button>
				   </c:if>
									 
				   <!-- 페이지 버튼 숫자 -->
				   <c:forEach var="num" begin="${mtomPageVO.beginPage}" end="${mtomPageVO.endPage}">         
					  <button type="button" class="${mtomPageVO.currentPage eq num ? 'active' : ''} mtom-btn btn btn-default"
					  onclick="location.href='mtomPage?currentPage=${num}&displayRow=${mtomPageVO.displayRow}'">${num}</button>
				   </c:forEach>
			 
				   <c:if test="${mtomPageVO.mtomnext}">
				   <button type="button" class="mtom-btn-next btn btn-default"
					  onclick="location.href='mtomPage?currentPage=${mtomPageVO.endPage + 1}&displayRow=${mtomPageVO.displayRow}'">다음</button>
				   </c:if>
					  
				</div>
				</form>
			 </div>   
	   </div>
	</div>
 </section>

 <script>
 
 var userId = '${sessionScope.userVO.userId}'; 
 console.log(userId);

 $(".MtoM-btn-update").click(function(){
	 
	 var bno = $(this).parent().prev().prev().prev().prev().prev().prev().text();
	 console.log(bno);
	 
	 if($(this).parent().prev().prev().prev().prev().text() == userId){
		 if(".MtoM-btn-update"){
			location.href ="updatePage?insertBno="+bno; 
		 }
	 }else{
		 alert("권한이 없습니다.");
		 return;
	 }
 });
 
 $(".MtoM-btn-del").click(function(){
	 
	 var bno = $(this).parent().prev().prev().prev().prev().prev().prev().text();
	 console.log(bno);
	 
	 if($(this).parent().prev().prev().prev().prev().text() == userId){
		 if(".MtoM-btn-del"){
			location.href="updateDelete?insertBno="+bno;
		 }
	 }else{
		 alert("권한이 없습니다.");
		 return;
	 }
 });
 </script>

 
<script>
	var msg = "${msg}";
	if (msg != '') {
		alert(msg);
	}
</script>

 
 <script>
	$("#mtomSelect").change(function(){
	   var displayRow = event.target.value;      
	   
	   location.href="mtomPage?currentPage=1&displayRow="+displayRow;
	});   
 </script>