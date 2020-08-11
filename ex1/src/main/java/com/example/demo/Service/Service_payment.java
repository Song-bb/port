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
			} else if( count < 3 ) {
				dao_payment.addPayment2(map);
			} else if( count < 4 ) {
				dao_payment.addPayment3(map);
			} else if( count < 5 ) {
				dao_payment.addPayment4(map);
			} else {
				dao_payment.addPayment5(map);
			}
			
			dao_myPage.editPoint(user_id, order_number, item_name, total_price, used_point, result_point);
			
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
	
}
