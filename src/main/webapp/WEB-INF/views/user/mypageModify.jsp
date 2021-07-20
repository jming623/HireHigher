<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#userPw.aaa:focus, #userEmail.aaa:focus, #emailAuth.aaa:focus, #userCellNum.aaa:focus{
		border-color:red;
	}
	
	#userPw.bbb:focus, #userEmail.bbb:focus, #emailAuth.bbb:focus, #userCellNum.bbb:focus{
		border-color:#66afe9;			
	}
			
	.bbb{
		background-color:rgb(232, 240, 254);
	}

</style>

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
                                <button type="button" class="btn btn-danger btn-block" onclick="location.href='../'">돌아가기</button>    
                            </div>                           

                        </form>
    
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>

    </section>

    <script>

        

        $(".mypage-input").each(function(){
            if( $(this).attr("readonly")=="readonly" ){
                
                $(this).css("backgroundColor","#d2d2d2");
            }
        })
        
        // 비밀번호 형식검증
        var pwRegex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
        
        $("#userPw").keyup(function(){         
	    	  
	    	  pwCheck();
	    	  
	    	  if( $("#userPw").val().length != 0 && ($("#userPw").val().length < 8 || $("#userPw").val().length > 16) ){            
	            if(! $("#userPw").hasClass("aaa") ){ // 제이쿼리에 .hasClass() = 자바스크립트에 .contains()
	               $("#userPw").addClass("aaa");
	            }
	            if( $("#userPw").hasClass("bbb") ){
	               $("#userPw").removeClass("bbb");
	            }            
	            $("#msgPw").html("비밀번호는 8~16자로 입력하셔야 합니다.");            
	         }else if( $("#userPw").val().length != 0 && !pwRegex.test( $("#userPw").val() )){ //형식검사 = regex.test()           
	            if(! $("#userPw").hasClass("aaa") ){
	               $("#userPw").addClass("aaa");
	            }if( $("#userPw").hasClass("bbb") ){
	               $("#userPw").removeClass("bbb");
	            }            
	            $("#msgPw").html("비밀번호는 영문,숫자,특수문자를 반드시 포함해야합니다.");            
	         }else if($("#userPw").val().length == 0){            
	            if( $("#userPw").hasClass("aaa") ){
	               $("#userPw").removeClass("aaa");
	            }
	            if(!$("#userPw").hasClass("bbb") ){
	               $("#userPw").addClass("bbb");
	            }
	            $("#msgPw").html("");    
	         }else{
	        	if( $("#userPw").hasClass("aaa") ){
		        	$("#userPw").removeClass("aaa");
		        }
		        if(!$("#userPw").hasClass("bbb") ){
		        	$("#userPw").addClass("bbb");
		        }
		       
		        $("#msgPw").html("사용가능한 비밀번호 입니다.");
	         }
		})
		
		//비밀번호 확인 검사	
		$("#pwCheck").keyup(function(){
			pwCheck();		
		})
		
		//비밀번호 확인 검사
		function pwCheck(){
			if( $("#userPw").val() != $("#pwCheck").val()){
					
				$("#pwCheck").css("borderColor","red");
				
			 	$("#msgPwCheck").html("확인 비밀번호가 일치하지 않습니다.");
			 	
			 	if($("#pwCheck").hasClass("bbb")){
			 		$("#pwCheck").removeClass("bbb");
			 	}
			 	
			}else if($("#userPw").val().length == 0){
				$("#msgPwCheck").html("");
				$("#pwCheck").css("borderColor","#ccc");
				
				if($("#pwCheck").hasClass("bbb")){
			 		$("#pwCheck").removeClass("bbb");
			 	}
				
			}else{				
				$("#pwCheck").css("borderColor","#ccc");	
				$("#msgPwCheck").html("확인 비밀번호가 일치합니다.");
			
				if(! $("#pwCheck").hasClass("bbb")){
			 		$("#pwCheck").addClass("bbb");
			 	}
			
		}
	}
        
    //이메일 형식 검증
	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	$("#userEmail").keyup(function(){
		if( ! emailRegex.test( $("#userEmail").val() )){			
			if( ! $("#userEmail").hasClass("aaa") ){
				$("#userEmail").addClass("aaa");
			}		
			if( $("#userEmail").hasClass("bbb") ){
				$("#userEmail").removeClass("bbb");
			}			
			$("#msgUserEmail").html("이메일 입력 형식을 확인해주세요.");
		}else{
			if( !$("#userEmail").hasClass("bbb") ){
				$("#userEmail").addClass("bbb");
			}
			if( $("#userEmail").hasClass("aaa") ){
				$("#userEmail").removeClass("aaa");
			}
			$("#msgUserEmail").html("");
		}
	})
	
	$("#userEmailCheck").click(function(){//	
		
		if(! $("#userEmail").hasClass("bbb") ){ //bbb클래스를 가지고 있지 않다면 email형식이 올바르지 않다고 판단 메서드를 종료시킨다.
			alert("이메일 형식을 확인해주세요");
			return;
		}
	
		if( $("#userEmail").hasClass("ccc") ){ //bbb클래스를 가지고 있다면 이미 이메일이 발송됐음으로 메서드 종료
			return;
		}
		
		var userEmail = $("#userEmail").val();
	
		$.ajax({
			type: "post",
			url: "emailCheck",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({"userEmail":userEmail}),
			success: function(data){
				if(data == 1){//email중복
					alert("이미 가입된 유저의 이메일입니다. ");
					return;
				}else{//Email중복이 아닐경우
					alert("입력하신 이메일로 인증번호가 발송되었습니다.");
					$("#userEmail").attr("readonly",true);
					$("#emailAuthWrap").css("display","block");
					$("#emailAuthWrap").focus();
					
					//이메일발송
					$.ajax({
						type: "post",
						url: "sendEmailModify",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify({"userEmail":userEmail}),
						success: function(data){
							
							$("#userEmail").addClass("ccc");//메일이 발송되면 버튼을 비활성화 시켜줄 클래스
							
							var keyCode = data.keyCode	
							$("#emailAuth").keyup(function(){
								if( $("#emailAuth").val() != keyCode){
									if( !$("#emailAuth").hasClass("aaa") ){
										$("#emailAuth").addClass("aaa");
									}
									if( $("#emailAuth").hasClass("bbb") ){
										$("#emailAuth").removeClass("bbb");
									}
									$("#msgEmailAuth").html("인증번호를 확인해주세요");
								}else{
									if( !$("#emailAuth").hasClass("bbb") ){
										$("#emailAuth").addClass("bbb");
									}									
									if( $("#emailAuth").hasClass("aaa") ){
										$("#emailAuth").removeClass("aaa");
									}
									$("#msgEmailAuth").html("인증번호가 일치합니다");
								}
							})
						},
						error: function(status,error){
							console.log(status,error);							
						}
					})
					
				}
			},
			error: function(status,error){
				console.log(status, error);
			}
		})
	}) 
	
	//전화번호 형식검증
	var cellNumRegex = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/

	$("#userCellNum").keyup(function(){
		if( ! cellNumRegex.test( $("#userCellNum").val() ) ){
			if( ! $("#userCellNum").hasClass("aaa") ){
				$("#userCellNum").addClass("aaa");
			}		
			if( $("#userCellNum").hasClass("bbb") ){
				$("#userCellNum").removeClass("bbb");
			}			
			$("#msgUserCellNum").html("전화번호 입력 형식을 확인해주세요.");
		}else{
			if( !$("#userCellNum").hasClass("bbb") ){
				$("#userCellNum").addClass("bbb");
			}
			if( $("#userCellNum").hasClass("aaa") ){
				$("#userCellNum").removeClass("aaa");
			}
			$("#msgUserCellNum").html("");
		}
	})
	
	//주소 팝업 
	$("#findAddr").click(function(){
		var pop = window.open("../resources/pop/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	})
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		//기본주소
		$("#addrBasic").val(roadAddrPart1);
		//고객입력상세주소
		$("#addrDetail").val(addrDetail);
		//우편번호
		$("#addrZipNum").val(zipNo);
		
	}
	
	//폼검증 및 서브밋작업
	$("#requestModify").click(function(){
				
		var userPw = $("#userPw").val();
		var pwCheck = $("#pwCheck").val();
		var userEmail = $("#userEmail").val();
		var emailAuth = $("#emailAuth").val();
		var userCellNum = $("#userCellNum").val();
		var addrZipNum = $("#addrZipNum").val();
		var addrBasic = $("#addrBasic").val();
		var addrDetail = $("#addrDetail").val();
		
		//비밀번호 검증
		if( userPw != "${userInfo.userPw}"){ //로그인 할때 세션값으로 받아온 비밀번호와 userPw가 다를경우 (비밀번호를 변경하는 경우)	
			
			if(! $("#userPw").hasClass("bbb")){//bbb클래스를 가지고있지않다면 return
				alert("비밀번호를 확인하세요.");
				userPw.focus();
				return;
			}		
		}
		//비밀번호 확인 검증
		if(! $("#pwCheck").hasClass("bbb") ){			
			alert("비밀번호 확인칸을 확인하세요");
			pwCheck.focus();
			return;			
		}
		
		//이메일검증
		if( userEmail != "${userInfo.userEmail}" ){ //세션으로 받아온 이메일과 userEmail이 다를경우 (이메일변경)			
			if( $("#userEmail").attr("readonly") != "readonly" ){//이메일인증을 하지않았다면 return
				alert("이메일 인증은 필수입니다.");
				userEmail.focus();
				return;
			}		
			if(! $("#emailAuth").hasClass("bbb") ){
				alert("이메일 인증번호를 확인하세요");
				emailAuth.focus();
				return;
			}	
		}		
		
		//전화번호 검증
		if( userCellNum != "${userInfo.userCellNum}" ){ //세션으로 받아온 전화번호과 userCellNum이 다를경우 (전화번호변경)
		
			if( ! $("#userCellNum").hasClass("bbb")){ //bbb클래스를 가지고있지 않다면 return
				alert("전화번호를 확인하세요.");
				return;
			}
		
		}		
		//주소검증
		if( $("#addrZipNum").val() == '' || $("#addrBasic").val() == '' || $("#addrDetail").val() == ''){
			alert("주소를 입력해주세요");
			$("#addrBasic").focus();
			return;
		}
		
		//위 과정을 모두 통과하였다면 submit
			
		$("#modifyForm").submit();
		
		
	});
	
	
	
    </script>
    