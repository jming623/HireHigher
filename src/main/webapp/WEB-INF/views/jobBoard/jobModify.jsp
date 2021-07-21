<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<form action="jobUpdate" method="post">
		<div class="container">
			<div class="row">
				<div class="detail_content">
					<div class="detail_title">
						<h2>제목</h2>
						<input class="jobmodify-input-xl" name='title'
							value="${jobBoardDetailVO.title }">
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
										<dd>
											<select class="jobmodify-select-mini" name='gender'>
												<option value="남자"
													<c:if test="${jobBoardDetailVO.gender eq '남자'}">selected</c:if>>남자</option>
												<option value="여자"
													<c:if test="${jobBoardDetailVO.gender eq '여자'}">selected</c:if>>여자</option>
											</select>
										</dd>
									</dl>
									<dl>
										<dt>연령</dt>
										<dd>
											<input class="jobmodify-input-mini" name='age'
												value="${jobBoardDetailVO.age }">
										</dd>
									</dl>
									<dl>
										<dt>학력</dt>
										<dd>
											<select class="jobmodify-select-mini" name='edu'>
												<option value="중졸"
													<c:if test="${jobBoardDetailVO.edu eq '중졸'}">selected</c:if>>중졸</option>
												<option value="고졸"
													<c:if test="${jobBoardDetailVO.edu eq '고졸'}">selected</c:if>>고졸</option>
												<option value="학사"
													<c:if test="${jobBoardDetailVO.edu eq '학사'}">selected</c:if>>학사</option>
												<option value="석사"
													<c:if test="${jobBoardDetailVO.edu eq '석사'}">selected</c:if>>석사</option>
												<option value="박사"
													<c:if test="${jobBoardDetailVO.edu eq '박사'}">selected</c:if>>박사</option>
												<option value="비공개"
													<c:if test="${jobBoardDetailVO.edu eq '비공개'}">selected</c:if>>비공개</option>
											</select>
										</dd>
									</dl>
									<dl>
										<dt>고용형태</dt>
										<dd>
											<input class="jobmodify-input-mini" name='empType'
												value="${jobBoardDetailVO.empType }">
										</dd>
									</dl>
									<dl>
										<dt>모집인원</dt>
										<dd>
											<input class="jobmodify-input-mini" name='recNum'
												value="${jobBoardDetailVO.recNum}">
										</dd>
									</dl>
									<dl>
										<dt>우대사항</dt>
										<dd>
											<input class="jobmodify-input-large" name="preference"
												value="${jobBoardDetailVO.preference}">
										</dd>
									</dl>
									<dl>
										<dt>제출서류</dt>
										<dd>
											<input class="jobmodify-input-large" name="requiredDocs"
												value="${jobBoardDetailVO.requiredDocs}">
										</dd>
									</dl>
								</div>
								<div class="detail_work">
									<h3>근무조건</h3>
									<dl>
										<dt>급여</dt>
										<dd>
											<input class="jobmodify-input-regular" name="salary"
												value="${jobBoardDetailVO.salary}">
										</dd>
									</dl>
									<dl>
										<dt>근무기간</dt>
										<dd>
											<input class="jobmodify-input-regular" name="contract"
												value="${jobBoardDetailVO.contract}">
										</dd>
									</dl>
									<dl>
										<dt>근무요일</dt>
										<dd>
											<input class="jobmodify-input-mini" name='workDays'
												value="${jobBoardDetailVO.workDays}">
										</dd>
									</dl>
									<dl>
										<dt>근무시간</dt>
										<dd>
											<input class="jobmodify-input-mini" name="workTime"
												value="${jobBoardDetailVO.workTime}">
										</dd>
									</dl>
									<dl>
										<dt>복리후생</dt>
										<dd>
											<textarea class="jobmodify-textarea" name="welfare">
												${jobBoardDetailVO.welfare}
											</textarea>
										</dd>
									</dl>
								</div>
							</div>
							<div class="detail_right">
								<div class="detail_recruit_time">
									<h3>모집마감일</h3>
									<strong> <input class="jobmodify-input-regular"
										name="deadline" value="${jobBoardDetailVO.deadline}">
									</strong>
								</div>
								<div class="detail_recruit_manager_info">
									<h3>채용담당자정보</h3>
									<dl>
										<dt>담당자명</dt>
										<dd>
											<input class="jobmodify-input-regular" name="HRManager"
												value="${jobBoardDetailVO.HRManager}">
										</dd>
									</dl>
									<dl>
										<dt>연락처</dt>
										<dd>
											<input class="jobmodify-input-regular" name="HRContact"
												value="${jobBoardDetailVO.HRContact}">
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
								<dt>회사 이름</dt>
								<dd>
									<input class="jobmodify-input-regular" name="companyName"
										value="${jobBoardDetailVO.companyName}">
								</dd>
							</dl>
							<dl>
								<dt>근무지주소</dt>
								<dd>
									<input class="jobmodify-input-xl" name="companyAddr"
										value="${jobBoardDetailVO.companyAddr}">
								</dd>
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
								<dd>
									<input class="jobmodify-input-regular" name="position"
										value="${jobBoardDetailVO.position}">
								</dd>
							</dl>
							<dl>
								<dt>지원방법</dt>
								<dd>
									<input class="jobmodify-input-large" name="wayToApply"
										value="${jobBoardDetailVO.wayToApply}">
								</dd>
							</dl>
							<dl>
								<dt>채용일정</dt>
								<dd>
									<p>
										<input class="jobmodify-input-large" name="recPlan"
											value="${jobBoardDetailVO.recPlan}">
									</p>
								</dd>
							</dl>
						</div>
					</div>
					<div class="detailBtn">
						<button type="submit" class="btn btn-info">변경</button>
						<button type="button" class="btn btn-default"
							onclick="location.href='jobList'">목록</button>
						<button type="button" class="btn btn-info"
							onclick="location.href='jobDelete?bno=${jobBoardDetailVO.bno}&userId=${jobBoardDetailVO.userId }' ">삭제</button>

					</div>
				</div>
			</div>
		</div>
	</form>
</section>