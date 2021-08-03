<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



  <section>
        <div class="container">
            <div class="row">
            
                <div class="QD-all">
                    <div class="QD-left-sector">
                    	<ul>
                         <li><a href="faqList">FAQ고객센터</a></li>
                        <li><a href="mtomPage">1:1문의내역</a></li>
                        <li><a href="../user/mypage">마이페이지</a></li>
                    	</ul>
                    </div>
                    <div class="QD-right-sector">
                    <!-- 질문자 질문날짜 조회수  구역-->
                    <div class="QD-question-user-box">
                        <ul class="QD-question-user-box-ul">
                            <li class="QD-question-user-li-id">아이디  : ${qdetail.insertId}</li><!-- 아이디 -->
                            <li class="QD-question-user-li-date">작성일 :   ${qdetail.insertDate}</li><!-- 작성 날짜 -->
                            <li class="QD-question-user-li-look"><!-- 조회수 -->
                                <img src="" alt="">${qdetail.answerStatus}
                            </li>
                        </ul>
                    </div>
			
                    <!-- 질문 답변 내역 구역 -->
                   
                    <div class="QD-question-answer-box">
                        <!-- 질문 구역 -->
                        <div class="QD-question-sector-box">
                            <div class="QD-question-title"><!-- 질문 제목 구역-->
                                <p>${qdetail.insertTitle}</p>
                                
                                <!-- 모달창 -->
								<div class="QD-question-btn-modal" id="root">
									
									
									<button type="button" id="QDqustiondel" class="QD-question-btn-delete btn btn-default" onclick="location.href='updateDelete?insertBno=${qdetail.insertBno}'">삭제</button>
									<button type="button" id="QDqustionup" class="QD-question-btn-update btn btn-default" onclick="location.href='updatePage?insertBno=${qdetail.insertBno}'">수정</button>
									
									
									<button
										class="QDbuttonuser QD-question-btn btn btn-default modal-start-button btn btn-default"
										type="button" id="modal-question_opne_btn">답변등록
									</button>
									
								</div>


							</div>
							<form action="answerForm" method="post">
							<div id="question-modal">

										<div class="modal_content">
											<div class="question-title-modal">
												<h2>문의내역 답변</h2>
											</div>


											<div class="question-input-madal-all">

												<div>
													<div class="question-modal-box">
														<div class="question-modal-box-num">
															글번호
															<p> ${qdetail.insertBno}</p>
															<input type=hidden name="insertBno" value="${qdetail.insertBno}">
														</div>
														<div class="question-modal-box-title">
															문의 제목
															<p>${qdetail.insertTitle}</p>
														</div>
														<div class="question-modal-box-kind">
															문의 분류
															<p>${qdetail.insertKind}</p>
														</div>
														<div class="question-modal-box-content">
															문의 내용
															<p>${qdetail.insertContent}</p>
														</div>
														
														<div class="question-modal-box-status"><input name="answerStatus" value="답변 완료"></div>
													</div>
												</div>
												
												
												<div class="answer-modal-box">
													<div>
														<div>
															<p>문의 답변 제목</p>
														</div>
														<input class="question-input-modal" type="text" name="answerTitle">
													</div>
													<div>
														<div>
															<p>문의 답변 내용</p>
														</div>
														<textarea class="question-textarea-modal" name="answerContent" id=""
															cols="30" rows="15"></textarea>
													</div>
												</div>
											</div>
											
											<div class="question-modal-btn">
												<button class="question-modal-btn-right btn btn-danger" type="button" id="modal-question_close_btn">취소 하기</button>
												<button class="question-modal-btn-left btn btn-info" type="submit" id="">답변 등록</button>
											</div>

										</div>

										<div class="modal_layer"></div>
									</div>
									</form>
									<!-- 모달창 -->	

                            <div class="QD-question-content"><!-- 질문 내용 구역-->
                                <img alt="" src="questionView/${qdetail.insertImg}">
                                <p>
                                    ${qdetail.insertContent}
                                </p>
                            </div>
                        </div>

                        <!-- 답변 구역 -->
                        
        				<c:if test="${qdetail.answerTitle ne null}">
                        <div class="QD-answer-sector-box">
                            <div class="QD-answer-title-content"><!-- 답변 제목 및 답변일 구역 -->
                                
                                <div class="QD-answer-mark"> <!-- 답변 마크 -->
                                    <div class="QD-answer-mark-s"></div>
                                </div> 
                                <div class="QD-answer-title"><!-- 답변 제목-->
                                    <p class="QD-site-name" style="margin-right: 10px;">[HireHigher]</p>
                                    <p style="margin-right: 3px;"></p>
                                    <P>${qdetail.answerTitle}</P>
                                </div>

                                <div class="QD-answer-date"><!-- 답변 날짜-->
                                    <P>${qdetail.answerDate}</P>
                                </div>
                            </div>

                            <div class="QD-answer-content"><!-- 답변 내용 구역 -->
                                <P>${qdetail.answerContent}</P>
                            </div>

                        </div>
                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </section>
    
    <script>
    	var msg = "${msg}";
    	
    	if(msg != ''){
    		alert(msg);
    	}
    
    </script>
    
    <script>
	$(document).ready(function(){
	 	
		 var userId = "${sessionScope.userVO.userId}";
		 var wrId = "${qdetail.insertId}";
		 var wrBno = "${qdetail.insertBno}";
		
		 console.log(userId);
		 console.log(wrId);
		 
		if(userId == wrId){
			$("#QDqustiondel").show();
			$("#QDqustionup").show();
		}else{
			$("#QDqustiondel").hide();
			$("#QDqustionup").hide();
		}
	});
    </script>
    
    
    <script>
   
    	$(document).ready(function(){
    	 	
    		 var userId = "${sessionScope.userVO.userId}";
    		if(userId == "1832573148"){
    			$(".QDbuttonuser").show();
    		}else{
    			$(".QDbuttonuser").hide();
    		}
    	});
    	
    </script>
    
   <!-- 모달창 스크립트 -->
     <script>
        document.getElementById("modal-question_opne_btn").onclick = function() {
            document.getElementById("question-modal").style.display="block";
        }
       
        document.getElementById("modal-question_close_btn").onclick = function() {
            document.getElementById("question-modal").style.display="none";
        }   
    </script>