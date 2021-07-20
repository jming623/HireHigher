<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <section>
    <div class="container">
        <div class="row">
            <div class="insert-all">
                
                <!-- 왼쪽 영역-------------------------------- -->
                <div class="insert-left-box">
                    <ul class="insert-ul-box">
                        <li><a href="">FAQ고객센터</a></li>
                        <li><a href="">1:1문의내역</a></li>
                        <li><a href="">마이페이지</a></li>
                    </ul>
                </div>
                <!-- 오른쪽 영역------------------------------ -->
                <div class="insert-right-box">
                    <div class="insert-question-sector"><!-- 문의 등록 영역 -->
                        <div class="insert-question-title-box"> <!-- 문의 데이터 제목 -->
                           <div class="insert-question-kinds"> <!-- 문의 분류 -->
                              <p>문의 분류</p>
                              <span>(필수)</span>
                           </div>
                        
                           <div class="insert-question-id"> <!-- 아이디 -->
                                <p>아이디</p>
                           </div>
                        
                           <div class="insert-question-title"> <!-- 제목 -->
                            <p>제목</p>
                            <span>(필수)</span>
                           </div>
                        
                           <div class="insert-question-content"> <!-- 내용 -->
                              <p>내용</p>
                              <span>(필수)</span>
                           </div>
                        </div>

                        <div class="insert-input-kinds"><!-- 문의 데이터 input 내용 -->
                            <div> <!-- 문의 분류 -->
                                <select name="" id="">
                                    <option value="">계정 관련</option>
                                    <option value="">결제/배송/환불</option>
                                    <option value="">상품 문제관련</option>
                                    <option value="">기타사항</option>
                                </select>
                            </div>
                         
                            <div class="insert-input-id"> <!-- 아이디 -->
                                 <p>아이디 자동 입력</p>
                            </div>
                         
                            <div class="insert-input-title"> <!-- 제목 -->
                                <input type="text" placeholder="제목을 적어주세요">
                            </div>
                         
                            <div class="insert-input-content"> <!-- 내용 --> <!--ckeditor로 sts에서 사용할것임-->
                                <textarea class="insert-input-text" placeholder="문의 내역을 자세하게 적어주세요 자세하게 적을수록 정확한 답변을 받을수있습니다." name="" rows="15" cols="100" wrap="hard"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="insert-file-puls-sector"><!-- 첨부파일 영역 -->
                        <div class="insert-file-icon"><!-- 파일첨부! 글-->
                            <p>이미지 파일 추가</p>
                        </div>

                        <div class="insert-file-funtion-box"> <!--파일 첨부 기능 영역-->
                            <div class="insert-file-funtion"><!-- 파일 첨부하기-->
                                <!--input box-->
                                <input type="text" class="upload_text" readonly="readonly">
                                <!--button-->
                                <div class="upload-btn_wrap">
                                <button type="button" title="파일선택">
                                <span>파일 선택</span>  
                                </button>
                                <input type="file" class="input_file" title="파일선택">
                                </div>
                            </div>
                            <div class="insert-file-funtion-warning"><!-- 파일첨부 경고문-->

                            </div>
                        </div>
                    </div>

                    <!-- 문의하기 취소하기 버튼-->
                    <div class="insert-btn-qne">
                        <button class="insert-btn-right btn btn-default">취소하기</button>
                        <button class="insert-btn-left btn btn-primary">문의하기</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </section>

    <!-- 파일추가 js -->
    <script>
        	$(function(){
                $('.upload_text').val('파일경로표시');
                $('.input_file').change(function(){
                    var i = $(this).val();
                    $('.upload_text').val(i);
                });
            });
    </script>