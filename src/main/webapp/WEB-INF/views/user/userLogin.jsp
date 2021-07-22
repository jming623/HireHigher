<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="userLogin-section">

	<div class="userLogin-container container">
		<div class="userLogin row">
			<div class="login-form">

				<div class="loginTitle">
					<h2>로그인</h2>
				</div>
	
				<form action="loginForm" method="post">

					<div class="form-group">
						<label for="id">아이디</label> 
						<input type="text" class="form-control" name="userId" id="userId">
					</div>

					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" name="userPw" id="userPw">
					</div>

					<ul class="userLogin-find">
						<li><a href="#" onclick="findPw()"><small>비밀번호찾기</small></a></li>
						<li><a href="#" onclick="findId()" style="margin: 0 5px;"><small>아이디찾기</small></a></li>
					</ul>

					<div class="form-group">
						<button type="submit" class="btn btn-lg btn-info btn-block"
							id="loginBtn">로그인</button>
					</div>

					<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
						src="${pageContext.request.contextPath }/resources/img/Large_and_Narrow.png" />
					</a>
				</form>

			</div>

		</div>

	</div>

</section>

<script>
	var msg = "${msg}";
	if (msg != '') {
		alert(msg);
	}
	
	function findId(){
		event.preventDefault();
		window.open("../resources/find/findId.jsp","findId","width=750,height=500,left=550,top=180,location=no,scrollbars=no");
	}
	
	function findedId(checkedId){ //자식페이지에서 넘어온 checkedId값을 검증하고 폼안에 아이디값에 넣어줌
		
		if( checkedId != null){			
			$("#userId").val(checkedId);
		} 
	}
	
	function findPw(){
		event.preventDefault();
		window.open("../resources/find/findPw.jsp","findId","width=750,height=500,left=550,top=180,location=no,scrollbars=no");
	}
	
	//카카오 로그인
	
	Kakao.init('45d71813cd530ea06436f00a05679428'); //KaKao에서 발급받은 JavaScript키를 초기화시킴
	Kakao.isInitialized(); //SDK가 초기화되었는지 확인하는 함수 //초기화가 되면 콘솔창에 true를 반환
		
	function loginWithKakao(){
		
		Kakao.Auth.login({
			scope : 'profile_nickname, account_email',
			success : function(authObj){
				console.log(authObj);	
				
				Kakao.API.request({
					url:'/v2/user/me',
					success: function(response){
						console.dir(response);
						console.log(response.id);
						console.log(response.kakao_account);
						console.log(response.kakao_account.email);
						console.log(response.kakao_account.profile.nickname);
						
						var userId = response.id;
						var userEmail = response.kakao_account.email;
						var nickName = response.kakao_account.profile.nickname;
						
						//id가 회원정보에 있는지 검사
						$.getJSON("idCheck/"+userId, function(data){
							if(data == 1){//회원정보에 id가 존재 => 바로로그인 처리																
								location.href="kakaoLogin?userId="+userId;
							}else{ //회원정보에 id가 존재하지않음 => 회원정보를 추가한뒤 로그인처리
								$.ajax({
									type: "post",
									url: "kakaoJoin",
									dataType: "json",
									contentType: "application/json",
									data: JSON.stringify({"userId":userId, "userEmail": userEmail, "nickName": nickName}),
									success : function(data){
										
									},
									error: function(status,error){
										
									}
								})
							}
						})
												
						
					}
				})
				
			}
		});
	} 
	
</script>