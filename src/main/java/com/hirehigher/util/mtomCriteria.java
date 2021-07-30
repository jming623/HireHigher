package com.hirehigher.util;

import lombok.Data;

@Data
public class mtomCriteria {
		
	
	private int currentPage; //조회중 페이지
	private int displayRow; //페이지당 게시글 수
	
	
	public mtomCriteria() {
		this(1,5);
	}
	
	public mtomCriteria(int currentPage,int displayRow) {
		this.currentPage = currentPage;
		this.displayRow = displayRow;
	}
}
