<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <section>
    <div class="container">
        <div class="row">
            <div class="update-all">
                
                <!-- 왼쪽 영역-------------------------------- -->
                <div class="update-left-box">
                    <ul class="update-ul-box">
                        <li><a href="faqList">FAQ고객센터</a></li>
                        <li><a href="mtomPage">1:1문의내역</a></li>
                        <li><a href="../user/mypage">마이페이지</a></li>
                    </ul>
                </div>
                <!-- 오른쪽 영역------------------------------ -->
                <form action="updateForm" method="post">
                <div class="update-right-box">
                    <div class="update-question-sector"><!-- 문의 등록 영역 -->
                        <div class="update-question-title-box"> <!-- 문의 데이터 제목 -->
                            <div><!-- 작성일-->
                                <p>작성일</p>
                            </div>

                            <div><!-- 글 번호 -->
                                <p>글 번호</p>
                            </div>

                            <div class="update-question-kinds"> <!-- 문의 분류 -->
                              <p>문의 분류</p>
                              <span>(필수)</span>
                           </div>

                           <div class="update-question-id"> <!-- 아이디 -->
                                <p>아이디</p>
                           </div>
                        
                           <div class="update-question-title"> <!-- 제목 -->
                            <p>제목</p>
                            <span>(필수)</span>
                           </div>
                        
                           <div class="update-question-content"> <!-- 내용 -->
                              <p>내용</p>
                              <span>(필수)</span>
                           </div>
                        </div>

                        <div class="update-input-kinds"><!-- 문의 데이터 input 내용 -->
                            <div><!-- 작성일-->
                                <p>${update.insertDate}</p>
                            </div>

                            <div><!-- 글 번호 -->
                               <input name="insertBno" value="${update.insertBno}">
                            </div> 

                            <div> <!-- 문의 분류 -->
                                <select name="insertKind">
                                    <option value="계정 관련">계정 관련</option>
                                    <option value="결제/배송/환불">결제/배송/환불</option>
                                    <option value="상품 문제관련">상품 문제관련</option>
                                    <option value="기타사항">기타사항</option>
                                </select>
                            </div>
                         
                            <div class="update-input-id"> <!-- 아이디 -->
                                 <input type="text" name="insertId" value="${update.insertId}">
                            </div>
                         
                            <div class="update-input-title"> <!-- 제목 -->
                               <input type="text" name="insertTitle" required="required" value="${update.insertTitle}">
                            </div>
                         
                            <div class="update-input-content"> <!-- 내용 --> <!--ckeditor로 sts에서 사용할것임-->
                               <textarea class="insert-input-text" required="required" name="insertContent" name="" rows="15" cols="100" wrap="hard">${update.insertContent}</textarea>
                            </div>
                             <div>
                            	<input class="insert-input-answer" name="insertImg" id="insertImg" type="text" >
                            </div>
                        </div>
                    </div>

                    <!-- 파일 업로드 폼입니다 -->
					<div class="fileDiv">
						<img id="fileImg" src="../resources/img/img_ready.png">
					</div>
					<div class="reply-content">
						
						<div class="reply-group">
							<div class="filebox pull-left">
								<label for="file">이미지업로드</label>
								<input style="display: none;" type="file" name="file" id="file">
							</div>
							
							<button type="button" class="right btn btn-info" id="uploadBtn">등록하기</button>
							
						</div>
					</div>

                    <!-- 문의하기 취소하기 버튼-->
                    <div class="update-btn-qne">
                        <button type="button" class="update-btn-right btn btn-default" onclick="location.href='mtomPage'">취소하기</button>
                        <button type="submit" class="update-btn-left btn btn-primary">수정하기</button>
                    </div>

                </div>
                </form>
            </div>
        </div>
    </div>
    </section>

    <!-- 파일추가 js -->
    
 <script>
		$(document).ready(function() {
			
			$("#uploadBtn").click(function() {
				//var writer = '${sessionScope.userVO.userId}'; //아이디
				var file = $("#file").val();
				//var content = $("#content").val();
				
				file = file.slice( file.lastIndexOf(".", file.length) + 1, file.length); //파일확장자
				
				if(file != 'jpg' && file != 'png' && file != 'bmp') {
					alert("이미지 파일형태만 등록가능 합니다(jpg, png, bmp)");
					return;
					
				}  //이미지 안올릴시 무조건 뜸
				
				if( /*writer == ''*/ false) {
					alert("로그인이 필요한 서비스 입니다");
					return;
				}
				
				//파일데이터
				//console.log( $("#file")[0] );
				//console.log( $("#file")[0].files );
				//console.log( $("#file")[0].files[0] );
				//비동기형식의 폼데이터 사용
				var formData = new FormData();
				//formData.append("content", content); //키, 값
				formData.append("file", $("#file")[0].files[0] );
				
				$.ajax({
					type: "post",
					url: "insertQImg",
					processData : false, //키=값으로 전송되는것을 막는 옵션
					contentType : false, //default 멀티파트 폼데이터 형식으로 지정
					data : formData,
					success : function(data) {
						
						alert(data);
						console.log( $("#insertImg") );
						console.log( $("#insertImg").attr("value") );
						
						$("#insertImg").attr("value",data);
						
						console.log( $("#insertImg").attr("value") ); 
						
					},
					error : function(status, error) {
						alert("에러 : 서버 문제가 발생했습니다. 관리자에게 문의하세요.");
					}
				})
			}); //등록이벤트 
			
			
		});
	
	
	</script>
	
	<script>
		//자바 스크립트 파일 미리보기 기능
		function readURL(input) {
        	if (input.files && input.files[0]) {
        		
            	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
            	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
	        	reader.readAsDataURL(input.files[0]); 
            	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
	            $(".fileDiv").css("display", "block");
            	
            	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                	$('#fileImg').attr("src", event.target.result); 
                	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
	        	}
        	}
	    }
		$("#file").change(function() {
	        readURL(this); //this는 #file자신 태그를 의미
	        
	    });
	</script>