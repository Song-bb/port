package com.example.demo.dto;

import lombok.Data;

@Data
public class dto_myOrder {
	
	private String idx;
	private String user_id;
	private String order_number;
	private String item_img;
	private String item_text;
	private String date;
	private String price_item;
	private String price_sale;
	private String price_delevery;
	private String price_actual;
	private String count;
	private String payment;
	private String bank;
	private String receiver_name;
	private String receiver_phone;
	private String receiver_address;
	private String delivery_memo;
	private String statement;

}