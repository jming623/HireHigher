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
                        <button  class="FAQ-payment-id FAQ-btn-test">결제 관련</button>
                    </div>

                    <div class="FAQ-sub-question-login"><!-- 로그인 관련 -->
                        <button  class="FAQ-login-id FAQ-btn-test">로그인 관련</button>
                    </div>

                    <div class="FAQ-sub-question-homepage"> <!-- 홈페이지 사용법 관련 -->
                        <button  class="FAQ-homepage-id FAQ-btn-test">홈페이지 사용법 관련</button>
                    </div>

                    <div class="FAQ-sub-question-item"> <!-- 제품 등록 관련 -->
                        <button  class="FAQ-item-insert-id FAQ-btn-test">제품 등록 관련</button>
                    </div>
                </div>
            </div>

            <!-- --------------------검색 기능 box -->
            <!-- 
            <div class="FAQ-such-box">
                <div class="FAQ-such-div">
                    <input type="text" placeholder="검색어 입력">
                    <button>Q</button>
                </div>
            </div>
			 -->
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
                        <button id="test01">${payment.paymentFaqTitle}</button>
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

                    <div class="FAQ-answer-content"> <!-- FAQ 답변 -->
                        <p>
                       		${payment.paymentFaq}                      		 
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
                        <button id="FAQ-button">${item.paymentFaqTitle}</button>
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

<script>


    $(document).ready(function(){

        $(".FAQ-payment-id").css({"color":"#494949","border-bottom":"6px solid #494949","transition":".2s"});

        $(".FAQ-btn-test").click(function(){

        if( $(this).hasClass("FAQ-payment-id") ){
            $(".FAQ-payment-id").css({"color":"#494949","border-bottom":"6px solid #494949","transition":".2s"});
            $(".FAQ-login-id,.FAQ-homepage-id,.FAQ-item-insert-id").removeAttr("style");

		}else if( $(this).hasClass("FAQ-login-id")){
			$(".FAQ-login-id").css({"color":"#494949","border-bottom":"6px solid #494949","transition":".2s"});
            $(".FAQ-payment-id,.FAQ-homepage-id,.FAQ-item-insert-id").removeAttr("style");
            
        }
        else if( $(this).hasClass("FAQ-homepage-id")){
			$(".FAQ-homepage-id").css({"color":"#494949","border-bottom":"6px solid #494949","transition":".2s"});
            $(".FAQ-payment-id,.FAQ-login-id,.FAQ-item-insert-id").removeAttr("style");
        }
        else{
			$(".FAQ-item-insert-id").css({"color":"#494949","border-bottom":"6px solid #494949","transition":".2s"});
            $(".FAQ-payment-id,.FAQ-login-id,.FAQ-homepage-id").removeAttr("style");
        }

        });


    });
    
</script>

   <!-- FAQ 질문 답변 script -->

<script>

        $(".FAQ-question-title").click(function(event){
		//console.log( $(this) );
		
		//console.dir( $(this)	 );
		
		//console.log( $(this).parent() );
		
		console.dir( $(this).parent().next().children().first().attr("class"));
		
        console.dir($(this).next().children().first().text());

		if( $(this).parent().next().children().first().hasClass("FAQkkk") ){
			
			$(this).parent().next().children().first().removeClass("FAQkkk");
			$(this).parent().next().children().first().hide();
			$(this).next().children().first().text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
		}else{
			$(this).parent().next().children().first().show();
			$(this).parent().next().children().first().addClass("FAQkkk");	
			$(this).next().children().first().text("-").css({"font-size": "38px","background-color": "white","color":"#bfbfbf","margin-bottom":"100px"});
        }
		/* $(this).addClass("FAQkkk");
		console.log( $(this).attr("class") );
		
		$(".FAQkkk").show(); */
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
              
                //답변 초기화 코드-----------------------------------
                //FAQ-answer-box-payment
                //FAQ-answer-box-login
                //FAQ-answer-box-home
                //FAQ-answer-box-item
                
                $(".FAQ-answer-box-login").removeClass("FAQkkk");
                $(".FAQ-answer-box-login").hide();
                $("#FAQ-answer-login-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-home").removeClass("FAQkkk");
                $(".FAQ-answer-box-home").hide();
                $("#FAQ-answer-home-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-item").removeClass("FAQkkk");
                $(".FAQ-answer-box-item").hide();
                $("#FAQ-answer-item-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                return false;
            });
                // 로그인 관련 li 클릭시 결제 관련 QnA 보여주기
                $('.FAQ-login-id').click(function(){
                $ ('.FAQ-question-answer-payment').hide();
                $('.FAQ-question-answer-home').hide();
                $('.FAQ-question-answer-item').hide();
                $ ('.FAQ-question-answer-login').show();
                
                
                $(".FAQ-answer-box-payment").removeClass("FAQkkk");
                $(".FAQ-answer-box-payment").hide();
                $("#FAQ-answer-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-home").removeClass("FAQkkk");
                $(".FAQ-answer-box-home").hide();
                $("#FAQ-answer-home-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-item").removeClass("FAQkkk");
                $(".FAQ-answer-box-item").hide();
                $("#FAQ-answer-item-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                return false;
            });
                // 홈페이지 관련 li 클릭시 결제 관련 QnA 보여주기
                $('.FAQ-homepage-id').click(function(){
                $ ('.FAQ-question-answer-payment').hide();
                $('.FAQ-question-answer-home').show();
                $('.FAQ-question-answer-item').hide();
                $ ('.FAQ-question-answer-login').hide(); 
                
                $(".FAQ-answer-box-payment").removeClass("FAQkkk");
                $(".FAQ-answer-box-payment").hide();
                $("#FAQ-answer-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-login").removeClass("FAQkkk");
                $(".FAQ-answer-box-login").hide();
                $("#FAQ-answer-login-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-item").removeClass("FAQkkk");
                $(".FAQ-answer-box-item").hide();
                $("#FAQ-answer-item-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                return false;
            });
                // 제품 등록 관련 li 클릭시 결제 관련 QnA 보여주기
                $('.FAQ-item-insert-id').click(function(){
                $ ('.FAQ-question-answer-payment').hide();
                $('.FAQ-question-answer-home').hide();
                $('.FAQ-question-answer-item').show();
                $ ('.FAQ-question-answer-login').hide(); 
                
                $(".FAQ-answer-box-payment").removeClass("FAQkkk");
                $(".FAQ-answer-box-payment").hide();
                $("#FAQ-answer-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-login").removeClass("FAQkkk");
                $(".FAQ-answer-box-login").hide();
                $("#FAQ-answer-login-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                
                $(".FAQ-answer-box-home").removeClass("FAQkkk");
                $(".FAQ-answer-box-home").hide();
                $("#FAQ-answer-home-btn").text("+").css({"font-size": "30px","background-color": "white","color":"#bfbfbf"});
                return false;
            });
        });
 </script>
