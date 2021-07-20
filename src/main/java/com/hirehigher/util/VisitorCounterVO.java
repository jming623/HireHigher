package com.hirehigher.util;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VisitorCounterVO {
	
	private Timestamp visitDate; //방문일
}
