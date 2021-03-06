package com.example.demo.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_cart;

@Mapper
public interface IDao_cart_ByUser {
	
	//카트 리스트
	public List<dto_cart> cart_listDao();
	
	//카트 리스트(로그인)
	public List<dto_cart> login_cart_listDao(String user_idx);
	
	//카트에 상품 추가
	public int cart_itemInsertDao(Map<String, String> map);
	
	//카트에서 상품 삭제
	public int cart_item_deleteDao(String cart_idx);
	
	//카트에 전체 주문 상품 가격
	public String cart_item_order_finalPriceDao(String user_idx);
	
	//카트에서 같은 상품이 있으면 해당 상품의 수량을 수정한다.
	public int cart_amount_updateDao(Map<String, String> map);
	
	public int deleteCart1(String item_index1);
	public int deleteCart2(String item_index2);
	public int deleteCart3(String item_index3);
	public int deleteCart4(String item_index4);
	public int deleteCart5(String item_index5);
	
	
}
