package com.hirehigher.command;

import java.sql.Time;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InsertQuestionPageVO {
	
	private int insertBno;
	private String insertKind;
	private String insertId;
	private String insertTitle;
	private String insertContent;
	private Timestamp insertDate;
	private String answerTitle;
	private String answerContent;
	private Timestamp answerDate;
	private String answerStatus;
	private String insertImg;
	private int[] noList;
}
