package com.hirehigher.reply.service;

import java.util.ArrayList;

import com.hirehigher.command.WorkReplyVO;
import com.hirehigher.util.ReplyCriteria;

public interface ReplyService {

	public int regist(WorkReplyVO vo); //등록
	public ArrayList<WorkReplyVO> getList(int bno, ReplyCriteria cri);
	public int getTotal(int bno); //전체댓글 수
	public int update(WorkReplyVO vo); //수정
	public int delete(WorkReplyVO vo); //삭제
}