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
						<div class="MtoM-top-select-box-left">
							<!-- 선택박스 왼쪽 영역-->
							<div>
								<button class="btn btn-default"
									onclick="selectAll()">전체선택</button>
							</div>
							<div>
								<button class="btn btn-default" name='select-answer'
									onclick="selectAllf()">선택해제</button>
							</div>
							<div>
								<button class="btn btn-default" id="selectAllDelete">선택삭제</button>
							</div>
						</div>

						<div class="MtoM-top-select-right">
							<select name="" id="">
								<!-- 선택박스 오른쪽 영역-->
								<option value="">5개 보기</option>
								<option value="">10개 보기</option>
								<option value="">30개 보기</option>
							</select>
						</div>


					</div>
					<!------------ 하단 문의내역 박스 영역 ----------->
					<div class="MtoM-bottom-question-box">

						<ul class="MtoM-bottom-question-box-ul">
							<li class="MtoM-question-ck">선택</li>
							<!-- 체크박스-->
							<li class="MtoM-question-num">번호</li>
							<li class="MtoM-question-sel">분류</li>
							<li class="MtoM-question-title">제목</li>
							<li class="MtoM-question-show">답변 상태</li>
							<li class="MtoM-question-date">작성일</li>
							<li class="MtoM-question-option">관리</li>
						</ul>

					</div>

					<!-- 문의 내역---------------------- -->
					<c:forEach var="mtom" items="${mtomList}" varStatus="index">

						<div class="MtoM-answer-box">
							<!-- 글 1 -->
							<ul class="MtoM-answer-box-ul">
								<li class="MtoM-answer-box-ck">
								<input type="checkbox" name="selectAnswer" value="${mtom.insertBno}" id="MtoM-ck1">
								</li>
								
								<li class="MtoM-answer-box-num">${mtom.insertBno}</li>
								<!-- 번호 -->
								<li class="MtoM-answer-box-sel">${mtom.insertKind}</li>
								<!-- 분류-->
								<li class="MtoM-answer-box-title">${mtom.insertTitle}</li>
								<!-- 제목-->
								<li class="MtoM-answer-box-show">${mtom.answerStatus}</li>
								<!--답변 상태 -->
								<li class="MtoM-answer-box-date">${mtom.insertDate}</li>
								<!-- 작성일-->
								<li class="MtoM-answer-box-option">
									<!-- 관리-->
									<button type="button" class="MtoM-btn-go btn btn-default"
										onclick="location.href='questionDetail?insertBno=${mtom.insertBno}'">상세보기</button>
									<button type="button" class="MtoM-btn-update btn btn-default"
										onclick="location.href='updatePage?insertBno=${mtom.insertBno}'">수정</button>
									<button class="MtoM-btn-del btn btn-default"
										onclick="location.href='updateDelete?insertBno=${mtom.insertBno}'">삭제</button>
								</li>
							</ul>
							<!-- 글 종료 -->
						</div>
						<!-- 문의 내역 종료 -->
					</c:forEach>
				</div>	
		</div>
	</div>
</section>

