package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkReplyVO {

	private int rno;
	private int bno;
	private String reply;
	private String replyId;
	private Timestamp replyDate;
	private Timestamp updateDate;
	
	private String timegap;
}