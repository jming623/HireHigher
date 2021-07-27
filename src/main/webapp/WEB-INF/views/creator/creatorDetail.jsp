<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

   <section class="creator-detail-section">
       
        <div class="profile-header">
            <!-- <img src="../resources/img/creatorBackground/welcome.jpg"> -->
        </div>

        <div class="profile-content">
                           
            <div class="creator-profile">
                
                <div class="creator-profile-wrap">
                    <!-- <img class="creator-profile-img" src="../resources/img/creatorProfile/profile.png" style="width: 128px; height: 128px;"> -->
                </div>

                <div class="creator-name">${pageVO.creatorNick}</div>

                <div class="creator-email">${pageVO.creatorEmail}</div>

                <div class="creator-description">
                    <textarea name="" id="" cols="36" rows="14" placeholder="프로필을 작성해주세요." readonly>${pageVO.aboutMe}</textarea>
                </div>

                <div class="creator-social">
                    <a href="${pageVO.instaPath }" id="instalink"><img src="${pageContext.request.contextPath }/resources/img/instaLogo.png" alt=""></a>
                </div>
                
                <div class="profile-modifyBtn">
                    <button type="button" onclick="location.href='creatorModify'">프로필 편집</button>
                </div>
                 
            </div>
            
            <div class="row">
                <div class="creator-content col-lg-8 col-md-7 col-sm-6 col-xs-12">
                                    
                        <ul class="creator-content-nav nav nav-tabs ">
                            <li class='active'><a data-toggle="tab" href="#menu1">제작자정보</a></li>
                            <li><a data-toggle="tab" href="#menu2">작성글</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="menu1" class="tab-pane fade in active">
                                
                                <div class="creator-content-info">
                                    <div class="creator-content-info-detail">
                                        <p>전공분야:</p>
                                        <small style="min-height: 50px;">${creatorVO.creatorMajor }</small>
                                    </div>
                                    <div class="creator-content-info-detail">
                                        <p>경력사항:</p>
                                        <small>${creatorVO.creatorCareer }</small>
                                        <small>${creatorVO.creatorCareer1 }</small>
                                        <small>${creatorVO.creatorCareer2 }</small>
                                    </div>
                                    <div class="creator-content-info-detail">
                                        <p>수상경력:</p>
                                        <small>${creatorVO.creatorAwards }</small>
                                        <small>${creatorVO.creatorAwards1 }</small>
                                        <small>${creatorVO.creatorAwards2 }</small>
                                    </div>
                                </div>

                            </div>                          

                            <div id="menu2" class="tab-pane fade">
                                
                                <div class="creator-content-writing">
                                    <table class="creator-content-writing-table table">
                                        <thead>
                                            <tr>
                                                <td>번호</td>
                                                <td>제목</td>
                                                <td>내용</td>
                                                <td>작성일</td>
                                            </tr>
                                        </thead> 
                                        <tbody class="creator-content-writing-tbody">
                                            <tr>
                                                <td>1</td>
                                                <td><a href="">첫글</a></td>
                                                <td><a href="">첫글은이렇게 작성하였습니다.</a></td>
                                                <td>2021/07/05</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td><a href="">두번째글</a></td>
                                                <td><a href="">두번째글은이렇게 작성하였습니다.</a></td>
                                                <td>2021/07/05</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td><a href="">세번째글</a></td>
                                                <td><a href="">세번째글은이렇게 작성하였습니다.</a></td>
                                                <td>2021/07/05</td>
                                            </tr>
                                            
                                        </tbody>   
                                    </table>
                                    
                                    <div class="text-center">
                                        <ul class="creator-content-writing-page pagination">
                                            <li><a href="#menu2">이전</a></li>
                                            <li><a href="#menu2">1</a></li>
                                            <li><a href="#menu2">2</a></li>
                                            <li><a href="#menu2">3</a></li>
                                            <li><a href="#menu2">다음</a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                </div>                 
            </div>


        </div>
            
    </section>
    
    <script>
    
    
    	$("#instalink").click(function() { // a 태그 클릭시 인스타 주소가 없다면 alert창
    		if($("#instalink").attr("href") == "") {
        		alert("등록된 인스타그램 주소가 없습니다.");
        	}
    	})
    
    	$(document).ready(function() {
    		
    		function profileGet() { // 프로필 이미지를 얻어오는 함수
    				
    			
    			var strAdd = "";
    			
    			$.getJSON("profileGet", function(data) {
    				
    				// view를 타고 컨트롤러에 이미지 반환 요청으로 보내준다
    				strAdd += '<img class="creator-profile-img" src="' + "view/"+ data.profileLoca+"/"+data.profileName + '">';
    				
    				$(".creator-profile-wrap").html(strAdd); // 클래스명 밑에 strAdd의 태그를 추가
    			});
    		}
    		
			function backgroundGet() { // 백그라운드 이미지를 얻어오는 함수
    				
    			
    			var strAdd = "";
    			
    			$.getJSON("backgroundGet", function(data) {
    				
    				// view를 타고 컨트롤러에 이미지 반환 요청으로 보내준다
    				strAdd += '<img src="' + "view1/" + data.backgroundLoca + "/" + data.backgroundName + '">';
    				
    				$(".profile-header").html(strAdd); // 클래스명 밑에 strAdd의 태그를 추가
    			});
    		}
    		
    		(function() {
				profileGet();
			})();
    		
    		(function() {
    			backgroundGet();
			})();
    		
    		
    	}); // ready(function) 끝
    
       window.onload = function() {
      
         if(history.state == '') return; //메시지를 출력했다면 함수 종료
      
         var msg = '${msg }';
      
         if(msg != '') {
            alert(msg);
            //기존 기록을 삭제하고 새로운 기록 추가 (이렇게 변경된 값은 history.state로 데이터 확인 가능)
            history.replaceState('', null, null); // 브라우저 기록컨트롤(추가할 데이터, 제목, url주소)
      }
      
      
   }
    
    </script>
