<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

   <section class="creator-detail-section">
       
        <div class="profile-header">
           <img src="../resources/img/creatorBackground/welcome.jpg">
        </div>

        <div class="profile-content">
                           
            <div class="creator-profile">
                
                <div class="creator-profile-wrap">
                    <img class="creator-profile-img" src="../resources/img/profile.png" style="width: 128px; height: 128px;">
                </div>

                <div class="creator-name">${creatorPageInfo.creatorNick}</div>

                <div class="creator-email">${creatorPageInfo.creatorEmail}</div>

                <div class="creator-description">
                    <textarea name="" id="" cols="36" rows="14" placeholder="프로필을 작성해주세요." readonly>${creatorPageInfo.aboutMe}</textarea>
                </div>

                <div class="creator-social">
                    <a href="${creatorPageInfo.instaPath }" id="instalink"><img src="${pageContext.request.contextPath }/resources/img/instaLogo.png" alt=""></a>
                </div>
                
                <!-- <div class="profile-modifyBtn">
                    <button type="button" onclick="location.href='creatorModify'">프로필 편집</button>
                </div> -->
                 
            </div>
            
            <div class="row">
                <div class="creator-content col-lg-8 col-md-7 col-sm-6 col-xs-12">
                                    
                        <ul class="creator-content-nav nav nav-tabs ">
                            <li class='active'><a data-toggle="tab" href="#menu1">제작자정보</a></li>
                            <li id="creator-BoardList"><a data-toggle="tab" href="#menu2">제작자작품</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="menu1" class="tab-pane fade in active">
                                
                                <div class="creator-content-info">
                                    <div class="creator-content-info-detail">
                                        <p>전공분야:</p>
                                        <small style="min-height: 50px;">${creatorInfo.creatorMajor }</small>
                                    </div>
                                    <div class="creator-content-info-detail">
                                        <p>경력사항:</p>
                                        <small>${creatorInfo.creatorCareer }</small>
                                        <small>${creatorInfo.creatorCareer1 }</small>
                                        <small>${creatorInfo.creatorCareer2 }</small>
                                    </div>
                                    <div class="creator-content-info-detail">
                                        <p>수상경력:</p>
                                        <small>${creatorInfo.creatorAwards }</small>
                                        <small>${creatorInfo.creatorAwards1 }</small>
                                        <small>${creatorInfo.creatorAwards2 }</small>
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
                                           <!--  <tr>
                                                <td>1</td>
                                                <td><a href="">디자인 작품</a></td>
                                                <td><a href="">디자인 작품</a></td>
                                                <td>2021-07-03</td>
                                            </tr> -->
                                        </tbody>   
                                    </table>
                                    
                                    
	                                    <div class="text-center">
	                                        <ul class="creator-content-writing-page pagination">
	                                            <!-- <li><a href="#menu2">이전</a></li>
	                                            <li><a href="#menu2">1</a></li>
	                                            <li><a href="#menu2">2</a></li>
	                                            <li><a href="#menu2">3</a></li>
	                                            <li><a href="#menu2">다음</a></li> -->
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
    
    	
    
 		// 작성글 탭 클릭시 화면에 뿌려질 리스트
		$("#creator-BoardList").click(function(){
			creatorBoardList(1,7);			
		});
	
 		// 작성글 게시판 리스트를 불러오는 함수
		function creatorBoardList(pageNum,amount) {
		
			if(event.target.tagName == "A"){	
				event.preventDefault();
			}   
		
			var creatorName = '${creatorPageInfo.creatorNick}'; 
			
			$.ajax({
				type: "post",
				url: "creatorPageBoardList",
				dataType: "json",
				contentType : "application/json",
				data : JSON.stringify({"creatorName":creatorName, "pageNum":pageNum, "amount":amount }),
				success: function(data){
					
					console.log(1);
					
					var strAdd = ''; // list를 저장해줄 변수
					var strAdd2 = ''; // pagingVO를 저장해줄 변수
					
					if(data.list.length == 0){ // 만약 해당유저가 채용공고 게시판에 작성한 글이 없다면 페이지네이션 삭제
						
						$(".pagination").css("display","none");
						return;
						
					} else {
						
						$.each(data.list, function(index, list){
							
							var date = new Date(list.regDate); //밀리초로 들어오는 형식을 YYYY/MM/DD형식으로 바꿔줌
							var year = date.getFullYear();
							var month = date.getMonth()+1;
							var day = date.getDate();
							
							var regDate = year + "/" + (month < 10 ? "0"+month : month) + "/" + (day < 10 ? "0"+day : day );
                            
                            strAdd += '<tr>';
                            strAdd += '<td>' + list.bno + '</td>';
                            strAdd += '<td><a href="">' + list.title + '</a></td>';
                            strAdd += '<td><a href="">' + list.content + '</a></td>';
                            strAdd += '<td>' + regDate + '</td>';
                            strAdd += '</tr>';
                         
						})
						
						$(".creator-content-writing-tbody").html(strAdd);
						
					}
					
					//페이지네이션
					
					//이전버튼  추가
					if(data.pagingVO.prev){
						strAdd2 += '<li><a href="#" onclick=creatorBoardList('+ (data.pagingVO.startPage-1) +',7)>이전</a></li> ';
					}
					
					for(var i = data.pagingVO.startPage; i <= data.pagingVO.endPage; i++){
						
						if(i == data.pagingVO.pageNum){
							strAdd2 += '<li class="active"><a href="#">'+ i +'</a></li>';
						}else{
							strAdd2 += '<li><a href="#" onclick="creatorBoardList('+i+',7)">'+ i +'</a></li>';
						}
												
					}
					
					//다음버튼 추가
					if(data.pagingVO.next){
						strAdd2 += '<li><a href="#" onclick=creatorBoardList('+ (data.pagingVO.endPage+1) +',7)>다음</a></li> ';
					}
					
					$(".pagination").html(strAdd2);
					
				},
				error: function(status, error) {
					alert("서버에 문제가 발생했습니다. 관리자에게 문의하세요.")
				}
			}) // ajax 끝
		
		};
    
    
		// 인스타 주소
    	$("#instalink").click(function() { // a 태그 클릭시 인스타 주소가 없다면 alert창
    		if($("#instalink").attr("href") == "") {
        		alert("등록된 인스타그램 주소가 없습니다.");
        	}
    	})
    /*
    	// 이미지 불러오기
    	$(document).ready(function() {
    		
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
    	*/
    	
       	window.onload = function() {

			if (history.state == '')
				return; //메시지를 출력했다면 함수 종료

			var msg = '${msg }';

			if (msg != '') {
				alert(msg);
				//기존 기록을 삭제하고 새로운 기록 추가 (이렇게 변경된 값은 history.state로 데이터 확인 가능)
				history.replaceState('', null, null); // 브라우저 기록컨트롤(추가할 데이터, 제목, url주소)
			}

		}
    
    	
    </script>