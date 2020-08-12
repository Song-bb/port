package com.example.demo.dto;

import lombok.Data;

@Data
public class dto_review {
	
	private String idx;
	private int user_index;
	private String user_id;
	private String item_idx;
	private String item_img;
	private String item_name;
	private String order_number;
	private String Buy_price;
	private String Buy_date;
	private String review_content;
	private String review_score;
	private String write_date;

}
