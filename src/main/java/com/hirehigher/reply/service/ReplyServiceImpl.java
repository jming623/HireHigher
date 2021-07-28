package com.hirehigher.reply.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirehigher.reply.mapper.ReplyMapper;
import com.hirehigher.util.ReplyCriteria;
import com.hirehigher.command.WorkReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public int regist(WorkReplyVO vo) {
		return replyMapper.regist(vo);
	}

	@Override
	public ArrayList<WorkReplyVO> getList(int bno, ReplyCriteria cri) {
		return replyMapper.getList(bno, cri);
	}


	@Override
	public int update(WorkReplyVO vo) {
		return replyMapper.update(vo);
	}

	@Override
	public int getTotal(int bno) {
		return replyMapper.getTotal(bno);
	}
}