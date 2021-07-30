package com.hirehigher.util;

import lombok.Data;

@Data
public class WorkBoardCriteria {	
	
		private int pageNum; //현재 페이지
		private int amount; //불러올 게시글 수		
		private String Category; //카테고리 
		
		public WorkBoardCriteria() {
			this(1, 20,"2D_ART");
		}
		
		public WorkBoardCriteria(int pageNum, int amount,String Category) {
			this.pageNum = pageNum;
			this.amount = amount;
			this.Category = Category;
		}
}
