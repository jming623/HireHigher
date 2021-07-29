package com.hirehigher.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreatorCriteria {

	private String userName;
	private int pageNum;
	private int amount;
	
}
