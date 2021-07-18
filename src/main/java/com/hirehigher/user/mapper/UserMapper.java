package com.hirehigher.user.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hirehigher.command.UserVO;


public interface UserMapper {
	
	public UserVO login(UserVO vo);//로그인
	public ArrayList<UserVO> findIdA(@Param("userName") String userName,@Param("birthDay") String birthDay);//생년월일로 아이디찾기
	public ArrayList<UserVO> findIdB(@Param("userName") String userName,@Param("userCellNum") String userCellNum);//전화번호로 아이디찾기
	public int idCheck(String userId);//아이디 중복확인
	public int nickNameCheck(String nickName);//닉네임 중복확인
	public int emailCheck(String userEmail);//이메일 중복확인
	public int join(UserVO vo);//회원가입
	public UserVO getUserInfo(String userId);//유저정보+글정보
}
