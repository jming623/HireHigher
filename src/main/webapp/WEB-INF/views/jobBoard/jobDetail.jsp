<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
										<input type="hidden" name="bno" value="${jobBoardDetailVO.bno }">
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
							<h3>근무지정보</h3>
							<dl>
								<dt>근무지주소</dt>
								<dd>${jobBoardDetailVO.companyAddr}</dd>
							</dl>
							<dl>
								<dt>위치정보</dt>
								<dd>카카오지도</dd>
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
						<button type="submit" class="btn btn-info">수정</button>
						<button type="button" class="btn btn-default"
							onclick="location.href='jobList'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>