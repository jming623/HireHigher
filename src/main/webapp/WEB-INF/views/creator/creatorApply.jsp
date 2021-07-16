<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section>

    <div class="container">

      <div class="creator-apply row">

        <div class="seller-form">

          <div class="sellerTitle">
            <h2>판매자 신청하기</h2>
          </div>
          <form action="#" method="POST">

            <div class="form-group">
              <label for="major">전공분야</label>
              <input type="text" class="seller-form-inner form-control" name="userMajor" id="userMajor">
            </div>
            <div class="form-group" id="careerBox">
              <label for="career">경력사항</label>
              <div class="input-group" id="careerGroup">
                <input type="text" class="seller-form-inner form-control" name="userCareer" id="userCareer" placeholder="최대 3개">
                <div class="seller-btn input-group-btn" >
                  <button type="button" class="btn btn-info" id="plusBtn"><i class="far fa-plus"></i></button>
                </div>
              </div>
            </div>
            <div class="form-group" id="awardsBox">
              <label for="awards">수상경력</label>
              <div class="input-group" id="awardsGroup">
                <input type="text" class="seller-form-inner form-control" name="userAwards" id="userAwards" placeholder="최대 3개">
                <div class="seller-btn input-group-btn" >
                  <button type="button" class="btn btn-info" id="plusBtn2"><i class="far fa-plus"></i></button>
                </div>
              </div>
            </div>

          </form>
          <div class="form-group">
            <button type="submit" class="btn btn-lg btn-info btn-block" id="loginBtn">신청하기</button>
          </div>
          
            
          
        </div>

      </div>

    </div>

  </section>
  
  <script>
  
  let careerBox = document.getElementById("careerBox");
  let plusBtn = document.getElementById("plusBtn");
  let count = 0; // input 태그 개수 체크 변수

  plusBtn.addEventListener("click", function() {
	  
    if(count >= 2) return; // input 태그 추가 개수가 2개가 넘어가면 함수 종료

    ++count; // input 태그가 추가될 때마다 카운트
    
    let div = document.createElement("div"); // div 태그 생성
    div.setAttribute("id", "careerGroup"); // id명이 careerGroup인 id 속성 추가

    let input = document.createElement("input"); // input 태그 생성
    input.setAttribute("type", "text"); // text type 속성 추가
    input.setAttribute("class", "form-control"); // form-control class 속성 추가
    input.setAttribute("name", "userCareer"+count); // userCareer + 카운트숫자 name 속성 추가
    input.setAttribute("id", "userCareer"); // userCareer id 속성 추가


    
    div.appendChild(input); // div 태그 밑에 자식태그로 input 태그 추가
    

    careerBox.appendChild(div); // id가 careerBox인 태그 밑에 자식태그로 div 태그 추가 
  
  });
  
  let awardsBox = document.getElementById("awardsBox");
  let plusBtn2 = document.getElementById("plusBtn2");
  let count2 = 0; // input 태그 개수 체크 변수

  plusBtn2.onclick = function() {
    if(count2 >= 2) return; // input 태그 추가 개수가 2개가 넘어가면 함수 종료

    ++count2; // input 태그가 추가될 때마다 카운트

    let div = document.createElement("div"); // div 태그 생성
    div.setAttribute("id", "awardsGroup"); // id명이 awardsGroup인 id 속성 추가 

    let input = document.createElement("input"); // input 태그 생성
    input.setAttribute("type", "text"); // text type 속성 추가
    input.setAttribute("class", "form-control"); // form-control class 속성 추가
    input.setAttribute("name", "userAwards"+count); // userAwards + 카운트숫자 name 속성 추가
    input.setAttribute("id", "userAwards"); // userAwrads id 속성 추가


    
    div.appendChild(input); // div 태그 밑에 자식태그로 input 태그 추가
    

    awardsBox.appendChild(div); // id가 awardsBox인 태그 밑에 자식태그로 div 태그 추가
  }
  
  </script>