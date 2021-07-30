<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<section class="mypage">

    <div class="container mypage-container">
        <div class="row">
            <div class="col-md-12 col-xs-12" >
                <div class="mypage-title">
                    <span>내정보수정</span>
                </div>   

                <ul class="nav nav-tabs mypage-nav">             
                    <li class="active"><a data-toggle="tab" href="#menu1">내정보</a></li>
                </ul>
    
                <div class="tab-content mypage-wrap">
                    <div id="menu1" class="tab-pane fade in active">
                        <form id="modifyForm" action="modifyForm">
                            <table class="table mypage-table">
                                <tbody class="m-control">
                                    <tr><td class="m-title">아이디 (*변경불가)</td></tr>
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="userId" id="userId" value="${userInfo.userId }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">비밀번호</td></tr>
                                    <tr>
                                        <td>
                                        	<input class="form-control mypage-input" type="password" name="userPw" id="userPw" value="${userInfo.userPw }" placeholder="영문 숫자 기호 포함 8~16자" >
                                        	<span id="msgPw"></span>
                                        </td>
                                    </tr>
                                    <tr><td class="m-title">비밀번호 확인</td></tr>
                                    <tr>
                                        <td>
                                        	<input class="form-control mypage-input" type="password" name="pwCheck" id="pwCheck" value="" placeholder="영문 숫자 기호 포함 8~16자">
                                        	<span id="msgPwCheck"></span>
                                        </td>
                                    </tr>
                                    <tr><td class="m-title">이름 (*이름변경은 관리자에게 문의하세요)</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="userName" id="userName" value="${userInfo.userName }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">닉네임 (*닉네임 변경은 관리자에게 문의하세요)</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="nickName" id="nickName" value="${userInfo.nickName }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">생년월일 (*변경불가)</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="birthDay" id="birthDay" value="${userInfo.birthDay }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">이메일</td></tr>                              
                                    <tr>
                                        <td>
                                        	<input class="mypage-modify-zipcode form-control mypage-input" type="text" name="userEmail" id="userEmail" value="${userInfo.userEmail }" style="margin-bottom:0;">
                                        	<button type="button" id="userEmailCheck" class="btn btn-info mypage-modify-Btn">이메일인증</button>
                                        	<span id="msgUserEmail" style="display:inline-block;"></span>
                                        </td>
                                    </tr>
                                    
                                    <tr id="emailAuthWrap" style="display:none;">
              							<td style="display:block;">
              								<input type="text" class="form-control mypage-input" name="emailAuth" id="emailAuth" placeholder="인증번호를 입력해주세요.">
              								<span id="msgEmailAuth"></span>
              							</td>
              						<tr>
              						
                                    <tr><td class="m-title">전화번호</td></tr>                              
                                    <tr>
                                        <td>
                                        	<input class="form-control mypage-input" type="text" name="userCellNum" id="userCellNum" value="${userInfo.userCellNum }" >
                                        	<span id="msgUserCellNum"></span>                    	
                                        </td>
                                        
                                    </tr>                                   
                                    <tr><td class="m-title">주소</td></tr>                              
                                    <tr>
                                        <td>
                                            <input class="mypage-modify-zipcode form-control mypage-input" type="text" name="addrZipNum" id="addrZipNum" value="${userInfo.addrZipNum }" readonly >
                                            <button type="button" id="findAddr" class="btn btn-info mypage-modify-Btn">우편번호찾기</button>
                                        </td>

                                    </tr>
                                                                  
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="addrBasic" id="addrBasic" value="${userInfo.addrBasic }" ></td>
                                    </tr>
                                                                 
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="addrDetail" id="addrDetail" value="${userInfo.addrDetail }" ></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            
                            <div>
                                <button type="button" id="requestModify" class="btn btn-primary btn-block mypage-modify-btnheight">수정하기</button>
                                <button type="button" class="btn btn-danger btn-block mypage-modify-btnheight" onclick="location.href='mypage'">돌아가기</button>    
                            </div>                           

                        </form>
    
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>

    </section>

    <script>   	
    	var original_email= "${userInfo.userEmail}";
    </script>
    
    <script src="${pageContext.request.contextPath }/resources/js/mypageModify.js?1"></script>

	<script>
	//폼검증 및 서브밋작업
	$("#requestModify").click(
			function() {

				var userPw = $("#userPw").val();
				var pwCheck = $("#pwCheck").val();
				var userEmail = $("#userEmail").val();
				var emailAuth = $("#emailAuth").val();
				var userCellNum = $("#userCellNum").val();
				var addrZipNum = $("#addrZipNum").val();
				var addrBasic = $("#addrBasic").val();
				var addrDetail = $("#addrDetail").val();

				console.log("${userInfo.userPw}");

				//비밀번호 검증
				if (userPw != "${userInfo.userPw}") { //로그인 할때 세션값으로 받아온 비밀번호와 userPw가 다를경우 (비밀번호를 변경하는 경우)	

					if (!$("#userPw").hasClass("bbb")) {//bbb클래스를 가지고있지않다면 return
						alert("비밀번호를 확인하세요.");
						$("#userPw").focus();
						return;
					}
				}
				//비밀번호 확인 검증
				if (!$("#pwCheck").hasClass("bbb")) {
					alert("비밀번호 확인칸을 확인하세요");
					$("#pwCheck").focus();
					return;
				}

				//이메일검증
				if (userEmail != "${userInfo.userEmail}") { //세션으로 받아온 이메일과 userEmail이 다를경우 (이메일변경)			
					if ($("#userEmail").attr("readonly") != "readonly") {//이메일인증을 하지않았다면 return
						alert("이메일 인증은 필수입니다.");
						$("#userEmail").focus();
						return;
					}
					if (!$("#emailAuth").hasClass("bbb")) {
						alert("이메일 인증번호를 확인하세요");
						$("#emailAuth").focus();
						return;
					}
				}

				//전화번호 검증
				if (userCellNum != "${userInfo.userCellNum}") { //세션으로 받아온 전화번호과 userCellNum이 다를경우 (전화번호변경)

					if (!$("#userCellNum").hasClass("bbb")) { //bbb클래스를 가지고있지 않다면 return
						alert("전화번호를 확인하세요.");
						$("#userCellNum").focus();
						return;
					}

				}
				//주소검증
				if ($("#addrZipNum").val() == '' || $("#addrBasic").val() == ''
						|| $("#addrDetail").val() == '') {
					alert("주소를 입력해주세요");
					$("#addrBasic").focus();
					return;
				}

				//위 과정을 모두 통과하였다면 submit

				$("#modifyForm").submit();

			});
	</script>
