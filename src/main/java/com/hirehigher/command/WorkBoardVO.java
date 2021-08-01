package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkBoardVO {

	private int bno;
	private String title;
	private String creatorName;
	private String productPath;
	private String productLocation;
	private String productName;
	private String productReal;
	private String content;
	private String price;
	private int likeCount;
	private String category;
	private Timestamp regDate;
	private Timestamp updateDate;
	
}
