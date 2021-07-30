package com.hirehigher.user.service;

import java.util.ArrayList;

import com.hirehigher.command.InsertQuestionPageVO;
import com.hirehigher.command.JobBoardVO;
import com.hirehigher.command.LoginCountVO;
import com.hirehigher.command.UserVO;


public interface UserService {
	
	public UserVO login(UserVO vo);//로그인
	public UserVO kakaoLogin(String userId);//카카오로그인
	public ArrayList<UserVO> findIdA(String userName, String birthDay);//생년월일로 아이디찾기
	public ArrayList<UserVO> findIdB(String userName, String userCellNum);//전화번호로 아이디찾기
	public String findPw(String userId, String userName, String userEmail); //비밀번호 찾기
	public int idCheck(String userId);//아이디 중복확인
	public int nickNameCheck(String nickName);//닉네임 중복확인
	public int emailCheck(String userEmail);//이메일 중복확인
	public int join(UserVO vo);//회원가입
	public int kakaoJoin1(UserVO vo);//이메일 정보가 포함된 카카오회원가입
	public int kakaoJoin2(UserVO vo);//이메일 정보가 포함되지 않은 카카오 회원가입
	public UserVO getUserInfo(String userId);//유저정보
	public int modify(UserVO vo);//회원정보 수정
	public ArrayList<JobBoardVO> getJobBoardList(int pageNum, int amount , String userId); //마이페이지 채용공고 게시글 불러오기
	public int getJobBoardTotal(String userId); //마이페이지 채용공고 총게시글 수 불러오기
	public ArrayList<InsertQuestionPageVO> getFaqBoardList(int pageNum, int amount , String userId); //마이페이지 문의내역 게시글 불러오기
	public int getFaqBoardTotal(String userId); //마이페이지 문의내역 총게시글 수 불러오기
	public void registLoginCount(String userId);//회원가입 성공시 loginCount테이블에 유저정보 등록
	public LoginCountVO getloginLimitTime(String userId);//로그인이 제한된 시간불러오기
	public void setLoginLimitN(String userId);//로그인 제한여부 'N'으로 변경
	public LoginCountVO getLoginLimitStatus(String userId);//로그인 제한여부 불러오기
	public void resetLoginTryNum(String userId);//로그인 시도횟수를 0으로 리셋
	public LoginCountVO getloginFailTime(String userId);//로그인을 실패한 마지막 시간 불러오기
	public LoginCountVO getLoginTryNum(String userId);//로그인 시도 횟수 불러오기
	public void plusLoginTryNum(String userId, int addLoginTryNum);//로그인 시도횟수 +1
	public void resetLoginFailTime(String userId);//로그인 실패한 마지막시간 리셋
	public void setLoginLimitY(String userId);//로그인 제한여부 'Y'으로 변경
	public void resetLoginLimitTime(String userId);//로그인을 제한한시간 리셋
	
}
