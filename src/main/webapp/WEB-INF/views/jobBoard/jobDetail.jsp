<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<form action="jobModify" method="post">
		<div class="container">
			<div class="row">
				<div class="detail_content">
					<div class="detail_title">
						<h2>${jobBoardDetailVO.title}</h2>
					</div>
					<div class="detail_condition">
						<div class="detail_condition_table">
							<div class="detail_left">
								<div class="detail_recruit">
									<input type="hidden" name="bno"
										value="${jobBoardDetailVO.bno }">
									<h3>모집조건</h3>
									<dl>
										<dt>성별</dt>
										<dd>${jobBoardDetailVO.gender}</dd>
									</dl>
									<dl>
										<dt>연령</dt>
										<dd>${jobBoardDetailVO.age}</dd>
									</dl>
									<dl>
										<dt>학력</dt>
										<dd>${jobBoardDetailVO.edu}</dd>
									</dl>
									<dl>
										<dt>고용형태</dt>
										<dd>${jobBoardDetailVO.empType}</dd>
									</dl>
									<dl>
										<dt>모집인원</dt>
										<dd>${jobBoardDetailVO.recNum}</dd>
									</dl>
									<dl>
										<dt>우대사항</dt>
										<dd>${jobBoardDetailVO.preference}</dd>
									</dl>
									<dl>
										<dt>제출서류</dt>
										<dd>${jobBoardDetailVO.requiredDocs}</dd>
									</dl>
								</div>
								<div class="detail_work">
									<h3>근무조건</h3>
									<dl>
										<dt>급여</dt>
										<dd>${jobBoardDetailVO.salary}</dd>
									</dl>
									<dl>
										<dt>근무기간</dt>
										<dd>${jobBoardDetailVO.contract}</dd>
									</dl>
									<dl>
										<dt>근무요일</dt>
										<dd>${jobBoardDetailVO.workDays}</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>${jobBoardDetailVO.workTime}</dd>
									</dl>
									<dl>
										<dt>복리후생</dt>
										<dd>${jobBoardDetailVO.welfare}</dd>
									</dl>
								</div>
							</div>
							<div class="detail_right">
								<div class="detail_recruit_time">
									<h3>모집마감일</h3>
									<strong>${jobBoardDetailVO.deadline}</strong>
								</div>
								<div class="detail_recruit_manager_info">
									<h3>채용담당자정보</h3>
									<dl>
										<dt>담당자명</dt>
										<dd>${jobBoardDetailVO.HRManager}</dd>
									</dl>
									<dl>
										<dt>연락처</dt>
										<dd>
											<p>${jobBoardDetailVO.HRContact}</p>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="placeInfo">
						<div class="placeInfo_list">
							<h3>근무지 정보</h3>
							<dl>
								<dt>회사 이름</dt>
								<dd>${jobBoardDetailVO.companyName }</dd>
							</dl>
							<dl>
								<dt>근무지 주소</dt>
								<dd id="addrInput">${jobBoardDetailVO.companyAddr}</dd>
							</dl>
							<dl>
								<dt>위치 정보</dt>
								<dd>
									<div id="jobboard-map" style="width: 1000px; height: 400px;"></div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="detailInfo">
						<div class="detailInfo_list">
							<h3>상세모집내용</h3>
							<dl>
								<dt>담당업무</dt>
								<dd>${jobBoardDetailVO.position}</dd>
							</dl>
							<dl>
								<dt>지원방법</dt>
								<dd>${jobBoardDetailVO.wayToApply}</dd>
							</dl>
							<dl>
								<dt>채용일정</dt>
								<dd>
									<p>${jobBoardDetailVO.recPlan}</p>
								</dd>
							</dl>
						</div>
					</div>
					<div class="detailBtn">
						<c:if
							test="${sessionScope.userVO.userId == jobBoardDetailVO.userId }">
							<button type="submit" class="btn btn-info">수정</button>
						</c:if>
						<button type="button" class="btn btn-default"
							onclick="location.href='jobList'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f86f9996be91838c5a2643e82902a25&libraries=services,clusterer,drawing"></script>
<script>
	var container = document.getElementById('jobboard-map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var addrInput = document.getElementById('addrInput').innerHTML;
	console.log(addrInput);
		
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addrInput, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>


