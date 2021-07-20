package com.hirehigher.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FaqListPageVO {
	private int faqBno; //FAQ번호
	private int faqNum; //문의 종류 번호
	private String paymentFaqTitle; //결제 제목
	private String paymentFaq; // 결제 답변
	
	private String loginFqaTitle; //로그인 제목
	private String loginFqa; //로그인 답변
	
	private String homePageFaqTitle; //홈페이지 제목
	private String homePageFaq; //홈페이지 답변
	
	private String insertItemFaqTitle; //아이템 제목
	private String insertItemFaq; //아이템 답변
}
