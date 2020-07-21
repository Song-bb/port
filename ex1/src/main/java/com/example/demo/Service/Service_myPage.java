package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_myPage;
import com.example.demo.dto.dto_myPage;

@Service
public class Service_myPage {

	@Autowired
	IDao_myPage dao_myPage;
	
	/*  마이페이지  */
	/* 마이오더-리스트 */

	public List<dto_myPage> order_list(String user_id) {
		return dao_myPage.myOrder(user_id);
	}
	
	
	
	
	
}
