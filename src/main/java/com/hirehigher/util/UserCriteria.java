package com.hirehigher.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserCriteria {
	
	private String userId;
	private int pageNum;
	private int amount;
}
