package com.hirehigher.command;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JobBoardVO {
	
	private int bno; //글 번호
	private int viewCount; //조회수
	private String userId; //아이디
	private String userName; //작성자
	private String companyName; //기업
	private String title; //제목
	private Timestamp regDate; // 작성일
}