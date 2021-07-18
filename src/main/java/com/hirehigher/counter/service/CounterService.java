package com.hirehigher.counter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirehigher.counter.mapper.CounterMapper;

@Service("CounterService")
public class CounterService {
	
	//----------------------------MAPPER 연결----------------------------
	@Autowired
	private CounterMapper cm;
	//----------------------------MAPPER 연결----------------------------
	
	//방문자 카운트
	public void countVisits() {
		cm.countVisits();
	}
	//총 방문자 수
	public int totalVisits() {
		return cm.totalVisits();
	}
	//일일 방문자 수
	public int visitsPerDay() {
		return cm.visitsPerDay();
	}
	//총 게시글 수
	public int totalPosts() {
		return cm.totalPosts();
	}
	//일일 게시글 수
	public int postsPerDay() {
		return cm.postsPerDay();
	}
	//총 유저 수
	public int totalUsers() {
		return cm.totalUsers();
	}
	
}
