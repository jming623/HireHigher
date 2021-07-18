package com.hirehigher.counter.mapper;

public interface CounterMapper {
	//방문자 카운트
	public void countVisits();
	//총 방문자 수
	public int totalVisits();
	//일일 방문자 수
	public int visitsPerDay();
	//총 게시글 수
	public int totalPosts();
	//총 유저 수
	public int totalUsers();
}
