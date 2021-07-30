package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkBoardVO {

	private int bno; // 게시글 번호
	private String userName; // 아이디
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private Timestamp regDate; // 게시글 작성일
	private Timestamp updateDate; // 게시글 수정일
	
}
