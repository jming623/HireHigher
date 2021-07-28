package com.hirehigher.util;

import lombok.Data;

@Data
public class mtomListCountVO {
	
	//paging
	
	private int totalCount; //전체 게시글 수
	private int currentPage; //현재 페이지
	private int displayRow; //페이지당 게시글수
	private int totalPage; //전체 페이지 수
	private boolean mtomnext; //다음 버튼 활성화
	private boolean mtomprev; //이전 버튼 활성화
	
	
	//pagination
	
	private int beginPage; //페이징 시작 페이지
	private int endPage; //페이징 종료 페이지

	
	private mtomCriteria mtomcri;
	
	public mtomListCountVO(mtomCriteria cri, int total) {
		
		//JobCriteria 값 기준으로 페이지 초기화
		this.currentPage = cri.getCurrentPage();
		this.displayRow = cri.getDisplayRow();
		this.totalCount = total;
		this.mtomcri = cri;
		
		/* endPage 계산  (끝 페이지 1)
		 * 공식: (int)Math.ceil( currentPage(조회중 페이지) / displayRow(페이지당 게시글 수) ) * displayRow(페이지당 게시글 수)
		 * 예: 조회중 페이지가 11번일 때 
		 * (int)Math.ceil(11/10)은 1.1, (int)Math.ceil로 올림처리 하면 2가 되고, 2*10 = 20 
		 */
		this.endPage = (int)Math.ceil( this.currentPage / 5.0 ) * 5;
		
		/* startPage 계산 (시작 페이지 번호)
		 * 공식: 끝 페이지 - 보여질 페이지 수 + 1
		 * 예: 끝 페이지가 40번일 때 40-10+1 = 31(시작 페이지) 
		 */		
		this.beginPage = this.endPage - 5 + 1;
		
		/* realEnd 계산 (끝 페이지 2)
		 * 공식: (int)Math.cei( this.total(총 게시글 수) / (double)this.amount(페이지당 게시글 수) )
		 * 예: 게시글이 55개이면 끝페이지는 6, 게시글이 112개이면 끝페이지는 12 
		 */
		int realEnd = (int)Math.ceil( this.totalCount / (double)this.displayRow );
		
		/* 실제 끝페이지 계산
		 * 335개의 게시글, 332번게시글, 34번 페이지가 pageNum일 때 endPage는 40이지만, realEnd는  34
		 */
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//이전 버튼은 1보다 크면 활성화(true)
		this.mtomprev = this.beginPage > 1;
		
		//다음버튼 활성화
		this.mtomnext = realEnd > this.endPage;
	}

}
