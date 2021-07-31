<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('${pageContext.request.contextPath }/resources/img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>

<body>

    <!-- <header class="custom_header" style="height: 100px; background-color: white;">
        <nav class="navbar">
           
        </nav>
    </header> -->

    <!-- 수정하기버튼 -->
    <script type="text/javascript">
            function modify() {
                if (confirm("수정하시겠습니까?") == true) {    //확인
                    window.location.href="workModify";
                    document.form.submit();
                } else {   //취소
                    return;
                }
            }
        //-->
    </script>

    <section class="product_page">
        <div class="container">
            <!-- 제작자프로필 -->
            <img src="${pageContext.request.contextPath }/resources/img/1.jpg" style="width: 50px;  border-radius: 70%; overflow: hidden;">
            <span style="margin-top:20px;font-size:18px; color: white;">Creator</span>
            <button type="button" onclick="modify();" class="btn btn-default detial-modify" style="float: right;">
                <span class="glyphicon glyphicon-cog" aria-hidden="true">
                </span>
            </button>
            <!-- 카테고리 -->
            <span class="category" style=" float: right; position: relative; top: 5px; font-size:18px; color: white; margin-right: 50px">Market >
                list</span>
            <div class="row">
                <div class="col-md-6" style="padding-top: 20px; height: 500px;">
                    <!-- 이미지 영역 -->
                    <img src="${pageContext.request.contextPath }/resources/img/mountains-6277391_1920.jpg" alt="상품" style="width: 100%;height: 500px;">
                </div>
                <div class="col-md-6" style="height: 300px;">
                    <!-- 상세영역 -->
                    <div class="detail-item" style="height: 200px;">
                        <!-- 상품정보 -->
                        <p class="title" style="color: white; margin-top: 10px;">Mountains Picture</p>
                        <!-- 금액영역 -->
                        <p class="price" style="color: white;">10.00$</p>
                        <p class="description"
                            style="color: white; font-size: medium; width: 557px; height: 200px; word-break:break-all; overflow-x: hidden; overflow-y: scroll;">
                            <span style="height: 300px;">
                                Description
                            </span>
                        </p>
                    </div>
                    <div class="detail-btn" style="height: 200px;">
                        <div class="price" >
                            <!-- 별점 -->
                            <span class="star-input">
                                <span class="input">
                                    <input type="radio" name="star-input" value="1" id="p1">
                                    <label for="p1">1</label>
                                    <input type="radio" name="star-input" value="2" id="p2">
                                    <label for="p2">2</label>
                                    <input type="radio" name="star-input" value="3" id="p3">
                                    <label for="p3">3</label>
                                    <input type="radio" name="star-input" value="4" id="p4">
                                    <label for="p4">4</label>
                                    <input type="radio" name="star-input" value="5" id="p5">
                                    <label for="p5">5</label>
                                </span>
                                <output for="star-input"><b>0</b>Point</output>
                            </span>
                        </div>
                        <!-- 버튼영역 -->
                        <div class="menu">
                           
                        </div>
                        <div class="order" style="padding-top: 45px;">
                            <!-- 버튼영역 -->
                            <button type="button" onclick="Buy();" class ="btn btn-primary" style="border-radius: 15px; float: right;">Buy</button>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function Buy() {
            if (confirm("구매하시겠습니까?") == true) {    //확인
                    document.form.submit();
                } else {   //취소
                    return;
                }
        }
    </script>

    <!-- 댓글 -->
    <section class="comment_page">
        <div class="container">
                <div class="row">
                    <div class="col-xs-12  write-wrap">
                        <form class="reply-wrap">
                            <div class="reply-image">
                                <img src="${pageContext.request.contextPath }/resources/img/profile.png" alt="user" style="border-radius: 20px;">
                            </div>
                            <!--form-control은 부트스트랩의 클래스입니다 (name기술)-->
	                    <div class="reply-content">
	                        <textarea class="form-control" rows="3" name="reply" id="reply"></textarea>
	                        <div class="reply-group">
	                              <div class="reply-input">
	                              <input type="text" class="form-control" placeholder="이름" name="replyId" id="replyId">
	                              </div>
	                              
	                              <button type="button" class="right btn btn-info" id="replyRegist">등록하기</button>
	                        </div>
	
	                    </div>
                        </form>

                        <!--여기에접근 반복-->
                        <div id="replyList">                      	
	                     <!-- 
	                        <div class='reply-wrap'>
	                            <div class='reply-image'>
	                                <img src='../resources/img/profile.png'>
	                            </div>
	                            <div class='reply-content'>
	                                <div class='reply-group'>
	                                    <strong class='left'>honggildong</strong> 
	                                    <small class='left'>2019/12/10</small>
	                                    <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
	                                    <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
	                                </div>
	                                <p class='clearfix'>여기는 댓글영역</p>
	                            </div>
	                        </div>
	                         -->
                        </div>
                        <button type="button" class="btn btn-default btn-block" id="moreList">더보기</button>
                        
                        
                    </div>
                </div>
            </div>
        </section>
        <!-- 모달 ( 제이쿼리 modal("show") ) -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					<h4 class="modal-title">댓글수정</h4>
				</div>
				<div class="modal-body">
					<!-- 수정폼 id값을 확인하세요-->
					<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
					<div class="reply-group">
						<div class="reply-input">
						    <input type="hidden" id="modalRno">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
					</div>
					</div>
					<!-- 수정폼끝 -->
				</div>
			</div>
		</div>
	</div>
	
    <script>
		
    	$(document).ready(function() {
    		
    		//등록이벤트
    		$("#replyRegist").click(function() {
    			
    			var bno =  1/* "${boardVO.bno }" */; //글 번호 이건 나중에 detail에 list로 값을 받아오는 처리를해주면 다시 바꿔줘야함.넵
    			var reply = $("#reply").val();
    			var replyId = $("#replyId").val();

    			
    			if(reply == '' || replyId == '') {
    				alert("이름, 내용은 필수입니다");
    				return; //함수종료
    			}
    			
    			$.ajax({
    				type : "post",
    				url : "../reply/replyRegist",
    				dataType: "json",
    				contentType: "application/json; charset=UTF-8",
    				data : JSON.stringify({"bno": bno, "reply": reply, "replyId": replyId}),
    				success : function(data) {
    					if(data == 1) { //성공
    						$("#reply").val("");
    						$("#replyId").val("");
    						getList(1, true); //데이터 조회 메서드 호출
    					}  else { //실패
    						alert("등록에 실패했습니다. 다시 시도하세요");
    					}
    					
    				},
    				error : function(status, error) {
    					alert("등록 실패입니다. 잠시 후에 다시 시도하세요");
    				}
    			});
    		})
    		
    		
    		//페이지 기능
    		var page = 1; //페이지 번호
    		var strAdd = ""; //댓글 목록 누적 변수
    		
    		$("#moreList").click(function() {
    			getList(++page, false); //목록 호출 (페이지 넘버가 리셋되어야 하는경우 true)
    		})

    		getList(1, true); //데이터 조회 메서드 호출
    		
    		//데이터 조회
    		function getList(pageNum, reset) {
    			
    			var bno =1 /* "${boardVO.bno}" */; //게시글 번호
    			console.log("확인1:"+pageNum);
    			console.log("확인2:"+bno);
    			
    			$.getJSON("../reply/getList/"+ bno + "/" + pageNum, function(data) {
    				console.log(data);
    				
    				var total = data.total; //전체게시글 수
    				var data = data.list; //목록
	    			
    				//페이지에 조건처리
	    			if(page * 20 >= total ) {
	    				$("#moreList").css("display", "none"); //더보기 버튼 처리
	    			} else {
	    				$("#moreList").css("display", "block");
	    			}
    				
    				//reset이 true라면 strAdd를 공백으로 비우고 page = 1로 변경하고 다시 호출
    				if(reset == true) {
    					strAdd = "";
    					page = 1;
    				}
    				

    				//누적할 문자열을 만들고 innerHTML형식으로 replyList아래에 삽입
    				
                    for(var i = 0; i < data.length; i++) {
                    	
                    	strAdd += "<div class='reply-wrap'>";
        				strAdd += "<div class='reply-image'>";
                        strAdd += "<img src='../resources/img/profile.png'>";
                        strAdd += "</div>";
                        strAdd += "<div class='reply-content'>";
                        strAdd += "<div class='reply-group'>";
                        strAdd += "<strong class='left'>"+ data[i].replyId +"</strong>"; 
                       
                        strAdd += "<a href='"+ data[i].rno +"' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
                        strAdd += "<a href='"+ data[i].rno +"' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
                        strAdd += "</div>";
                        strAdd += "<p class='clearfix'>"+data[i].reply +"</p>";
                        strAdd += "</div>";
                    	strAdd += "</div>";
                    
                    }
					
                    $("#replyList").html(strAdd); //추가
                    
                    
    				
    			})
    			
    		} //end getList
    		
    		
    		//수정삭제
    		/*
    		에이잭스 실해이 더 늦게 완료가 되므로, 실제 이벤트 등록이 먼저 일어나게 됩니다. (정상 동작x)
    		부모에 on함수를 이용해서 이벤트를 걸고 이벤트를 a태그에 전파시켜서 사용하는 방법. 
    		*/
    		
    		$("#replyList").on("click", "a", function() {
    			event.preventDefault(); //고유이벤트 중지
    			
    			//클릭한 대상의 번호를 모달창에 저장.
    			var rno = $(this).attr("href");
    			$("#modalRno").val(rno);
    			
    			
    			//replyModify라면 수정창, replyDelete라면 삭제창의 형태로 사용
    			if( $(this).hasClass("replyModify") ) { //수정창
    				
    				$(".modal-title").html("댓글수정");
    				$("#modalModBtn").css("display", "inline"); //수정버튼보여지도록 처리
    				$("#modalDelBtn").css("display", "none"); //삭제버튼은 숨겨지도록 처리
    				$("#modalReply").css("display", "inline"); //수정창 보여지도록
    				
    			} else { //삭제창
    				
    				$(".modal-title").html("댓글삭제");
    				$("#modalModBtn").css("display", "none");
    				$("#modalDelBtn").css("display", "inline");
    				$("#modalReply").css("display", "none");
    			}
    			
    			
    			$("#replyModal").modal("show"); //부트스트랩 모달 함수
    			
    		});
    		
    		//수정 함수
    		$("#modalModBtn").click(function() {
    			
    			var rno = $("#modalRno").val();
    			var reply = $("#modalReply").val();
    			var replyPw = $("#modalPw").val();
    			
    			if(rno == '' || reply == '' || replyPw == '') {
    				alert("내용, 비밀번호는 필수 입니다");
    				return;
    			}
    			
    			$.ajax({
    				type : "post",
    				url : "../reply/update",
    				contentType: "application/json; charset=UTF-8",
    				data : JSON.stringify({"rno": rno, "reply": reply, "replyPw": replyPw}),
    				success : function(data) {
    					
    					if(data == 1) { //업데이트 성공
    						$("#modalReply").val(""); //내용비우기
    						$("#modalPw").val("");
    						$("#modalRno").val("");
    						
    						$("#replyModal").modal("hide"); //모달창 내리기
    						getList(1, true); //조회 메서드 호출
    					} else { //업데이트 실패
    						alert("비밀번호를 확인하세요");
    						$("#modalPw").val("");
    					}
    					
    				},
    				error : function(data) {
    					alert("수정에 실패했습니다. 관리자에게 문의하세요");
    				}
    			});
    			
    			
    		})
    		
    		//삭제 함수
    		$("#modalDelBtn").click(function() {
    			
    			/*
    			1. 모달창에서 rno값, replyPw값을 얻습니다.
    			2. ajax함수를 이용해서 POST방식으로 "reply/delete" 요청을 보냅니다.
    			   필요한 값은 REST API에서 JSON형식으로 받아서 처리
    			3. 서버에서는 요청을 받아서 비밀번호 확인하고, 비밀번호가 일치하면 삭제를 진행합니다.
    			4. 비밀번호가 틀린경우는 0을 반환해서 경고창을 띄워주면 됩니다.
    			*/
    		});
    		
    		
    		
    		
    	}); //end ready
        
    	
    	
    </script>

   <!--  <footer style="height: 100px; background-color: white;">
       
    </footer> -->
	 
    <!--별찍기-->
    
   <%--  <script src="${pageContext.request.contextPath }/resources/js/jquery-1.11.3.min.js"></script> --%> 
    <script src="${pageContext.request.contextPath }/resources/js/star.js"></script> 

</body>

</html>