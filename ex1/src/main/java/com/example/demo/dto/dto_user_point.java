package com.example.demo.dto;

import lombok.Data;

@Data
public class dto_user_point {

	private String idx;
	private String user_id;
	private String date;
	private String order_number;
	private String item_name;
	private int price;
	private int point_rate;
	private int point;
	private int total_point;
	private String edit;
	
}
