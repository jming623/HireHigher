package com.hirehigher.user.service;

import java.util.ArrayList;

import com.hirehigher.command.InsertQuestionPageVO;
import com.hirehigher.command.JobBoardVO;
import com.hirehigher.command.UserVO;


public interface UserService {
	
	public UserVO login(UserVO vo);//로그인
	public ArrayList<UserVO> findIdA(String userName, String birthDay);//생년월일로 아이디찾기
	public ArrayList<UserVO> findIdB(String userName, String userCellNum);//전화번호로 아이디찾기
	public String findPw(String userId, String userName, String userEmail); //비밀번호 찾기
	public int idCheck(String userId);//아이디 중복확인
	public int nickNameCheck(String nickName);//닉네임 중복확인
	public int emailCheck(String userEmail);//이메일 중복확인
	public int join(UserVO vo);//회원가입
	public UserVO getUserInfo(String userId);//유저정보+글정보
	public int modify(UserVO vo);//회원정보 수정
	public ArrayList<JobBoardVO> getJobBoardList(int pageNum, int amount , String userId); //마이페이지 채용공고 게시글 불러오기
	public int getJobBoardTotal(String userId); //마이페이지 채용공고 총게시글 수 불러오기
	public ArrayList<InsertQuestionPageVO> getFaqBoardList(int pageNum, int amount , String userId); //마이페이지 문의내역 게시글 불러오기
	public int getFaqBoardTotal(String userId); //마이페이지 문의내역 총게시글 수 불러오기
}
