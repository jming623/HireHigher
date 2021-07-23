package com.hirehigher.util;

import lombok.Data;

@Data
public class UserPageVO {
	private int startPage; //첫 페이지
	private int endPage; //마지막 페이지
	private boolean next; //다음 버튼 활성화
	private boolean prev; //이전 버튼 활성화
	
	private int total; //총 게시글 수
	private int pageNum; //조회중 페이지
	private int amount; //페이지당 게시글  수
	
	private UserCriteria cri;
	
	public UserPageVO(UserCriteria cri, int total) {
		
		//JobCriteria 값 기준으로 페이지 초기화
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)Math.ceil( this.pageNum / 10.0 ) * 10;
		
		this.startPage = this.endPage -10 + 1;
		
		int realEnd = (int)Math.ceil( this.total / (double)this.amount );
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = realEnd > this.endPage;
	}
	
}
