<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
	
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

    <link href="${pageContext.request.contextPath }/resources/css/findPw.css" rel="stylesheet">  
    
</head>
<body>
	<section>
        <div class="container findPw">
            <div class="row">
                <div class="col-md-10 findPw-wrap">
                    <div class="findPw-title">
                        <h2>비밀번호 찾기</h2>
                    </div>
                    <p>*가입시 입력하신 아이디, 사용자 이름, 이메일을 입력해주세요.</p>
                    <div class="findPw-content">
                        <div class="findPw-content-wrap">
                            <div>
                                <input type="radio" id="findPwEmail" name="findIdRadio" checked="checked">
                                <label for="">이메일 인증</label>
                            </div>
                            <div class="findPw-content-birth">
                                <form action="">
                                    <table class="findPw-content-table">
                                        <tr>
                                            <th><label for="">아이디</label></th>
                                            <td><input type="text" id="findPw_id" name=""></td>
                                        </tr>
                                        <tr>
                                            <th><label for="">이름</label></th>
                                            <td><input type="text" id="findPw_name" name="" placeholder="홍길동"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="">이메일</label></th>
                                            <td><input type="text" id="findPw_email" name="" placeholder="xxx123@naver.com"></td>
                                        </tr>                                    
                                    </table>
                                                           
                                    <div class="findPw-content-btn">
                                        <button type="button" class="findPw-right" id="findPw-confirm">확인</button>
                                        <button type="reset" class="findPw-right">취소</button>
                                    </div>
                                </form>
                            </div>
                            
                            <div class="findPw-result" id="findPwResult_ok" style="display: none;">
                                <strong style=>결과:</strong> <br>
                                <strong style=>입력하신 이메일로 비밀번호가 발송되었습니다.</strong> <br>
                                <a href="location.href=''">로그인화면으로 돌아가기</a>
                            </div>
                            
                            <div class="findPw-result" id="findPwResult_fail" style="display: none;">
                                <strong style=>결과:</strong> <br>
                                <strong style=>입력하신 정보로 가입된 회원이없습니다.</strong> <br>
                                <a href="location.href=''">회원가입 화면으로 이동</a>
                            </div>
                             
                        </div>
                    </div>
                   
                    
                                        
                </div>               
            </div>
        </div>
    </section>
	
</body>

	 <script>
        
        $("#findPw-confirm").click(function(){

            var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

            var userId = $("#findPw_id").val();
            var userName = $("#findPw_name").val();
            var userEmail = $("#findPw_email").val();
            
            if( userId == '' ){
                alert("아이디 입력은 필수입니다.");
                return;
            }else if( userName == '' ){
                alert("이름 입력은 필수입니다.");
                return;
            }else if( userEmail == '' ){
                alert("이메일 입력은 필수입니다.");
                return;
            }else if( ! emailRegex.test(userEmail) ){
                alert("잘못된 이메일 형식입니다.");
                return;
            }else if($("#findPwResult_ok").css("display") == "block"){ //이미 이메일을 전송했다면 return
            	return;
            }
            
            //아이디 정보 유무 확인
            $.getJSON("../../user/idCheck/"+userId, function(data){ 
				if(data == 0) {//아이디가 없는경우
					alert("존재하지 않는 아이디입니다.");
					return;
				}
			})
			
			//이메일 정보 유무 확인
			$.ajax({
			type: "post",
			url: "../../user/emailCheck", //현재경로 http://localhost:8181/HireHigher/resources/find/findPw.jsp
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({"userEmail":userEmail}),
			success: function(data){
				if(data == 0) {//이메일정보가 존재하지 않는경우
					alert("존재하지 않는 이메일입니다.");
					return;
				}
			},
			error: function(status,error){
				console.log(status,error);
			}			
			})
			
			//위에 과정들을 모두 통과하였다면 이메일 전송 
            $.ajax({
            	type: "post",
            	url: "../../user/sendEmailPw",
            	dataType: "json",
            	contentType: "application/json; charset=UTF-8",
            	data: JSON.stringify({"userId":userId, "userEmail":userEmail, "userName":userName}),
            	success: function(data){
            		
            		if(data == 1){
            			
            			if( $("#findPwResult_fail").css("display") != "none" ){
            				$("#findPwResult_fail").css("display","none");
            			}
            			
            			$("#findPwResult_ok").css("display","block");
            		}else{
            			if( $("#findPwResult_ok").css("display") != "none" ){
            				$("#findPwResult_fail").css("display","none");
            			}
            			
            			$("#findPwResult_fail").css("display","block");
            		}
            	},
            	error: function(status, error){
            		console.log(status,error);
            	}
            })

            
        })

    </script>
    
</html>