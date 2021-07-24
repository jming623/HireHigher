<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <section class="creator-detail-section">
       
        <div class="profile-header">
            <img src="../resources/img/welcome.jpg" alt="">
        </div>

        <div class="profile-content">
                           
            <div class="creator-profile">
                
                <div class="creator-profile-img">
                    <form action="">
                    <img class="" src="../resources/img/profile.png" style="width: 128px; height: 128px;">
                    </form>
                </div>

                <div class="creator-name">jming623</div>

                <div class="creator-email">jming623@naver.com</div>

                <div class="creator-description">
                    <textarea name="" id="" cols="36" rows="14" placeholder="프로필을 작성해주세요."></textarea>
                </div>

                <div class="creator-social">
                    <a href="https://www.instagram.com/"><img src="${pageContext.request.contextPath }/resources/img/instaLogo.png" alt=""></a>
                </div>
                
                <div class="profile-modifyBtn">
                    <button type="button" onclick="location.href='creatorModify'">프로필 편집</button>
                </div>
                 
            </div>
            
            <div class="row">
                <div class="creator-content col-lg-8 col-md-7 col-sm-6 col-xs-12">
                                    
                        <ul class="creator-content-nav nav nav-tabs ">
                            <li class='active'><a data-toggle="tab" href="#menu1">제작자정보</a></li>
                            <li><a data-toggle="tab" href="#menu2">작성글</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="menu1" class="tab-pane fade in active">
                                
                                <div class="creator-content-info">
                                    <div class="creator-content-info-detail">
                                        <p>전공분야:</p>
                                        <small style="min-height: 50px;">디자인설계</small>
                                    </div>
                                    <div class="creator-content-info-detail">
                                        <p>경력사항:</p>
                                        <small>바른미술학원 2년근무</small>
                                    </div>
                                    <div class="creator-content-info-detail">
                                        <p>수상경력:</p>
                                        <small>미술경시대회 우승</small>
                                    </div>
                                </div>

                            </div>                          

                            <div id="menu2" class="tab-pane fade">
                                
                                <div class="creator-content-writing">
                                    <table class="creator-content-writing-table table">
                                        <thead>
                                            <tr>
                                                <td>번호</td>
                                                <td>제목</td>
                                                <td>내용</td>
                                                <td>작성일</td>
                                            </tr>
                                        </thead> 
                                        <tbody class="creator-content-writing-tbody">
                                            <tr>
                                                <td>1</td>
                                                <td><a href="">첫글</a></td>
                                                <td><a href="">첫글은이렇게 작성하였습니다.</a></td>
                                                <td>2021/07/05</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td><a href="">두번째글</a></td>
                                                <td><a href="">두번째글은이렇게 작성하였습니다.</a></td>
                                                <td>2021/07/05</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td><a href="">세번째글</a></td>
                                                <td><a href="">세번째글은이렇게 작성하였습니다.</a></td>
                                                <td>2021/07/05</td>
                                            </tr>
                                            
                                        </tbody>   
                                    </table>
                                    
                                    <div class="text-center">
                                        <ul class="creator-content-writing-page pagination">
                                            <li><a href="#menu2">이전</a></li>
                                            <li><a href="#menu2">1</a></li>
                                            <li><a href="#menu2">2</a></li>
                                            <li><a href="#menu2">3</a></li>
                                            <li><a href="#menu2">다음</a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                </div>                 
            </div>


        </div>
            
    </section>
    
    <script>
    
       window.onload = function() {
      
         if(history.state == '') return; //메시지를 출력했다면 함수 종료
      
         var msg = '${msg }';
      
         if(msg != '') {
            alert(msg);
            //기존 기록을 삭제하고 새로운 기록 추가 (이렇게 변경된 값은 history.state로 데이터 확인 가능)
            history.replaceState('', null, null); // 브라우저 기록컨트롤(추가할 데이터, 제목, url주소)
      }
      
      
   }
    
    </script>
