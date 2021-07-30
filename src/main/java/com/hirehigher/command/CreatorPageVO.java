package com.hirehigher.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreatorPageVO {

	private String pageId; // 아이디
	private String creatorEmail; // 이메일
	private String aboutMe; // 자기소개
	private String creatorNick; // 닉네임
	private String instaPath; // 인스타그램 주소
	
}
