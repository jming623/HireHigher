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
	
</script>