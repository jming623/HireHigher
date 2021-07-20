package com.hirehigher.command;


import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class UserVO {
	
	private String userId;//아이디
	private String userPw;//비밀번호
	private String userName;//이름
	private String nickName;//닉네임
	private String birthDay;//생년월일<ex:1995/06/23>
	private String userEmail;//이메일
	private String userCellNum;//7핸드폰 번호
	private String addrZipNum;//우편번호
	private String addrBasic;//기본주소
	private String addrDetail;//상세주소
	private Timestamp regdate;//가입일
	private int userType;//고객유형 <0 = 비제작자, 1 = 제작자>
	
	//마이페이지에서 users와 jobBoard를 조인해서 글정보를 불어올때 사용할 ArrayList
	/* private ArrayList<JobBoardVO> jobBoardList; */

}
