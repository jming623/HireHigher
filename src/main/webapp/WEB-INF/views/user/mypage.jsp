<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<section class="mypage">

    <div class="container mypage-container">
        <div class="row">
            <div class="col-md-12" >
                <div class="mypage-title">
                    <span>마이페이지</span>
                </div>   

                <ul id="mypageNav" class="nav nav-tabs mypage-nav">
                	<li id="mypage-jobBoardList"><a data-toggle="tab" href="#menu3">채용공고</a></li>
                    <li id="mypage-faqBoardList"><a data-toggle="tab" href="#menu2">문의내역</a></li>
                    <li class="active"><a data-toggle="tab" href="#menu1">내정보</a></li>
                </ul>
    
                <div class="tab-content mypage-wrap">
                    <div id="menu1" class="tab-pane fade in active mypage-info">
                        <form id="mypage-form" action="">
                            <table class="table mypage-table">
                                <tbody class="m-control mypage-table-body">
                                    <tr><td class="m-title">아이디</td></tr>
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" value="${userInfo.userId }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">이름</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" value="${userInfo.userName }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">닉네임</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text"value="${userInfo.nickName }" readonly ></td>
                                    </tr>
                                     <tr><td class="m-title">생년월일</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text"value="${userInfo.birthDay }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">이메일</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" value="${userInfo.userEmail }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">전화번호</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" value="${userInfo.userCellNum }" readonly ></td>
                                    </tr>                                   
                                    <tr><td class="m-title">주소</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" value="${userInfo.addrZipNum }" readonly ></td>
                                    </tr>
                                                                 
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text"  value="${userInfo.addrBasic}" readonly ></td>
                                    </tr>
                                                             
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text"  value="${userInfo.addrDetail }" readonly ></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            
                            <div>
                                <button type="button" id="mypage-modify-btn" class="btn btn-info btn-block" onclick="location.href='mypageModify'">수정하기</button>    
                            </div>                           

                        </form>
    
                    </div>
                    <div id="menu2" class="tab-pane fade">
                        <div class="mypage-content">
                            <table class="mypage-content-wrap table">
                                <thead>
                                    <tr>
                                        <td>번호</td>
                                        <td>제목</td>
                                        <td>내용</td>
                                        <td>작성일</td>                                       
                                    </tr>
                                </thead> 
                                <tbody id="mypage-FAQBoardList-content" class="mypage-content-body">
                                    <!-- <tr>
                                        <td>1</td>
                                        <td><a href="">첫글</a></td>
                                        <td><a href="">첫글은이렇게 작성하였습니다.</a></td>
                                        <td>2021/07/05</td>
                                        <td>120</td>
                                    </tr> -->                              
                                </tbody>   
                            </table>
                            
                            <div id = "mypage-noContent" class="mypage-noContent" style="display:none;">
                            	<p>회원님께서 작성하신 문의내역을 찾을 수 없습니다.</p>
                            </div>
                            
                            <div id="mypage-content-page-wrap" class="text-center">
                                <ul id="mypage-faqContent-page" class="mypage-content-page pagination">
                                    <!-- <li><a href="#menu2">이전</a></li>
                                    <li><a href="#menu2">1</a></li>
                                    <li><a href="#menu2">2</a></li>
                                    <li><a href="#menu2">3</a></li>
                                    <li><a href="#menu2">다음</a></li> -->
                                </ul>
                            </div>
                        </div>
    
                    </div>
                    
                    <div id="menu3" class="tab-pane fade">
                        <div class="mypage-content">
                            <table class="mypage-content-wrap table">
                                <thead>
                                    <tr>
                                        <td>글번호</td>
                                        <td>기업명</td>
                                        <td>제목</td>
                                        <td>작성일</td>
                                        <td>조회수</td>
                                    </tr>
                                </thead> 
                                <tbody id="mypage-jobBoardList-content" class="mypage-content-body">
                                   <!--  <tr>
                                        <td>1</td>
                                        <td><a href="">첫글</a></td>
                                        <td><a href="">첫글은이렇게 작성하였습니다.</a></td>
                                        <td>2021/07/05</td>
                                        <td>9</td>
                                    </tr> -->                                    
                                </tbody>   
                            </table>
                            
                            <div id ="mypage-noContent2" class="mypage-noContent" style="display:none;">
                            	<p>회원님께서 작성하신 채용공고를 찾을 수 없습니다.</p>
                            </div>
                            
                            <div id="mypage-content-page-wrap2" class="text-center">
                                <ul id="mypage-jobContent-page" class="mypage-content-page pagination">
                                    <!-- <li><a href="#menu2">이전</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">다음</a></li> -->
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
  		
    	//채용공고 탭 클릭시 화면에 뿌려줄 리스트
		$("#mypage-jobBoardList").click(function(){
			jobBoardList(1,10);			
		})
		
		//채용공고 게시판 리스트를 불러오는 함수 
		function jobBoardList(pageNum,amount){
    		 		
    		if(event.target.tagName == "A"){	
    			event.preventDefault();
    		}   		
    		
			var userId = "${userInfo.userId }"; //session으로 넘어온  userId
			
			$.ajax({
				type: "post",
				url: "mypageJobBoardList",
				dataType: "json",
				contentType : "application/json",
				data : JSON.stringify({"userId":userId, "pageNum":pageNum, "amount":amount }),
				success: function(data){
					
					//data에는 ArrayList<JobBoardVO>와 UserPageVO가 담겨있다.
										
					var strAdd = ''; //리스트를 저장해줄 변수
					var strAdd2 = ''; //페이지네이션을 저장해줄 변수
					
					//리스트 불러오기										
					if(data.list.length == 0){ //만약 해당유저가 채용공고 게시판에 작성한 글이 없다면
						$("#mypage-noContent2").css("display","block");//미리 작성해둔 div를 보여줌
						$("#mypage-content-page-wrap2").css("display","none");//페이지네이션 삭제
						return;
					}else{
						$.each(data.list, function(index, list){ //해당 유저가 채용공고 게시판에 작성한 글이있다면 제이쿼리의 for문
							
							var date = new Date(list.regDate); //밀리초로 들어오는 형식을 YYYY/MM/DD형식으로 바꿔줌
							var year = date.getFullYear();
							var month = date.getMonth()+1;
							var day = date.getDate();
							
							var regDate = year + "/" + (month < 10 ? "0"+month : month) + "/" + (day < 10 ? "0"+day : day );
							
							//회사명 글자수 제한
							
							if(list.companyName.length > 15){
								var companyName = list.companyName.substr(0,14)+"....";
							}else{
								var companyName = list.companyName;
							}
							
							//제목 글자수 제한
							if(list.title.length > 20){
								var title = list.title.substr(0,19)+"....";
							}else{
								var title = list.title;
							}							
														
							strAdd += '<tr>';
			                strAdd += '<td>'+list.bno+'</td>';
			                strAdd += '<td><a href="">'+ companyName +'</a></td>';
			                strAdd += '<td><a href="">'+ title +'</a></td>';
			                strAdd += '<td>'+regDate+'</td>';
			                strAdd += '<td>'+list.viewCount+'</td>';
			                strAdd += '</tr>';
						})
						
						$("#mypage-jobBoardList-content").html(strAdd);
					}
					
					//페이지네이션
					
					//이전버튼  추가
					if(data.pageVO.prev){
						strAdd2 += '<li><a href="#" onclick=jobBoardList('+ (data.pageVO.startPage-1) +',10)>이전</a></li> ';
					}
					
					for(var i = data.pageVO.startPage; i <= data.pageVO.endPage; i++){
						
						if(i == data.pageVO.pageNum){
							strAdd2 += '<li class="active"><a href="#">'+ i +'</a></li>';
						}else{
							strAdd2 += '<li><a href="#" onclick="jobBoardList('+i+',10)">'+ i +'</a></li>';
						}
												
					}
					
					//다음버튼 추가
					if(data.pageVO.next){
						strAdd2 += '<li><a href="#" onclick=jobBoardList('+ (data.pageVO.endPage+1) +',10)>다음</a></li> ';
					}
					
					$("#mypage-jobContent-page").html(strAdd2);
					
				},
				error: function(status,error){
					console.log(status,error);
				}
			})
	   	}
		
		//문의내역 탭 클릭시 화면에 뿌려줄 리스트
		$("#mypage-faqBoardList").click(function(){
			faqBoardList(1,10);
		})
		
		function faqBoardList(pageNum,amount){
			
			if(event.target.tagName == "A"){	
    			event.preventDefault();
    		} 
			
			var userId = "${userInfo.userId }"; //session으로 넘어온  userId
			
			$.ajax({
				type: "post",
				url: "mypageFAQBoardList",
				dataType: "json",
				contentType : "application/json",
				data : JSON.stringify({"userId":userId, "pageNum":pageNum, "amount":amount }),
				success: function(data){
			
					//data에는 ArrayList<JobBoardVO>와 UserPageVO가 담겨있다.
					
					var strAdd3 = ''; //리스트를 저장해줄 변수
					var strAdd4 = ''; //페이지네이션을 저장해줄 변수
					
					//리스트 불러오기										
					if(data.list.length == 0){ //만약 해당유저가 채용공고 게시판에 작성한 글이 없다면
						$("#mypage-noContent").css("display","block");//미리 작성해둔 div를 보여줌
						$("#mypage-content-page-wrap").css("display","none");//페이지네이션 삭제
						return;
					}
					else{
						$.each(data.list, function(index, list){ //해당 유저가 채용공고 게시판에 작성한 글이있다면 제이쿼리의 for문
							
							var date = new Date(list.insertDate); //밀리초로 들어오는 형식을 YYYY/MM/DD형식으로 바꿔줌
							var year = date.getFullYear();
							var month = date.getMonth()+1;
							var day = date.getDate();
							
							var regDate = year + "/" + (month < 10 ? "0"+month : month) + "/" + (day < 10 ? "0"+day : day );
							
							//제목 글자수 제한
							if(list.insertTitle.length > 10){
								var title = list.insertTitle.substr(0,9)+"....";
							}else{
								var title = list.insertTitle;
							}
							
							//글내용 글자수 제한
							if(list.insertContent.length > 40){
								var content = list.insertContent.substr(0,29)+"....";
							}else{
								var content = list.insertContent;
							}
													
							strAdd3 += '<tr>';
			                strAdd3 += '<td>'+list.insertBno+'</td>';
			                strAdd3 += '<td><a href="">'+ title +'</a></td>';
			                strAdd3 += '<td><a href="">'+ content +'</a></td>';
			                strAdd3 += '<td>'+regDate+'</td>';			             
			                strAdd3 += '</tr>';
						})
						
						$("#mypage-FAQBoardList-content").html(strAdd3);
					}
					
					//페이지네이션
					
					//이전버튼  추가
					if(data.pageVO.prev){
						strAdd4 += '<li><a href="#" onclick=faqBoardList('+ (data.pageVO.startPage-1) +',10)>이전</a></li> ';
					}
					
					for(var i = data.pageVO.startPage; i <= data.pageVO.endPage; i++){
						
						if(i == data.pageVO.pageNum){
							strAdd4 += '<li class="active"><a href="#">'+ i +'</a></li>';
						}else{
							strAdd4 += '<li><a href="#" onclick="faqBoardList('+i+',10)">'+ i +'</a></li>';
						}
												
					}
					
					//다음버튼 추가
					if(data.pageVO.next){
						strAdd4 += '<li><a href="#" onclick=faqBoardList('+ (data.pageVO.endPage+1) +',10)>다음</a></li> ';
					}
					
					$("#mypage-faqContent-page").html(strAdd4);
					
				},
				error: function(status,error){
					console.log(status,error);
				}
			})
		}
    	
    </script>
