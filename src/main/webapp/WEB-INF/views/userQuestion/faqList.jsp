<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section>
    <div class="container">
        <div class="row">
            <div>
            <!-------------------최상단 고객센터 글 box------------------>
            <div class="FAQ-user-center"> 
                <div class="FAQ-user-center-box"> <!-- 고객 센터 box -->
                    <p>고객센터</p>
                </div>

                <div class="FAQ-user-center-writing"> <!-- 글귀 box -->
                    <p class="FAQ-user-center-writing-p1">새로운 소식과 다양한 정보도 만나 보시고</p>
                    <p>궁금한 점은 빠르게 해결하세요!.</p>
                </div>

                <div> <!-- 해당페이지 이동 아이콘  -->
                        <!-- 구현 미정 -->
                </div>
            </div>
            <!---------------------기능 종류 box------------------------>
            <div class="FAQ-function-kinds"> <!-- FAQ / 1:1 문의 / 공지사항 BOX-->
                <ul class="FAQ-function-kinds-ul">
                    <li class="FAQ-function-kinds-boxp"></li>
                    <li class="FAQ-function-kinds-FAQ"><a href="faqList">FAQ</a></li>
                    <li class="FAQ-function-kinds-mtom"><a href="mtomPage">1:1문의</a></li>
                    <li class="FAQ-function-kinds-notice"><a href="../user/mypage">공지사항</a></li>
                    <li class="FAQ-function-kinds-boxb"></li>
                </ul>
            </div>

            <!--------------------FAQ 질문 종류 box------------------------>
            <div class="FAQ-sub-question"> <!-- FAQ box -->
                <div class="FAQ-sub-question-box"> <!-- FAQ button box-->
                    <div class="FAQ-sub-question-buy"> <!-- 결제 관련 FAQ-->
                        <button class="FAQ-payment-id">결제 관련</button>
                    </div>

                    <div class="FAQ-sub-question-login"><!-- 로그인 관련 -->
                        <button class="FAQ-login-id">로그인 관련</button>
                    </div>

                    <div class="FAQ-sub-question-homepage"> <!-- 홈페이지 사용법 관련 -->
                        <button class="FAQ-homepage-id">홈페이지 사용법 관련</button>
                    </div>

                    <div class="FAQ-sub-question-item"> <!-- 제품 등록 관련 -->
                        <button class="FAQ-item-insert-id">제품 등록 관련</button>
                    </div>
                </div>
            </div>

            <!-- --------------------검색 기능 box -->
            <div class="FAQ-such-box">
                <div class="FAQ-such-div">
                    <input type="text" placeholder="검색어 입력">
                    <button>Q</button>
                </div>
            </div>

            <!------------------전화 문의 안내 글 box----------------->
            <div class="FAQ-question-guide-box">
                <div class="FAQ-question-guide-div">
                    <p>· (전화 문의 안내) 문의 내용에 따라 FAQ의 답변글 내에 담당자 전화번호가 있습니다.</p>
                </div>
            </div>

            <!------------------FAQ 해당 질문 및 답변--(결제 관련)--------------->
            <c:forEach var="payment" items="${faqlist}" varStatus="index">
            <c:if test="${payment.faqNum eq 1}">
           
            <div class="FAQ-question-answer-payment" id="FAQ-payment">
                <div class="FAQ-question-box" id="FAQ-question-id"> <!-- FAQ 질문 box-->
                    <div class="FAQ-question-icon-box"> <!-- Q 질문 아이콘 -->
                        <button>Q</button>
                    </div>

                    <div class="FAQ-question-title"> <!-- FAQ 질문 제목 -->
                        <button>${payment.paymentFaqTitle}</button>
                    </div>
                    
                    <div class="FAQ-question-look"> <!-- + - 접었다 폈다 기능-->
                        <button id="FAQ-answer-btn">+</button>
                    </div>
                </div>

				<div class="FAQ-answer-box">
                <div class="FAQ-answer-box-payment"> <!-- FAQ 답변 box-->
                    <div class="FAQ-answer-icon-box"> <!-- A 답변 아이콘 -->
                        <button>A</button>
                    </div>

                    <div class="FAQ-answer-content	"> <!-- FAQ 답변 -->
                        <p>
                       		${payment.paymentFaq}
                       		 <c:out value="${index.index}"></c:out>
                        </p>
                      
                    </div>
                </div>
                </div>
            </div>
            <!-- 질문 답변 -->
            </c:if>
		</c:forEach>
            <!------------------FAQ 해당 질문 및 답변--(로그인관련 관련)--------------->
            
            <c:forEach var="login" items="${faqlist}" varStatus="index">
            <c:if test="${login.faqNum eq 2}">
            <div class="FAQ-question-answer-login" id="FAQ-login">
                <div class="FAQ-question-box FAQ-login-QnA" id="FAQ-question-login-id"> <!-- FAQ 질문 box-->
                    <div class="FAQ-question-icon-box"> <!-- Q 질문 아이콘 -->
                        <button>Q</button>
                    </div>

                    <div class="FAQ-question-title"> <!-- FAQ 질문 제목 -->
                        <button>${login.paymentFaqTitle}</button>
                    </div>
                    
                    <div class="FAQ-question-look"> <!-- + - 접었다 폈다 기능-->
                        <button id="FAQ-answer-login-btn">+</button>
                    </div>
                </div>

				<div class="FAQ-answer-box">
                <div class="FAQ-answer-box-login"> <!-- FAQ 답변 box-->
                    <div class="FAQ-answer-icon-box"> <!-- A 답변 아이콘 -->
                        <button>A</button>
                    </div>

                    <div class="FAQ-answer-content"> <!-- FAQ 답변 -->
                        <p>
                       ${login.paymentFaq}
                        </p>
                    </div>
                </div>
                </div>
            </div>
            <!-- 질문 답변 -->
		</c:if>
		</c:forEach>
		
            <!------------------FAQ 해당 질문 및 답변--(홈페이지 사용법 관련)--------------->
            
            <c:forEach var="home" items="${faqlist}" varStatus="index">
            <c:if test="${home.faqNum eq 3}">
            <div class="FAQ-question-answer-home" id="FAQ-home">
                <div class="FAQ-question-box" id="FAQ-question-home-id"> <!-- FAQ 질문 box-->
                    <div class="FAQ-question-icon-box"> <!-- Q 질문 아이콘 -->
                        <button>Q</button>
                    </div>

                    <div class="FAQ-question-title"> <!-- FAQ 질문 제목 -->
                        <button>${home.paymentFaqTitle}</button>
                    </div>
                    
                    <div class="FAQ-question-look"> <!-- + - 접었다 폈다 기능-->
                        <button id="FAQ-answer-home-btn">+</button>
                    </div>
                </div>

				<div class="FAQ-answer-box">
                <div class="FAQ-answer-box-home"> <!-- FAQ 답변 box-->
                    <div class="FAQ-answer-icon-box"> <!-- A 답변 아이콘 -->
                        <button>A</button>
                    </div>

                    <div class="FAQ-answer-content"> <!-- FAQ 답변 -->
                        <p>
                        	${home.paymentFaq}
                        </p>
                    </div>
                </div>
                </div>
            </div>
            <!-- 질문 답변 -->
			</c:if>
			</c:forEach>

             <!------------------FAQ 해당 질문 및 답변--(제품 등록 관련)--------------->
             <c:forEach var="item" items="${faqlist}" varStatus="index">
            <c:if test="${item.faqNum eq 4}">
             <div class="FAQ-question-answer-item" id="FAQ-item">
                <div class="FAQ-question-box" id="FAQ-question-item-id"> <!-- FAQ 질문 box-->
                    <div class="FAQ-question-icon-box"> <!-- Q 질문 아이콘 -->
                        <button>Q</button>
                    </div>

                    <div class="FAQ-question-title"> <!-- FAQ 질문 제목 -->
                        <button>${item.paymentFaqTitle}</button>
                    </div>
                    
                    <div class="FAQ-question-look"> <!-- + - 접었다 폈다 기능-->
                        <button id="FAQ-answer-item-btn">+</button>
                    </div>
                </div>
                
                
				<div class="FAQ-answer-box">
                <div class="FAQ-answer-box-item"> <!-- FAQ 답변 box-->
                    <div class="FAQ-answer-icon-box"> <!-- A 답변 아이콘 -->
                        <button>A</button>
                    </div>

                    <div class="FAQ-answer-content"> <!-- FAQ 답변 -->
                        <p>
                        	 ${item.paymentFaq}
                        </p>
                    
                    </div>
                </div>
                </div>
            </div>
            <!-- 질문 답변 -->
			</c:if>
			</c:forEach>
        </div>
    </div>
    </div>
</section>

   <!-- FAQ 질문 답변 script -->
<script>

        $(function(){
            $('#FAQ-payment').click(function(){
                if($('.FAQ-answer-box-payment').css("display") == "none"){
                    $('.FAQ-answer-box-payment').show();
                    $('.FAQ-answer-box-payment').attr('class','FAQ-hide-p');
                }else{
                    $('.FAQ-hide-p').attr('class','FAQ-answer-box-payment');
                    $('.FAQ-answer-box-payment').hide();
                }
            });

            $('#FAQ-login').click(function(){
                if($('.FAQ-answer-box-login').css("display") == "none"){
                    $('.FAQ-answer-box-login').show();
                    $('.FAQ-answer-box-login').attr('class','FAQ-hide-l');
                    
                }else{
                    $('.FAQ-hide-l').attr('class','FAQ-answer-box-login');
                    $('.FAQ-answer-box-login').hide();
                }
            });
            $('#FAQ-home').click(function(){
                if($('.FAQ-answer-box-home').css("display") == "none"){
                    $('.FAQ-answer-box-home').show();
                    $('.FAQ-answer-box-home').attr('class','FAQ-hide-h');
                    
                }else{
                    $('.FAQ-hide-h').attr('class','FAQ-answer-box-home');
                    $('.FAQ-answer-box-home').hide();
                }
            });

            $('#FAQ-item').click(function(){
                if($('.FAQ-answer-box-item').css("display") == "none"){
                    $('.FAQ-answer-box-item').show();
                    $('.FAQ-answer-box-item').attr('class','FAQ-hide-i');
                    
                }else{
                    $('.FAQ-hide-i').attr('class','FAQ-answer-box-item');
                    $('.FAQ-answer-box-item').hide();
                }
            });
        });
</script>


 <!--div 내용 바꾸기-->
 <script>
        $(document).ready(function() {
                // 처음 화면 로드시 기본 화면 보여주기
                $('.FAQ-question-answer-payment').show();
                $('.FAQ-question-answer-login').hide();
                $('.FAQ-question-answer-home').hide();
                $('.FAQ-question-answer-item').hide();
                
                // 결제 관련 li 클릭시 결제 관련 QnA 보여주기 
                $('.FAQ-payment-id').click(function(){
                $ ('.FAQ-question-answer-payment').show();
                $('.FAQ-question-answer-home').hide();
                $('.FAQ-question-answer-item').hide();
                $ ('.FAQ-question-answer-login').hide();
                return false;
            });
                // 로그인 관련 li 클릭시 결제 관련 QnA 보여주기
                $('.FAQ-login-id').click(function(){
                $ ('.FAQ-question-answer-payment').hide();
                $('.FAQ-question-answer-home').hide();
                $('.FAQ-question-answer-item').hide();
                $ ('.FAQ-question-answer-login').show(); 
                return false;
            });
                // 홈페이지 관련 li 클릭시 결제 관련 QnA 보여주기
                $('.FAQ-homepage-id').click(function(){
                $ ('.FAQ-question-answer-payment').hide();
                $('.FAQ-question-answer-home').show();
                $('.FAQ-question-answer-item').hide();
                $ ('.FAQ-question-answer-login').hide(); 
                return false;
            });
                // 제품 등록 관련 li 클릭시 결제 관련 QnA 보여주기
                $('.FAQ-item-insert-id').click(function(){
                $ ('.FAQ-question-answer-payment').hide();
                $('.FAQ-question-answer-home').hide();
                $('.FAQ-question-answer-item').show();
                $ ('.FAQ-question-answer-login').hide(); 
                return false;
            });
        });
 </script>