package com.example.demo.dto;

import lombok.Data;

@Data
public class dto_payment {
	
	private String idx;
	private String user_idx;
	private String user_id;
	private String order_person_name;
	private String order_person_phone;
	private String receiver_name;
	private String receiver_address;
	private String receiver_phone;
	private String memo;
	private String item_number;
	private String item_img;
	private String item_name;
	private String item_count;
	private String item_sellingPrice;
	private String used_point;
	private String payment;

}
