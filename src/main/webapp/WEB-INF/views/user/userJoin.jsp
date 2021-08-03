<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
    <section>

    <div class="container">

      <div class="userJoin row">

        <div class="joinForm">

          <div class="joinTitle">
            <h2>회원가입</h2>
          </div>
          <form action="joinForm" method="POST" name="#" id="joinForm">

            <div class="joinForm-wrap form-group">
              <label for="id">아이디</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" name="userId" id="userId" placeholder="영문숫자 포함 6~15자">
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="idCheck" class="btn btn-info">아이디중복체크</button>
                </div>
              </div>
              <span id="msgId"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="password">비밀번호</label>  
              <input type="password" class="joinForm-inner form-control" name="userPw" id="userPw" placeholder="영문 숫자 기호 포함 8~16자"> 
              <span id="msgPw"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="passwordCheck">비밀번호확인</label>
              <input type="password" class="joinForm-inner form-control" id="pwCheck">
              <span id="msgPwCheck"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="name">이름</label>
              <input type="text" class="joinForm-inner form-control" name="userName" id="userName">
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="userNickName">닉네임</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" name="nickName" id="nickName" placeholder="">
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="nickNameCheck" class="btn btn-info">닉네임중복체크</button>
                </div>
              </div>
              <span id="msgNickName"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="userBirth">생년월일</label>
              <input type="text" class="joinForm-inner form-control" name="birthDay" id="birthDay" placeholder="ex:19950623">
              <span id="msgBirthDay"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="email">이메일</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" name="userEmail" id="userEmail" placeholder="">
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="userEmailCheck" class="btn btn-info">이메일인증</button>
                </div>
              </div>
              	<span id="msgUserEmail"></span>
              	
              <div class="emailAuthWrap" id="emailAuthWrap" style="display:none;">
              	<input type="text" class="joinForm-inner form-control" name="emailAuth" id="emailAuth" placeholder="인증번호를 입력해주세요.">
              	<span id="msgEmailAuth"></span>
              </div>             
            </div>
      
            <div class="joinForm-wrap form-group">
              <label for="phoneNum">전화번호</label>             
              <input type="text" class="joinForm-inner form-control" name="userCellNum" id="userCellNum" placeholder="-포함 번호를 입력해주세요">
              <span id="msgUserCellNum"></span>
            </div>
            
            <div class="joinForm-wrap form-group">
              <label for="address">주소</label>
              <div class="input-group">
                <input type="text" class="joinForm-inner form-control" id="addrZipNum" name="addrZipNum" placeholder="우편번호" readonly>
                <div class="joinForm-btn input-group-btn">
                  <button type="button" id="findAddr" class="btn btn-info">우편번호찾기</button>
                </div>
              </div>
              <div class="joinForm-wrap form-group">
                <input type="text" class="joinForm-inner form-control" id="addrBasic" name="addrBasic" placeholder="기본주소">
              </div>
              <div class="joinForm-wrap form-group">
                <input type="text" class="joinForm-inner form-control" id="addrDetail" name="addrDetail" placeholder="상세주소">
              </div>
            </div>

            <div class="joinForm-wrap form-group">
              <button type="button" class="btn btn-lg btn-info btn-block" id="joinBtn">회원가입</button>
            </div>
            
            <div class="joinForm-wrap form-group">
              <button type="button" class="btn btn-lg btn-success btn-block" onclick="location.href='../'">돌아가기</button>
            </div>


          </form>

        </div>

      </div>

    </div>

  </section>
  
	<script src="${pageContext.request.contextPath }/resources/js/userJoin.js?2"></script>