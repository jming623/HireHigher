package com.hirehigher.util;

import lombok.Data;

@Data
public class CreatorPagingVO {

	private int startPage; // 첫 페이지 번호
	private int endPage; // 마지막 페이지 번호
	private boolean next; // 다음 버튼 활성화
	private boolean prev; // 이전 버튼 활성화
	
	private int total; // 총 게시글 수
	private int pageNum; // 조회하는 페이지 번호(criteria 안에도 존재)
	private int amount; // 보여질 데이터 개수
	
	private CreatorCriteria cri;
	
	// 생성자
	public CreatorPagingVO(CreatorCriteria cri, int total) {
		
		// 번호, 개수, 총 게시글 수 초기화
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		// 끝 페이지
		// (int)Math.ceil(pageNum / 보여질 페이지 수) * 보여질 페이지 수
		// pageNum이 1 -> 끝 페이지 번호는 5
		this.endPage = (int)Math.ceil(this.pageNum / 5.0) * 5;
		
		// 시작 페이지
		// 끝 페이지 - 보여질 페이지 수 + 1
		this.startPage = this.endPage - 5 + 1;
		
		// 실제 마지막 번호
		// 게시글이 101개 -> 마지막 끝 페이지 번호는 21
		// (int)Math.ceil( 전체 게시글 수 / 화면에 뿌려질 데이터 amount값 )
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		// endPage를 다시 계산
		// 게시글이 101 -> pageNum 21일 때 endPage는 25 realEnd는 21
		if(this.endPage > realEnd) {
			this.endPage = realEnd; // 마지막에 도달했을 때 보여질 번호를 변경
		}
		
		// 이전 버튼 활성화 여부 - 1보다 크면 활성화
		// startPage는 1, 11, 21, 31....
		this.prev = this.startPage > 1;
				
		// 다음 버튼 활성화 여부
		this.next = realEnd > this.endPage;
		
	}
	
}
