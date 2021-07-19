package com.hirehigher.command;

import java.sql.Time;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDetailVO {
	
	private int answerBno;
	private String answerTitle;
	private String answerContent;
	private Timestamp answerDate;
	private int questionDetailNum;

}
