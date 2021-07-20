<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <section>
        <div class="container">
            <div class="row">
                <div class="MtoM-all">
                <!---------- 상단 선택 박스 영역 -------------->
                <div class="MtoM-question-mtom">
                    <p> 1:1 문의 내역</p>
                    <div class="MtoM-question-mtom-go">
                        <button class="btn btn-danger">문의하기</button>
                    </div>
                </div>

                <div class="MtoM-top-select-box">
                    <div class="MtoM-top-select-box-left"> <!-- 선택박스 왼쪽 영역-->
                        <div><button class="btn btn-default">전체선택</button></div>
                        <div><button class="btn btn-default">선택해제</button></div>
                        <div><button class="btn btn-default">선택삭제</button></div>
                    </div>

                    <div class="MtoM-top-select-right">
                    <select name="" id=""> <!-- 선택박스 오른쪽 영역-->
                        <option value="">5개 보기</option>
                        <option value="">10개 보기</option>
                        <option value="">30개 보기</option>
                    </select>
                    </div>

                    
                </div>
                <!------------ 하단 문의내역 박스 영역 ----------->
                 <div class="MtoM-bottom-question-box">
                    
                    <ul class="MtoM-bottom-question-box-ul">
                        <li class="MtoM-question-ck">선택</li><!-- 체크박스-->
                        <li class="MtoM-question-num">번호</li>
                        <li class="MtoM-question-sel">분류</li>
                        <li class="MtoM-question-title">제목</li>
                        <li class="MtoM-question-show">답변 상태</li>
                        <li class="MtoM-question-date">작성일</li>
                        <li class="MtoM-question-option">관리</li>
                    </ul>
               
                 </div>
                 <form action="">
                 <!-- 문의 내역---------------------- -->
                 <div class="MtoM-answer-box">
                     <!-- 글 1 -->
                    <ul class="MtoM-answer-box-ul">
                        <li class="MtoM-answer-box-ck">
                            <input type="checkbox" name="" value="" id="MtoM-ck1">
                        </li>
                        <li class="MtoM-answer-box-num">5</li><!-- 번호 -->
                        <li class="MtoM-answer-box-sel">주문/결제/배송</li><!-- 분류-->
                        <li class="MtoM-answer-box-title">배송이 안오는데요</li><!-- 제목-->
                        <li class="MtoM-answer-box-show">답변 완료</li><!-- 노출 구분-->
                        <li class="MtoM-answer-box-date">2021-07-01</li><!-- 작성일-->
                        <li class="MtoM-answer-box-option"><!-- 관리-->
                            <button class="MtoM-btn-go btn btn-default">바로가기</button>
                            <button class="MtoM-btn-update btn btn-default">수정</button>
                            <button class="MtoM-btn-del btn btn-default">삭제</button>
                        </li>
                    </ul>
                    <!-- 글 1 종료 -->

                    <!-- 글 2 -->
                    <ul class="MtoM-answer-box-ul">
                        <li class="MtoM-answer-box-ck"><input type="checkbox" name="color" value="blue"></li>
                        <li class="MtoM-answer-box-num">4</li><!-- 번호 -->
                        <li class="MtoM-answer-box-sel">주문/결제/배송</li><!-- 분류-->
                        <li class="MtoM-answer-box-title">제품이 부서졌습니다.</li><!-- 제목-->
                        <li class="MtoM-answer-box-show">답변 완료</li><!-- 노출 구분-->
                        <li class="MtoM-answer-box-date">2021-07-01</li><!-- 작성일-->
                        <li class="MtoM-answer-box-option"><!-- 관리-->
                            <button class="MtoM-btn-go btn btn-default">바로가기</button>
                            <button class="MtoM-btn-update btn btn-default">수정</button>
                            <button class="MtoM-btn-del btn btn-default">삭제</button>
                        </li>
                    </ul>
                    <!-- 글 1 종료 -->

                    <!-- 글 3 -->
                    <ul class="MtoM-answer-box-ul">
                        <li class="MtoM-answer-box-ck"><input type="checkbox" name="color" value="blue"></li>
                        <li class="MtoM-answer-box-num">3</li><!-- 번호 -->
                        <li class="MtoM-answer-box-sel">주문/결제/배송</li><!-- 분류-->
                        <li class="MtoM-answer-box-title">입금이 안됩니다.!</li><!-- 제목-->
                        <li class="MtoM-answer-box-show">답변 대기중</li><!-- 노출 구분-->
                        <li class="MtoM-answer-box-date">2021-07-01</li><!-- 작성일-->
                        <li class="MtoM-answer-box-option"><!-- 관리-->
                            <button class="MtoM-btn-go btn btn-default">바로가기</button>
                            <button class="MtoM-btn-update btn btn-default">수정</button>
                            <button class="MtoM-btn-del btn btn-default">삭제</button>
                        </li>
                    </ul>
                    <!-- 글 1 종료 -->

                    <!-- 글 4 -->
                    <ul class="MtoM-answer-box-ul">
                        <li class="MtoM-answer-box-ck"><input type="checkbox" name="color" value="blue"></li>
                        <li class="MtoM-answer-box-num">2</li><!-- 번호 -->
                        <li class="MtoM-answer-box-sel">주문/결제/배송</li><!-- 분류-->
                        <li class="MtoM-answer-box-title">배송이 언제쯤 도착하나요</li><!-- 제목-->
                        <li class="MtoM-answer-box-show">답변 대기중</li><!-- 노출 구분-->
                        <li class="MtoM-answer-box-date">2021-07-01</li><!-- 작성일-->
                        <li class="MtoM-answer-box-option"><!-- 관리-->
                            <button class="MtoM-btn-go btn btn-default">바로가기</button>
                            <button class="MtoM-btn-update btn btn-default">수정</button>
                            <button class="MtoM-btn-del btn btn-default">삭제</button>
                        </li>
                    </ul>
                    <!-- 글 1 종료 -->

                    <!-- 글 5 -->
                    <ul class="MtoM-answer-box-ul">
                        <li class="MtoM-answer-box-ck"><input type="checkbox" name="color" value="blue"></li>
                        <li class="MtoM-answer-box-num">1</li><!-- 번호 -->
                        <li class="MtoM-answer-box-sel">주문/결제/배송</li><!-- 분류-->
                        <li class="MtoM-answer-box-title">제품이 이미지와 다릅니다.</li><!-- 제목-->
                        <li class="MtoM-answer-box-show">답변 대기중</li><!-- 노출 구분-->
                        <li class="MtoM-answer-box-date">2021-07-01</li><!-- 작성일-->
                        <li class="MtoM-answer-box-option"><!-- 관리-->
                            <button class="MtoM-btn-go btn btn-default">바로가기</button>
                            <button class="MtoM-btn-update btn btn-default">수정</button>
                            <button class="MtoM-btn-del btn btn-default">삭제</button>
                        </li>
                    </ul>
                    <!-- 글 1 종료 -->
                </div>
                <!-- 문의 내역 종료 -->

            </form>

        </div>
        </div>
        </div>
    </section>
