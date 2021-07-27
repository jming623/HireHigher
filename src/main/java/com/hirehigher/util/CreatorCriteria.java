package com.hirehigher.util;

import lombok.Data;

@Data
public class CreatorCriteria {

	private int pageNum;
	private int amount;
	
	public CreatorCriteria() {
		this(1, 10);
	}
	
	public CreatorCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
