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
	//총 게시글 수
	public int totalPosts() {
		return cm.totalPosts();
	}
	//총 유저 수
	public int totalUsers() {
		return cm.totalUsers();
	}
	
	//일일 방문자 수
	public int visitsPerDay7() {
		return cm.visitsPerDay7();
	}
	public int visitsPerDay6() {
		return cm.visitsPerDay6();
	}
	public int visitsPerDay5() {
		return cm.visitsPerDay5();
	}
	public int visitsPerDay4() {
		return cm.visitsPerDay4();
	}
	public int visitsPerDay3() {
		return cm.visitsPerDay3();
	}
	public int visitsPerDay2() {
		return cm.visitsPerDay2();
	}
	public int visitsPerDay1() {
		return cm.visitsPerDay1();
	}
	
	//일일 게시글 수
	public int postsPerDay7() {
		return cm.postsPerDay7();
	}
	public int postsPerDay6() {
		return cm.postsPerDay6();
	}
	public int postsPerDay5() {
		return cm.postsPerDay5();
	}
	public int postsPerDay4() {
		return cm.postsPerDay4();
	}
	public int postsPerDay3() {
		return cm.postsPerDay3();
	}
	public int postsPerDay2() {
		return cm.postsPerDay2();
	}
	public int postsPerDay1() {
		return cm.postsPerDay1();
	}
	
}