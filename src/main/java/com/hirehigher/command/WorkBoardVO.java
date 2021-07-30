package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkBoardVO {

	private String listBno;
	private String creatorName;
	private String productImg;
	private int star;
	private String category;
	private Timestamp regDate;

	
}
