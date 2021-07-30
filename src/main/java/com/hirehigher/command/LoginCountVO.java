package com.hirehigher.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginCountVO {
	
	private String userId;
	private int loginTryNum;
	private Timestamp loginFailTime ;
	private String loginLimitStatus;
	private Timestamp loginLimitTime;
}
