<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	
	<section class="createBoard">
        <div class="container createBoard-container">           
            
            <div class="creation-list-btn" id="creation-list-btn">                            
                <button type="button" class= "${pageVO.cri.category eq '2D_ART' ? 'creation-list-active'  : '' }" value="2D_ART" >2D Art</button>
                <button type="button" class= "${pageVO.cri.category eq '3D_ART' ? 'creation-list-active'  : '' }" value="3D_ART" >3D Art</button>
                <%-- <button type="button" class= "${pageVO.cri.category eq 'Video/Firm' ? 'creation-list-active'  : '' } ">Video/Firm</button> --%>
                <button type="button" class= "${pageVO.cri.category eq 'Interior' ? 'creation-list-active'  : '' }" value="Interior" >Interior</button>
                <button type="button" class= "${pageVO.cri.category eq 'Architecture' ? 'creation-list-active'  : '' }" value="Architecture" >Architecture</button>
            </div>

            <div class="row" id="workBoard-row">

			<c:forEach var="vo" items="${listVO}">
				<div class="creation-list-wrap col-md-3 col-xs-4">
                    <div class="creation-list">
                        <div class="prod-img"> <!-- 이미지영역 -->
                                <a href=""><img src="workBoardView/${vo.productLocation}/${vo.productReal}"  alt=""></a>
                            </div>
                        <div class="prod-profile"> <!-- 제작자프로필영역 -->
                            <div class="prod-profile-img"> <!-- 왼쪽 -->    
                                <a href="">
                                    <img src="${pageContext.request.contextPath }/resources/img/profile.png" alt="">
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
            
        if( $(this).attr("class") == "creation-list-active"){
            return;
        }else if($(this).attr("class") == ""){
            
        	var changeCate = $(this).val();
        	
        	location.href="workBoard?pageNum=1&amount=20&Category="+changeCate;
        	
            /* var btnCheck = $("#creation-list-btn").children();
            
            for(var i = 0; i < btnCheck.length; i++){               
                if(btnCheck[i].className == "creation-list-active"){
                    btnCheck[i].classList.remove("creation-list-active");
                }               
            }
             $(this).addClass("creation-list-active"); */
        }
    })
   

    //인피니트 스크롤
    window.onscroll = function(){
    	//console.log("현재화면높이: " + window.innerHeight);//보이는 화면높이
        //console.log("스크롤: " + window.scrollY);//스크롤Y축(세로)이동
        //console.log("합:"+(window.innerHeight + window.scrollY));
        //console.log("문서의 전체길이: "+document.body.offsetHeight);//문서의 전체길이
		
        if((window.innerHeight + window.scrollY)+1 >= document.body.offsetHeight){ 
              //console.log("현재화면높이: " + window.innerHeight);//보이는 화면높이
              //console.log("스크롤: " + window.scrollY);//스크롤Y축(세로)이동
              //console.log("합:"+(window.innerHeight + window.scrollY));
              //console.log("문서의 전체길이: "+document.body.offsetHeight);//문서의 전체길이
            
            console.log("if문이실행됨");
            
            //이미지를 불러오기전 현재 카테고리 판별
            var currentCate = $(".creation-list-active").val();
            //console.log(currentCate);
         	
            var amount = 20; //기본값
            
            //pageNum을 불러옴
            var pageNum = $("#setPageNum").val();
            
            //console.log("+1하기전 pageNum: "+ pageNum);
            
           	pageNum++;
           	
           	//console.log("현재페이지:"+pageNum);
           	
           	$.ajax({
           		type:"post",
           		url:"addWorkList",
           		dataType:"json",
           		contentType: "application/json; charset=UTF-8",
    			data: JSON.stringify({"pageNum":pageNum,"amount":amount,"category":currentCate}),
           		success: function(data){
           			//console.log(data);
           			
           			if(data.length == 0){
           				//console.log("더이상 불러올 리스트가 없음");  
           				alert("더이상 불러올 리스트가 없습니다.");
           				return;
           			}
 			           		
           			for(var i = 0 ; i < data.length; i++){
           				
           				var toAdd = document.createElement("div");
               			strAdd = '';
               			
               			strAdd += '<div class="creation-list">';
                        strAdd += '<div class="prod-img">';
                        strAdd += '<a href=""><img src="workBoardView/' + data[i].productLocation + '/'+ data[i].productReal +'" art=""></a>';                    
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
           			masonry(); 	 
           			//++된 pageNum을 적용
           			$("#setPageNum").val(pageNum);
           			
           		},
           		error: function(error,status){
           			console.log(error,status);
           		}
           		
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


	