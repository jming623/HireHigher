package com.hirehigher.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfileImgVO {

	private String profileId; // 아이디
	private String profilePath; // 업로드 경로
	private String profileLoca; // 폴더 경로
	private String profileName; // 변경된 파일명
	private String profileReal; // 실제 파일명
	
}
