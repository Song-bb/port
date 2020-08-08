package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_regular_order;
import com.example.demo.dto.dto_regular_order;

@Service
public class Service_regular_order {
	
	@Autowired
	IDao_regular_order dao_regular_order;
	
	public List<dto_regular_order> detail_idx_read(String user_id){
		return dao_regular_order.regular_order_list(user_id);
	}
	
	public int regular_order_insert(Map<String, String> map) {
		int nInsertCount = dao_regular_order.regular_order_insert(map);
		return nInsertCount;
	}
	
	

}
