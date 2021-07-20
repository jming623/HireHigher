//아이디  중복체크
		$("#idCheck").click(function(){
		
			var userId = $("#userId").val();
			
			if(userId == '' || userId.length < 6 || userId.length > 15){//아이디 형식검사
				alert("아이디는 영문숫자 포함 6~15글자입니다.");
				$("#userId").focus();
				return;
			}
			
			$.getJSON("idCheck/"+userId, function(data){ //$.getJSON(요청주소, 콜백함수) 데이터조회는 주로 get방식을 사용한다고함.
				if(data == 1){//중복된 아이디가 있는 경우
					$("#msgId").html("중복된 아이디가 있습니다.");
				}else{ //중복된 아이디가 없는 경우
					$("#msgId").html("사용가능한 아이디입니다.");
					$("#userId").attr("readonly",true);
				}
			})
			
		})
		
		
		 //비밀번호 형식검사
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
		
	  //닉네임중복체크
      $("#nickNameCheck").click(function(){
         
         var nickName = $("#nickName").val();
         
         if(nickName.length == 0){
        	alert("닉네임은 공백이 될 수 없습니다.");
        	$("#nickName").focus();
        	return;
         }
         
         $.getJSON("nickNameCheck/"+nickName,function(data){
            if(data == 1){//중복된  경우
               $("#msgNickName").html("중복된 닉네임이 있습니다.");
               $("#nickName").css("borderColor","red");
            }else{ 
               $("#msgNickName").html("사용가능한 닉네임입니다.");
               $("#nickName").css("borderColor","#66afe9");
               $("#nickName").attr("readonly",true);
            }
         })
         
      })
      
	//생년월일 형식검사
	var birthDayRegex = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
	$("#birthDay").keyup(function(){
		
		if( ! birthDayRegex.test( $("#birthDay").val() )){
			
			if( ! $("#birthDay").hasClass("aaa") ){
				$("#birthDay").addClass("aaa");
			}
			
			if( $("#birthDay").hasClass("bbb") ){
				$("#birthDay").removeClass("bbb");
			}
			
			$("#msgBirthDay").html("생년월일 입력 형식을 확인해주세요.");
		}else{
			if( !$("#birthDay").hasClass("bbb") ){
				$("#birthDay").addClass("bbb");
			}
			if( $("#birthDay").hasClass("aaa") ){
				$("#birthDay").removeClass("aaa");
			}
			$("#msgBirthDay").html("");
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
	
	//이메일 형식검사
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
	
	//이메일 중복검사 및 인증		
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
						url: "sendEmail",
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
	
	//회원가입 버튼 클릭시 폼검증작업 및 서브밋
	$("#joinBtn").click(function(){
		
		if($("#userId").attr("readonly") != 'readonly'){//중복검사를 하지 않은경우 
			alert("아이디 중복검사는 필수입니다.");
			$("#userId").focus();
			return;
		}else if(! $("#userPw").hasClass("bbb") ){
			alert("비밀번호를 확인하세요.");
			$("#userPw").focus();
			return;
		}else if(! $("#pwCheck").hasClass("bbb") ){
			alert("비밀번호를 확인하세요.");
			$("#pwCheck").focus();
			return;
		}else if( $("#userName").val() == '' ){
			alert("이름은 필수입니다.");
			$("#userName").focus();
			return;
		}else if($("#nickName").attr("readonly") != 'readonly'){
			alert("닉네임 중복검사는 필수입니다.");
			$("#nickName").focus();
			return;
		}else if(! $("#birthDay").hasClass("bbb") ){
			alert("생년월일을 확인하세요.");
			$("#birthDay").focus();
			return;
		}else if($("#userEmail").attr("readonly") != 'readonly'){
			alert("이메일 중복검사는 필수입니다.");
			$("#userEmail").focus();
			return;
		}else if(! $("#emailAuth").hasClass("bbb") ){
			alert("이메일 인증번호를 확인하세요.");
			$("#emailAuth").focus();
			return;
		}else if(! $("#userCellNum").hasClass("bbb") ){
			alert("전화번호를 확인하세요.");
			$("#userCellNum").focus();
			return;
		}else if( $("#addrZipNum").val() == '' || $("#addrBasic").val() == '' || $("#addrDetail").val() == ''){
			alert("주소를 입력해주세요");
			$("#addrBasic").focus();
			return;
		}else{
			$("#joinForm").submit();
		}
	})
		