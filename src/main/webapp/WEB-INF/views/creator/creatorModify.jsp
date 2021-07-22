<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<section class="creator-detail-section">
        <div class="row">
        <div class="profile-header col-lg-12">
            <div class="profile-header-inner">
                <div class="creator-profile-header-modify">
                    <a href=""><i><input type="file" class="creator-profile-img-input" name="profile-file" id="profile-file"></i></a>
                </div>
            </div>
        </div>
        </div>
        <div class="profile-content">
                           
            <div class="creator-profile">
                
                <div class="creator-profile-img">
                    <form action="">
                        <img class="" id="creator-profile-img-target" src="https://d2vi0z68k5oxnr.cloudfront.net/40a3c83c-f048-44af-b9db-a65edbc519b2/original.jpeg?d=lg-logo" style="width: 128px; height: 128px;">

                        <div class="creator-profile-img-modify">
                            <a href=""><i><input type="file" class="creator-profile-img-input" name="profile-file" id="profile-file"></i></a>
                        </div>
                    </form>
                </div>

                <div class="creator-name">jming623</div>

                <div class="creator-email">
                    jming623@naver.com
                </div>

                <div class="creator-description">
                    <form action="" >
                        
                    <div class="creator-description-content" id="creator-description-content">
                        Crypto.com is the best place to buy, sell, and pay with crypto. Crypto.com serves over 10 million customers today, with the world’s fastest growing crypto app, along with the Crypto.com Visa Card — the world’s most widely available crypto card, the Crypto.com Exchange and Crypto.com DeFi Wallet.Crypto.com NFT is the premier platform for collecting and trading NFTs, carefully curated from the worlds of art, design, entertainment and sport.FAQs: help.crypto.com
                    </div>

                    <div class="creator-description-textarea" id="creator-description-textarea" style="display: none;"> 
                        <textarea name="" id="" cols="36" rows="14">Crypto.com is the best place to buy, sell, and pay with crypto. Crypto.com serves over 10 million customers today, with the world’s fastest growing crypto app, along with the Crypto.com Visa Card — the world’s most widely available crypto card, the Crypto.com Exchange and Crypto.com DeFi Wallet.Crypto.com NFT is the premier platform for collecting and trading NFTs, carefully curated from the worlds of art, design, entertainment and sport.FAQs: help.crypto.com</textarea>
                    </div>
                    
                    <div class="creator-description-input" id="creator-description-input" style="display: none;">
                    	<input type="text" id="instarId" name="instarId" placeholder="인스타그램 주소를 입력하세요.">
                    </div>
                    
                    <div id="creator-descrption-btn-wrap">
                        <div id="creator-descrption-btn-inner1">
                            <button type="button" id="creator-descrption-btn1" class=" btn btn-default btn-xs">
                                <span class="glyphicon glyphicon-edit"></span> Edit
                            </button>
                        </div>
                        <div id="creator-descrption-btn-inner2" style="display: none;">
                            <button type="submit" id="creator-descrption-btn2" class="btn btn-default btn-xs" onclick="location.reload()">수정</button>
                            <button type="button" id="creator-descrption-btn3" class="btn btn-default btn-xs" onclick="location.reload()">취소</button>
                        </div>
                    </div>
                    </form>
                </div>

                <%-- <div class="creator-social">
                    <a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath }/resources/img/instaLogo.png" alt=""></a>
                </div> --%>
                 
            </div>
            
            <div class="row">
                <div class="creator-content col-lg-8 col-md-7 col-sm-6 col-xs-12">
                                    
                        <ul class="creator-content-nav nav nav-tabs ">
                            <li class='active'><a data-toggle="tab" href="#menu1">제작자정보</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="menu1" class="tab-pane fade in active">
                                <form action="">
                                    <div class="creator-content-info">
                                        <p>전공분야:</p>
                                        
                                        <div class="creator-content-info-detail">
                                            <small style="min-height: 50px;">디자인설계</small>
                                        </div>

                                        <div class="creator-content-info-input" style="display: none;">
                                            <input type="text" id="major" name="major" value="디자인설계">
                                        </div>

                                        <p>경력사항:</p>

                                        <div class="creator-content-info-detail">
                                            <small>바른미술학원 2년근무</small>
                                            <small>바른미술학원 2년근무</small>
                                            <small>바른미술학원 2년근무</small>
                                        </div>

                                        <div class="creator-content-info-input" style="display: none;">
                                            <input type="text" id="career" name="career" value="바른미술학원 2년근무">
                                            <input type="text" id="career1" name="career1" value="바른미술학원 2년근무">
                                            <input type="text" id="career2" name="career2" value="바른미술학원 2년근무">
                                        </div>

                                        <p>수상경력:</p>

                                        <div class="creator-content-info-detail">
                                            <small>미술경시대회 우승</small>
                                            <small>미술경시대회 우승</small>
                                            <small>미술경시대회 우승</small>
                                        </div>

                                        <div class="creator-content-info-input" style="display: none;">
                                            <input type="text" id="awards" name="awards" value="미술경시대회 우승">
                                            <input type="text" id="awards1" name="awards1" value="미술경시대회 우승">
                                            <input type="text" id="awards2" name="awards2" value="미술경시대회 우승">
                                        </div>
                                           
                                        <div class="creator-content-info-edit1">
                                            <button type="button" id="creator-content-info-editBtn">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>                                            
                                        </div>
                                            
                                        <div class="creator-content-info-edit2" style="display: none;">
                                            <button type="button" class="btn btn-default" onclick="location.reload()">수정</button>
                                            <button type="button" class="btn btn-default" onclick="location.reload()">취소</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            
                        </div>
                </div>                 
            </div>


        </div>
            
    </section>	

	<script>
    
    //프로필 수정
    $("#creator-descrption-btn1").click(function(){
        
        //텍스트 교체
       console.log("1");

       $("#creator-description-content").css("display","none");
       $("#creator-description-textarea").css("display","block");
       $("#creator-description-input").css("display","block");

        //버튼 교체
        
        $("#creator-descrption-btn-inner1").css("display","none");
        $("#creator-descrption-btn-inner2").css("display","inline-block");
    })

    //제작자정보 수정
    $("#creator-content-info-editBtn").click(function(){

        //텍스트 교체
        $(".creator-content-info-detail").css("display","none");
        $(".creator-content-info-input").css("display","block");

        //버튼교체
        $(".creator-content-info-edit2").css("display","block");
        $(".creator-content-info-edit1").css("display","none");

    })

	</script>
