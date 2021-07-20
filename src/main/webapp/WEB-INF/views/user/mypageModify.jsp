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
                                    <tr><td class="m-title">아이디</td></tr>
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
                                    <tr><td class="m-title">닉네임</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="nickName" id="nickName" value="${userInfo.nickName }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">생년월일</td></tr>                              
                                    <tr>
                                        <td><input class="form-control mypage-input" type="text" name="birthDay" id="birthDay" value="${userInfo.birthDay }" readonly ></td>
                                    </tr>
                                    <tr><td class="m-title">이메일</td></tr>                              
                                    <tr>
                                        <td>
                                        	<input class="mypage-modify-zipcode form-control mypage-input" type="text" name="userEmail" id="userEmail" value="${userInfo.userEmail }" >
                                        	<button type="button" id="userEmailCheck" class="btn btn-info mypage-modify-Btn">이메일인증</button>
                                        	<span id="msgUserEmail"></span>
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
                                <button type="button" id="requestModify" class="btn btn-primary btn-block">수정하기</button>
                                <button type="button" class="btn btn-danger btn-block" onclick="location.href='mypage'">돌아가기</button>    
                            </div>                           

                        </form>
    
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>

    </section>

    <script src="${pageContext.request.contextPath }/resources/js/mypageModify.js?1"></script>
    