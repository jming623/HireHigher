package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkReplyVO {

	private int rno;//댓글번호
	private int bno;//글번호
	private String reply;//댓글내용
	private String replyId;//작성자
	private Timestamp replyDate;//등록일
	private Timestamp updateDate;//수정일
	
//	private String timegap; 고려
}