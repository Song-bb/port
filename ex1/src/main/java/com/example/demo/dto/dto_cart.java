package com.example.demo.dto;

import lombok.Data;

@Data
public class dto_cart {

	private String cart_idx; 		 //장바구니 번호
	private String user_idx; 		 //사용자 인덱스
	private String item_idx; 		 //상품 인덱스
	private String user_id;			 //사용자 아이디
	private String user_name;		 //사용자 이름
	private String item_number;		 //상품번호
	private String item_name;		 //상품이름
	private String item_img;		 //상품이미지
	private String item_sale_price;	 //상품판매가격
	private String item_order_amount;//구매수량
	private String item_order_price; //상품구매가격(수량*가격)
}
