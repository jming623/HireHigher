<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <section class="creator-detail-section">
        <div class="row profile-header-row">
        <div class="profile-header col-lg-12">
           <!-- <img id="creator-background-img-target" src="../resources/img/creatorBackground/welcome.jpg" alt=""> -->
        </div>
        <div class="profile-header-inner">
            <div class="creator-profile-header-modify">
                <a href="" class="backgroundBtn"><i><input type="file" class="creator-profile-img-input" name="background-file" id="background-file"></i></a>
        	</div>
        </div>
        </div>
        <div class="profile-content">
                           
            <div class="creator-profile">
                
                <div class="creator-profile-wrap">
                    
                        <!-- <img class="creator-profile-img" id="creator-profile-img-target" src="../resources/img/creatorProfile/profile.png"> -->
                    
                </div>
                <div class="creator-profile-img-modify">
                	<a href="" class="profileBtn"><i><input type="file" class="creator-profile-img-input" name="profile-file" id="profile-file"></i></a>
                </div>

                <div class="creator-name">${pageVO.creatorNick}</div>

                <div class="creator-email">
                    ${pageVO.creatorEmail}
                </div>

                <div class="creator-description">
                    <form action="profileUpdate" method="post">
                        
                    <div class="creator-description-content" id="creator-description-content">
                        <textarea cols="33" rows="14" placeholder="프로필을 작성해주세요." readonly>${pageVO.aboutMe}</textarea>
                    </div>

                    <div class="creator-description-textarea" id="creator-description-textarea" style="display: none;"> 
                        <textarea cols="33" name="aboutMe" rows="14" placeholder="프로필을 작성해주세요.">${pageVO.aboutMe}</textarea>
                    </div>
                    
                    <div class="creator-description-input" id="creator-description-input" style="display: none;">
                       <input type="text" name="instaPath" placeholder="인스타그램 주소를 입력하세요." value="${pageVO.instaPath }">
                    </div>
                    
                    <div id="creator-descrption-btn-wrap">
                        <div id="creator-descrption-btn-inner1">
                            <button type="button" id="creator-descrption-btn1" class=" btn btn-default btn-xs">
                                <span class="glyphicon glyphicon-edit"></span> Edit
                            </button>
                        </div>
                        <div id="creator-descrption-btn-inner2" style="display: none;">
                            <button type="submit" id="creator-descrption-btn2" class="btn btn-default btn-xs" onclick="location.reload()">수정</button>
                            <button type="button" id="creator-descrption-btn3" class="btn btn-default btn-xs" onclick="location.reload()">취소</button>
                        </div>
                    </div>
                    </form>
                </div>

                <%-- <div class="creator-social">
                    <a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath }/resources/img/instaLogo.png" alt=""></a>
                </div> --%>
                 
            </div>
            
            <div class="row">
                <div class="creator-content col-lg-8 col-md-7 col-sm-6 col-xs-12">
                                    
                        <ul class="creator-content-nav nav nav-tabs ">
                            <li class='active'><a data-toggle="tab" href="#menu1">제작자정보</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="menu1" class="tab-pane fade in active">
                                <form action="infoUpdate">
                                    <div class="creator-content-info">
                                        <p>전공분야:</p>
                                        
                                        <div class="creator-content-info-detail">
                                            <small style="min-height: 50px;">${creatorVO.creatorMajor }</small>
                                        </div>

                                        <div class="creator-content-info-input" style="display: none;">
                                            <input type="text" name="creatorMajor" value="${creatorVO.creatorMajor }">
                                        </div>

                                        <p>경력사항:</p>

                                        <div class="creator-content-info-detail">
                                            <small>${creatorVO.creatorCareer }</small>
                                            <small>${creatorVO.creatorCareer1 }</small>
                                            <small>${creatorVO.creatorCareer2 }</small>
                                        </div>

                                        <div class="creator-content-info-input" style="display: none;">
                                            <input type="text" name="creatorCareer" value="${creatorVO.creatorCareer }">
                                            <input type="text" name="creatorCareer1" value="${creatorVO.creatorCareer1 }">
                                            <input type="text" name="creatorCareer2" value="${creatorVO.creatorCareer2 }">
                                        </div>

                                        <p>수상경력:</p>

                                        <div class="creator-content-info-detail">
                                            <small>${creatorVO.creatorAwards }</small>
                                            <small>${creatorVO.creatorAwards1 }</small>
                                            <small>${creatorVO.creatorAwards2 }</small>
                                        </div>

                                        <div class="creator-content-info-input" style="display: none;">
                                            <input type="text" name="creatorAwards" value="${creatorVO.creatorAwards }">
                                            <input type="text" name="creatorAwards1" value="${creatorVO.creatorAwards1 }">
                                            <input type="text" name="creatorAwards2" value="${creatorVO.creatorAwards2 }">
                                        </div>
                                           
                                        <div class="creator-content-info-edit1">
                                            <button type="button" id="creator-content-info-editBtn">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>                                            
                                        </div>
                                            
                                        <div class="creator-content-info-edit2" style="display: none;">
                                            <button type="submit" class="btn btn-default" onclick="location.reload()">수정</button>
                                            <button type="button" class="btn btn-default" onclick="location.reload()">취소</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            
                        </div>
                </div>                 
            </div>


        </div>
            
    </section>   

   <script>
    
    //프로필 수정
    $("#creator-descrption-btn1").click(function(){
        
        //텍스트 교체

       $("#creator-description-content").css("display","none");
       $("#creator-description-textarea").css("display","block");
       $("#creator-description-input").css("display","block");

        //버튼 교체
        
        $("#creator-descrption-btn-inner1").css("display","none");
        $("#creator-descrption-btn-inner2").css("display","inline-block");
    })

    //제작자정보 수정
    $("#creator-content-info-editBtn").click(function(){

        //텍스트 교체
        $(".creator-content-info-detail").css("display","none");
        $(".creator-content-info-input").css("display","block");

        //버튼교체
        $(".creator-content-info-edit2").css("display","block");
        $(".creator-content-info-edit1").css("display","none");

    })
    
       
     //자바 스크립트 파일 미리보기 기능
     // background 이미지 미리보기
      function readURL1(input) {
    	
           if (input.files && input.files[0]) {
              
               var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
               //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
              reader.readAsDataURL(input.files[0]); 
               
               reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                   $('creator-background-img-target').attr("src", event.target.result); 
                   console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
              }
           }
       }
    
    
      $("#background-file").change(function() {
    	  
           readURL1(this); //this는 #file자신 태그를 의미
       });
      
      // profile 이미지 미리보기
      function readURL2(input) {
           if (input.files && input.files[0]) {
              
               var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
               //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
              reader.readAsDataURL(input.files[0]); 
               
               reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                   $('#creator-profile-img-target').attr("src", event.target.result); 
                   console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
              }
           }
       }
      $("#profile-file").change(function() {
           readURL2(this); //this는 #file자신 태그를 의미
       });
      
      // 이미지 업로드 및 불러오기
      $(document).ready(function() {
    	
    	// 프로필 이미지 업로드
		$(".profileBtn").click(function(){
    		
    		var profileId = '${sessionScope.userVO.userId}';
    		
    		
    		
    	});
  		
    	
		// 프로필 이미지 불러오기
  		function profileGet() { 
  			
  			var strAdd = "";
  			
  			$.getJSON("profileGet", function(data) {
  				
  				// view를 타고 컨트롤러에 이미지 반환 요청으로 보내준다
  				strAdd += '<img class="creator-profile-img" src="' + "view/"+ data.profileLoca+"/"+data.profileName + '">';
  				
  				$(".creator-profile-wrap").html(strAdd); // 클래스명 밑에 strAdd의 태그를 추가
  				
  				
  			});
  			
  			
  		}
  		
  		// 백그라운드 이미지 불러오기
		function backgroundGet() { 
  			
  			var strAdd = "";
  			
  			$.getJSON("backgroundGet", function(data) {
  				
  				// view를 타고 컨트롤러에 이미지 반환 요청으로 보내준다
  				strAdd += '<img id="creator-background-img-target" src="' + "view1/" + data.backgroundLoca + "/" + data.backgroundName + '">';
  				
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
       

   </script>
