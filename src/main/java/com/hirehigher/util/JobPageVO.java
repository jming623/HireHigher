package com.hirehigher.util;

import lombok.Data;

@Data
public class JobPageVO {
	
	private int startPage; //첫 페이지
	private int endPage; //마지막 페이지
	private boolean next; //다음 버튼 활성화
	private boolean prev; //이전 버튼 활성화
	
	private int total; //총 게시글 수
	private int pageNum; //조회중 페이지
	private int amount; //페이지당 게시글  수
	
	private JobCriteria cri;
	
	public JobPageVO(JobCriteria cri, int total) {
		
		//JobCriteria 값 기준으로 페이지 초기화
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		/* endPage 계산  (끝 페이지 1)
		 * 공식: (int)Math.ceil( pageNum(조회중 페이지) / amount(페이지당 게시글 수) ) * amount(페이지당 게시글 수)
		 * 예: 조회중 페이지가 11번일 때 
		 * (int)Math.ceil(11/10)은 1.1, (int)Math.ceil로 올림처리 하면 2가 되고, 2*10 = 20 
		 */
		this.endPage = (int)Math.ceil( this.pageNum / 10.0 ) * 10;
		
		/* startPage 계산 (시작 페이지 번호)
		 * 공식: 끝 페이지 - 보여질 페이지 수 + 1
		 * 예: 끝 페이지가 40번일 때 40-10+1 = 31(시작 페이지) 
		 */		
		this.startPage = this.endPage -10 + 1;
		
		/* realEnd 계산 (끝 페이지 2)
		 * 공식: (int)Math.cei( this.total(총 게시글 수) / (double)this.amount(페이지당 게시글 수) )
		 * 예: 게시글이 55개이면 끝페이지는 6, 게시글이 112개이면 끝페이지는 12 
		 */
		int realEnd = (int)Math.ceil( this.total / (double)this.amount );
		
		/* 실제 끝페이지 계산
		 * 335개의 게시글, 332번게시글, 34번 페이지가 pageNum일 때 endPage는 40이지만, realEnd는  34
		 */
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//이전 버튼은 1보다 크면 활성화(true)
		this.prev = this.startPage > 1;
		
		//다음버튼 활성화
		this.next = realEnd > this.endPage;
	}
	

}