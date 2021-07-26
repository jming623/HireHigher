package com.hirehigher.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BackgroundImgVO {

	private String backgroundId; // 아이디
	private String backgroundPath; // 업로드 경로
	private String backgroundLoca; // 폴더 경로
	private String backgroundName; // 변경된 파일명
	private String backgroundReal; // 실제 파일명
	
}
