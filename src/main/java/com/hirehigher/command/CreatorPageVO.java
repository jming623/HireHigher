package com.hirehigher.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreatorPageVO {

	private int pageBno; // 제작자 페이지 번호
	private int creatorBno; // 제작자 번호
	private String profilePath; // 프로필 이미지 업로드 경로
	private String profileLoca; // 프로필 이미지 폴더 위치
	private String profileName; // 프로필 이미지 변경된 파일명
	private String profileReal; // 프로필 이미지 실제 파일명
	private String aboutMe; // 자기소개
	private String backgroundPath; // 백그라운드 이미지 업로드 경로
	private String backgroundLoca; // 백그라운드 이미지 폴더 위치
	private String backgroundName; // 백그라운드 이미지 변경된 파일명
	private String backgroundReal; // 백그라운드 이미지 실제 파일명
	private String instaId; // 인스타 이이디
	private String nickname; // 닉네임
	
}
