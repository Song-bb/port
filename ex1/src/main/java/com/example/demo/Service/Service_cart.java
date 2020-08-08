package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_cart_ByUser;
import com.example.demo.dto.dto_cart;

@Service
public class Service_cart {

	@Autowired
	IDao_cart_ByUser dao_cart;
	
	//카트 상품 리스트
	public List<dto_cart> cart_list(){
		return dao_cart.cart_listDao();
	}
	
	//카트 상품 생성
	public int cart_itemInsert(Map<String, String> map) {
		int nResult = dao_cart.cart_itemInsertDao(map);
		return nResult;
	}
	
	//카드 상품 삭제
	public int cart_item_delete(String cart_idx) {
		int nResult = dao_cart.cart_item_deleteDao(cart_idx);
		return nResult;
	}
	
	//카트 전체 상품 가격
	
	
}
