<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL 사용 하기 위해 반드시 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<section style="min-height:83vh">

	<div class="container-fluid">
		<div class="job-board row">
			<div class="col-lg-9 col-xs-12 board-table">
				
				<div class="titleBox">
					<p>채용공고 게시판</p>
				</div>
				<hr>

				<!-- 화면단에서  검색 데이터 전달 설정:
       			    1. form태그 action값은 연결할 컨트롤러로 
  			        2. button태그 type값 submit으로 
  			        3. input태그 name 값은 JobCriteria의 검색 키워드 변수명과 동일
  			        4. intput태그 value 값은 컨트롤러 타고 JobCriteria의 searchName에 저장 
   			        5. select태그 name 값은 JobCriteria의 검색 유형 변수명과 동일
   			        6. option태그 selected된 value 값은 컨트롤러 타고 JobCriteria의 searchType 변수에 저장 
          		-->
				<form action="jobList">
					<div class="search-wrap">
						<button type="submit" class="btn btn-info search-btn" style="background-color:gray; border:none;">검색</button>
						<input type="text" class="form-control search-input"
							name="searchName" value="${jobPageVO.cri.searchName }">
						<!-- jobPageVO는 컨트롤러 타고 화면에 model에 담겨서 와있어서 사용 가능 -->
						<!-- name 값으로 검색 연결 -->
						<select class="form-control search-select" name="searchType">
							<option value="title"
								${jobPageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
							<option value="company"
								${jobPageVO.cri.searchType eq 'company' ? 'selected' : '' }>기업</option>
						</select>
					</div>
				</form>

				<!-- 검색 클릭시 페이지 1부터  -->
				<input type="hidden" name="pageNum" value="1"> <input
					type="hidden" name="amount" value="${jobPageVO.cri.amount }">

				<!-- 목록에 데이터 뿌리기 -->
				<table class="table-board">

					<thead>
						<tr>
							<th>글 번호</th>
							<th>기업</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="jvo" items="${jobVOList}">
							<tr>
								<td>${jvo.bno}</td>
								<td>${jvo.companyName}</td>
								<!-- 제목 누르면 a태그타고 jobDetail.jsp로 이동 -->
								<td><a href="jobDetail?bno=${jvo.bno}">${jvo.title}</a></td>
								<td>${jvo.userName}</td>
								<td><fmt:formatDate value="${jvo.regDate }"
										pattern="yyyy-MM-dd" /></td>
								<!-- 조회수 증가 로직 jobDetail.jsp로 이동하면 1증가 -->
								<td>${jvo.viewCount}</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<!-- 페이지 네이션:
       			    1. form태그 action값은 연결할 컨트롤러로 
       			    2. 이전, 다음 버튼들 활성화 설정
       			    3. N번 부터 M번까지 페이지 버튼에 넣을지 설정
          		-->
				<form action="jobList" name="pageForm">
					<div class="text-center">

						<ul class="jobBoard-page pagination pagination-sm">

							<!-- 이전 버튼 활성화 설정 -->
							<c:if test="${jobPageVO.prev }">
								<li>
									<!-- 이전 버튼 누르면 이동할 페이지 계산 -->
									<a href="jobList?pageNum=${jobPageVO.startPage - 1 }&amount=${jobPageVO.amount}">이전</a>
								</li>
							</c:if>

							<c:forEach var="num" begin="${jobPageVO.startPage }" end="${jobPageVO.endPage }">
								<li class="${jobPageVO.pageNum eq num ? 'active' : '' }">
									<a href="jobList?pageNum=${num }&amount=${jobPageVO.amount }">${num }</a>
								</li>
							</c:forEach>
							
							<!-- 다음 버튼 활성화 설정 -->
							<c:if test="${jobPageVO.next }">
								<li>
									<!-- 다음 버튼 누르면 이동할 페이지 계산 -->
									<a href="jobList?pageNum=${jobPageVO.endPage + 1 }&amount=${jobPageVO.amount}">다음</a>
								</li>
							</c:if>

						</ul>
						
						<c:if test="${sessionScope.userVO != null }">
							<button type="button" class="btn btn-info write-btn" onclick="location.href='jobRegist'" style="background-color:gray; border:none;">글쓰기</button>
						</c:if>
					</div>
				</form>
				
			</div>
		</div>
	</div>

</section>


<script>
	var pagination = document.querySelector(".jobBoard-page");
	
	pagination.onclick = function() {
		event.preventDefault(); //고유이벤트 속성 중지
		if(event.target.tagName != 'A') return;
	
		document.pageForm.pageNum.value = event.target.dataset.pagenum;
		document.pageForm.submit();
	}
</script>
