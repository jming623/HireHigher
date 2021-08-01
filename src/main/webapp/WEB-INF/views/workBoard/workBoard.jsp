<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	
	<section class="createBoard">
        <div class="container createBoard-container">           
            <!-- 7. ${pageVO}로 컨트롤러 측에서 model을 통해 넘겨준 값을 확인 -->
            <!-- 8. ${pageVO.cri.category}값을 확인해서 버튼의 정보와 같다면 creation-list-active클래스를 줌.(현재 선택된 버튼을 표시하는 기능) -->
            <div class="creation-list-btn" id="creation-list-btn">                            
                <button type="button" class= "${pageVO.cri.category eq '2D_ART' ? 'creation-list-active'  : '' }" value="2D_ART" >2D Art</button>
                <button type="button" class= "${pageVO.cri.category eq '3D_ART' ? 'creation-list-active'  : '' }" value="3D_ART" >3D Art</button>
                <%-- <button type="button" class= "${pageVO.cri.category eq 'Video/Firm' ? 'creation-list-active'  : '' } ">Video/Firm</button> --%>
                <button type="button" class= "${pageVO.cri.category eq 'Interior' ? 'creation-list-active'  : '' }" value="Interior" >Interior</button>
                <button type="button" class= "${pageVO.cri.category eq 'Architecture' ? 'creation-list-active'  : '' }" value="Architecture" >Architecture</button>
            </div>

            <div class="row" id="workBoard-row">

			<!-- 9. forEach문으로 리스트를 찍어줌 -->
			<c:forEach var="vo" items="${listVO}">
				<div class="creation-list-wrap col-md-3 col-xs-4">
                    <div class="creation-list">
                        <div class="prod-img"> <!-- 이미지영역 -->
                        		<!-- 10. SRC경로는 다시 WorkBoard컨트롤러로 들어가 workBoardView클래스를 작동하고 결과값을 화면으로 받아옴 
                        		(데이터베이스에서 이미지정보를 받아올 때  보안상의 이유로 로컬환경에 접근할 수 없어서 일련의 과정을 거쳐 받아와야 함)  -->
                                <a href="workDetail?bno=${vo.bno} "><img src="workBoardView/${vo.productLocation}/${vo.productReal}"  alt=""></a>
                            </div>
                        <div class="prod-profile"> <!-- 제작자프로필영역 -->
                            <div class="prod-profile-img"> <!-- 왼쪽 -->    
                                <a href="../creator/findCreator?creatorNick=${vo.creatorName} ">
                                	<!-- 11. 사용자 프로필사진은 크리에이터페이지와 연결해서 받아와야 함(현재는 연결전이라 기본이미지) -->
                                    <img src="${pageContext.request.contextPath }/resources/img/profile.png" alt="">
                                    <!-- 12. 크리에이터닉네임을 받아서 찍어줌  -->
                                    <strong>${vo.creatorName}</strong>
                                </a>
                            </div>
                            <div class="prod-profile-star"> <!-- 오른쪽 -->
                                <ul>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star-empty"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
			</c:forEach>




			<!-- 사진1 -->
             <%--    <div class="creation-list-wrap col-md-3 col-xs-4">
                    <div class="creation-list">
                        <div class="prod-img"> <!-- 이미지영역 -->
                                <a href=""><img src="${pageContext.request.contextPath }/resources/img/car3.jpg" alt=""></a>
                            </div>
                        <div class="prod-profile"> <!-- 제작자프로필영역 -->
                            <div class="prod-profile-img"> <!-- 왼쪽 -->    
                                <a href="">
                                    <img src="${pageContext.request.contextPath }/resources/img/profile.png" alt="">
                                    <strong>제작자1</strong>
                                </a>
                            </div>
                            <div class="prod-profile-star"> <!-- 오른쪽 -->
                                <ul>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star"></i></li>
                                    <li><i class="glyphicon glyphicon-star-empty"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div> --%>
               

            </div>
        </div>
        <!-- 13. 인피니티스크롤 구현시 화면이동을 할 수없어 비동기로 처리할때 화면을 불러올때마다 현재 pageNum을 갱신하고 갱신된 pageNum을  컨트롤러로 보내주기위해 필요 -->
        <!-- 동작원리는 아래  26번 부분을 참고 (최초 pageNum은 화면이 생성될때 컨트롤러로부터 넘어오는 pageVO에 pageNum값)-->
        <input type="hidden" id="setPageNum" value="${pageVO.cri.pageNum}">
        
    </section>
</body>

	<script>
	
	/* var pageNum = 1; */
	
    $(function () {
    	
        masonry();
              
    });

    //핀터레스트 게시판 적용
    function masonry(){   
    	
        $("#workBoard-row").imagesLoaded().done(function (instance) {//imagesLoaded().done -> 이미지 로드가 끝난뒤에 실행 imagesLoaded().progress -> 이미지로드가 될때마다 실행
            console.log("로드");
            //console.log(instance);//없어도 무관 이미지로드에대한 정보

            $("#workBoard-row").masonry({ //.row를 큰틀로잡고, .creation-list-wrap를 세부항목으로 잡음
            columnWidth: 2, // 
            itemSelector: '.creation-list-wrap',
        
            });

            $("#workBoard-row").masonry('reloadItems'); //모든 항목 요소를 다시 수집
            $("#workBoard-row").masonry('layout'); //모든 항목 요소를 배치
            
    }); 
        
    }
    
    //카테고리 버튼 
    $("#creation-list-btn").on("click","button", function(){
        
    	//14. 카테고리 버튼 클릭시 creation-list-active클래스를 가지고있다면 현재 선택된 버튼이니 다시 데이터를 받아올 필요가 없어 return
        if( $(this).attr("class") == "creation-list-active"){
            return;
        }else if($(this).attr("class") == ""){
            // 15. 다른 카테고리 버튼을 클릭했다면 해당 버튼이 가지고 있는 value값을 가져옴 (value값에는 해당 버튼의 Category값이 담겨있음) 
        	var changeCate = $(this).val();
        	
            // 16. workBoard를 다시 요청 요청경로에 get방식으로 넘겨주는 pageNum,amout,변경된 Category값이 workBoard클래스 매게변수인  WorkBoardCriteria cri에
            // 	      매핑되어 다른카테고리에 리스트를 불러옴
        	location.href="workBoard?pageNum=1&amount=20&Category="+changeCate;
        	
        }
    })
   

    //인피니트 스크롤
    window.onscroll = function(){
    	/* console.log("현재화면높이: " + window.innerHeight);//보이는 화면높이
        console.log("스크롤: " + window.scrollY);//스크롤Y축(세로)이동
        console.log("합:"+(window.innerHeight + window.scrollY));
        console.log("문서의 전체길이: "+document.body.offsetHeight);//문서의 전체길이 */
		       
        
        //17. 인피니트 스크롤 동작 원리 (사용자화면에 높이 + 스크롤된 높이가 문서전체높이보다 같거나 커지면 동작)
        // 우리는 이 동작이 일어나면 page가 1에서 2로 2에서 3으로 넘어간다고 생각하고 기능을 구현해야함.        
        if((window.innerHeight + window.scrollY)+1 >= document.body.offsetHeight){ 
              //console.log("현재화면높이: " + window.innerHeight);//보이는 화면높이
              //console.log("스크롤: " + window.scrollY);//스크롤Y축(세로)이동
              //console.log("합:"+(window.innerHeight + window.scrollY));
              //console.log("문서의 전체길이: "+document.body.offsetHeight);//문서의 전체길이
            
            console.log("if문이실행됨");
            
            // 18.이미지를 불러오기전 현재 카테고리 판별(creation-list-active클래스를 가지고 있는 버튼이 현재 선택된 카테고리)
            var currentCate = $(".creation-list-active").val();
            //console.log(currentCate);
         	
            var amount = 20; //기본값
            
            // 19. pageNum을 불러옴(13번에 pageNum을 불러와 현재 pageNum을 판별한다.)
            var pageNum = $("#setPageNum").val();
            
            //console.log("+1하기전 pageNum: "+ pageNum);
            
            // 20. 현재 구문(if문)이 실행되었다는것은 다음페이지를 불러온다는 의미임으로 pageNum에 +1을해줌
           	pageNum++;
           	
           	//console.log("현재페이지:"+pageNum);
           	
           	// 21. 비동기로 화면에 새로운 리스트를 찍어줌
           	$.ajax({
           		type:"post",
           		url:"addWorkList",
           		dataType:"json",
           		contentType: "application/json; charset=UTF-8",
           		//22. 현재페이지가 1이라면 20번에서 ++가 되어 2가 됨, amount값은 고정 20이고, category값은 18번에서 불러옴
    			data: JSON.stringify({"pageNum":pageNum,"amount":amount,"category":currentCate}),   			
           		success: function(data){
           			//console.log(data);
           			
           			//23. workBoard컨트롤러에 addWorkList 클래스를 실행하고, data에는  컨트롤러 측에서 return값으로 넘어온  다음페이지에 해당하는 list들이 담겨있다.
           			
           			//24. 만약 리스트에 길이가 0이라면 더이상 불러올 리스트가 없다는것으로 판단하고 경고창 출력
           			if(data.length == 0){
           				//console.log("더이상 불러올 리스트가 없음");  
           				alert("더이상 불러올 리스트가 없습니다.~");
           				return;
           			}
 			        
           			//25. 받아온 list에 길이(갯수)만큼 for문을 돌려 기존에 리스트에 더해준다. (확인해야할 부분: 이미지경로, 크리에이터이름)
           			for(var i = 0 ; i < data.length; i++){
           				
           				var toAdd = document.createElement("div");
               			strAdd = '';
               			
               			strAdd += '<div class="creation-list">';
                        strAdd += '<div class="prod-img">';
                        strAdd += '<a href="workDetail?bno='+ data[i].bno +'"><img src="workBoardView/' + data[i].productLocation + '/'+ data[i].productReal +'" art=""></a>';                    
                        strAdd += '</div>';
                        strAdd += '<div class="prod-profile">';
                        strAdd += '<div class="prod-profile-img">'; 
                        strAdd += '<a href="">';
                        strAdd += '<img src="${pageContext.request.contextPath }/resources/img/profile.png" alt="">';
                        strAdd += '<strong>'+ data[i].creatorName +'</strong>';
                        strAdd += '</a>';
                        strAdd += '</div>';
                        strAdd += '<div class="prod-profile-star">';
                        strAdd += '<ul>';
                        strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                        strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                        strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                        strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                        strAdd += '<li><i class="glyphicon glyphicon-star-empty"></i></li>';
                        strAdd += '</ul>';
                        strAdd += '</div>';
                        strAdd += '</div>';
                        strAdd += '</div>';
                        strAdd += '</div>';

                       
                        $(toAdd).addClass("creation-list-wrap");
                        $(toAdd).addClass("col-md-3");
                        $(toAdd).addClass("col-xs-4");
                            
                        $(toAdd).html(strAdd);
            
                        $("#workBoard-row").append(toAdd);

               			
           			}
           			//페이지가 모두 로드된뒤에 핀터레스트 형식으로 게시판을 재정렬
           			masonry();
           			
           			//26. ++된 pageNum을 적용  , 이곳에 value값을 바꿔줌-> <input type="hidden" id="setPageNum" value="${pageVO.cri.pageNum}">
           			//(이 작업을 해주징 않으면 다음에 동작할때도   "${pageVO.cri.pageNum}"계속 이값을 받아오게되는데 이값은 변함없이 1이라 계속 2페이지에 관련된 리스트만 불러오게됨)
           			//아래 구문이 동작되면 <input type="hidden" id="setPageNum" value="2">로 바뀌고 다음에 동작할때 pageNum으로 2를 받아와서 정상적으로 작동할 수 있음
           			$("#setPageNum").val(pageNum);
           			
           		},
           		error: function(error,status){
           			console.log(error,status);
           		}
           		   //27번은 10번에서 이미지를 src경로로 불러올때 workBoard컨트롤러에 workBoardView클래스를 실행하게 되는데 그곳에서 시작됨.
           	})
           		
				
            
        }
        
    }
            //기존 데이터
            /* for(var i = 1; i <= 20; i++){
                
                var toAdd = document.createElement("div");
                strAdd = '';
                
                strAdd += '<div class="creation-list">';
                strAdd += '<div class="prod-img">';
                strAdd += '<a href=""><img src="${pageContext.request.contextPath }/resources/img/img'+i+'.jpg" art=""></a>';
                strAdd += '</div>';
                strAdd += '<div class="prod-profile">';
                strAdd += '<div class="prod-profile-img">'; 
                strAdd += '<a href="">';
                strAdd += '<img src="${pageContext.request.contextPath }/resources/img/profile.png" alt="">';
                strAdd += '<strong>제작자'+i+'</strong>';
                strAdd += '</a>';
                strAdd += '</div>';
                strAdd += '<div class="prod-profile-star">';
                strAdd += '<ul>';
                strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                strAdd += '<li><i class="glyphicon glyphicon-star"></i></li>';
                strAdd += '<li><i class="glyphicon glyphicon-star-empty"></i></li>';
                strAdd += '</ul>';
                strAdd += '</div>';
                strAdd += '</div>';
                strAdd += '</div>';
                strAdd += '</div>';
            
                $(toAdd).addClass("creation-list-wrap");
                $(toAdd).addClass("col-md-3");
                $(toAdd).addClass("col-xs-4");
                    
                $(toAdd).html(strAdd);
    
                $("#workBoard-row").append(toAdd);

            } */
             
    
	</script>


	