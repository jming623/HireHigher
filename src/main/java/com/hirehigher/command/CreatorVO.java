package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreatorVO {

	private int creatorBno; // 제작자번호
	private String creatorId; // 제작자 아이디
	private String creatorMajor; // 전공분야
	private String creatorCareer; // 경력사항
	private String creatorCareer1; // 경력사항1
	private String creatorCareer2; // 경력사항2
	private String creatorAwards; // 수상경력
	private String creatorAwards1; // 수상경력1
	private String creatorAwards2; // 수상경력2
	private Timestamp creatorRegdate; // 제작자 등록일	
	
}
