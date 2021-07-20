package com.hirehigher.util;

import lombok.Data;

@Data
public class JobCriteria {
	
	//jobList.jsp에서 댓글 form 태그에서 데이터 전달 받음
	private int pageNum; //조회중 페이지
	private int amount; //페이지당 게시글 수

	//jobList.jsp에서 댓글 form 태그에서 데이터 전달 받음
	private String searchType; //검색 유형
	private String searchName; //검색 키워드
	
	public JobCriteria() {
		this(1, 10);
	}
	
	public JobCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
