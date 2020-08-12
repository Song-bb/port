package com.example.demo.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import com.example.demo.dao.IDao_cart_ByUser;
import com.example.demo.dao.IDao_members;
import com.example.demo.dao.IDao_myPage;
import com.example.demo.dao.IDao_payment;
import com.example.demo.dto.dto_payment;

@Service
public class Service_payment {
	
	@Autowired
	IDao_payment dao_payment;
	@Autowired
	IDao_myPage dao_myPage;
	@Autowired
	IDao_members dao_members;
	@Autowired
	IDao_cart_ByUser dao_cart;

	
	@Autowired
	PlatformTransactionManager transactionManager;
	@Autowired
	TransactionDefinition definition;

	public int insertPayment( Map<String, String> map ) {
		
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		String result_point = map.get("result_point").toString();
		String user_id = map.get("user_id").toString();
		String item_name = map.get("item_name"+1).toString();
		String total_price = map.get("total_price").toString();
		String used_point = map.get("used_point").toString();
		
		String order_number = "";
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		order_number += date.getYear(); 
		order_number += date.getMonth().getValue();
		order_number += date.getDayOfMonth();
		order_number += time.getHour();
		order_number += time.getMinute();
		order_number += time.getSecond();
		
		map.put("order_number", order_number);
		
		try {
			int count = Integer.parseInt(map.get("count").toString());
			if( count < 2 ) {
				dao_payment.addPayment1(map);
				dao_cart.deleteCart1(map.get("item_index1").toString());
			} else if( count < 3 ) {
				dao_payment.addPayment2(map);
				dao_cart.deleteCart1(map.get("item_index1").toString());
				dao_cart.deleteCart2(map.get("item_index2").toString());
			} else if( count < 4 ) {
				dao_payment.addPayment3(map);
				dao_cart.deleteCart1(map.get("item_index1").toString());
				dao_cart.deleteCart2(map.get("item_index2").toString());
				dao_cart.deleteCart3(map.get("item_index3").toString());
			} else if( count < 5 ) {
				dao_payment.addPayment4(map);
				dao_cart.deleteCart1(map.get("item_index1").toString());
				dao_cart.deleteCart2(map.get("item_index2").toString());
				dao_cart.deleteCart3(map.get("item_index3").toString());
				dao_cart.deleteCart4(map.get("item_index4").toString());
			} else {
				dao_payment.addPayment5(map);
				dao_cart.deleteCart1(map.get("item_index1").toString());
				dao_cart.deleteCart2(map.get("item_index2").toString());
				dao_cart.deleteCart3(map.get("item_index3").toString());
				dao_cart.deleteCart4(map.get("item_index4").toString());
				dao_cart.deleteCart5(map.get("item_index5").toString());
			}
			
			dao_myPage.editPoint(user_id, order_number, item_name, total_price, used_point, result_point);
			dao_members.editPoint()
			
			transactionManager.commit(status);
			return 1;
		} catch(Exception e) {
			transactionManager.rollback(status);
			System.out.println(e);
			return 0;
		}
	}
	
	public List<dto_payment> view(String user_id){
		return dao_payment.view(user_id);
	}
	
	public List<dto_payment> myPage_main(String user_id){
		return dao_payment.myPage_main(user_id);
	}
	
	public List<dto_payment> myPage_main_year(String user_id, String year){
		int newYear = Integer.parseInt(year);
		String newYear_min ="";
		String newYear_max = "";
		if( newYear == 2018 ) {
			newYear_min = "2018-01-01";
			newYear_max = "2018-12-31";
		} else if( newYear == 2019) {
			newYear_min = "2019-01-01";
			newYear_max = "2019-12-31";
		} else if( newYear == 2020 ) {
			newYear_min = "2020-01-01";
			newYear_max = "2020-12-31";
		} 
		return dao_payment.myPage_main_year(user_id, newYear_min, newYear_max);
	}
	
	public List<dto_payment> myOrder_review(String orderNumber) {
		return dao_payment.myOrder_review(orderNumber);
	}
	
}
