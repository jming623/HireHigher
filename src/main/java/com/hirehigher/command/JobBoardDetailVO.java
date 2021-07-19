package com.hirehigher.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JobBoardDetailVO {

	private String gender; //성별
	private String age; //연령
	private String edu; //학력
	private String empType; //고용형태
	private String recNum; //모집인원
	private String preference; //우대사항(회사 선호상)
	private String requiredDocs; //제출서류
	private String salary; //급여
	private String contract; //근무기간
	private String workDays; //근무요일
	private String workTime; //근무시간
	private String welfare; //복리후생
	private String companyAddr; //근무지주소
	private String position; //담당업무
	private String wayToApply; //지원방법
	private String recPlan; //채용일정
	private String deadline; //모집마감일 
	private String HRManager; //채용담당자명
	private String HRContact; //채용담당자연락처
	private int bno; //글번호
	
}
