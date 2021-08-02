package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkBoardVO {

	private int bno;//글번호 
	private String creatorName;//제작자닉네임
	private String title;//글제목
	private String productPath;//업로드 경로
	private String productLocation;//폴더위치
	private String productName;//변경된파일명
	private String productReal;//실제파일명
	private String content;//상품설명
	private String price;//상품가격
	private int likeCount;//좋아요
	private String category;//카테고리
	private Timestamp regDate;//등록일
	private Timestamp updateDate;//수정일

}
