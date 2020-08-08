package com.example.demo.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_cart;

@Mapper
public interface IDao_cart_ByUser {
	
	//카트 리스트
	public List<dto_cart> cart_listDao();
	
	//카트에 상품 추가
	public int cart_itemInsertDao(Map<String, String> map);
	
	//카트에서 상품 삭제
	public int cart_item_deleteDao(String cart_idx);
	
	//카트에 전체 주문 상품 가격
	public int cart_order_priceDao(String user_idx);
}
