package com.hirehigher.counter.mapper;

public interface CounterMapper {
	//방문자 카운트
	public void countVisits();
	//총 방문자 수
	public int totalVisits();
	//총 게시글 수
	public int totalPosts();
	//총 유저 수
	public int totalUsers();

	//일일 방문자 수
	public int visitsPerDay7();
	public int visitsPerDay6();
	public int visitsPerDay5();
	public int visitsPerDay4();
	public int visitsPerDay3();
	public int visitsPerDay2();
	public int visitsPerDay1();
	
	//일일 게시글 수
	public int postsPerDay7();
	public int postsPerDay6();
	public int postsPerDay5();
	public int postsPerDay4();
	public int postsPerDay3();
	public int postsPerDay2();
	public int postsPerDay1();
}
