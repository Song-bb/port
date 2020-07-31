package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import com.example.demo.dao.IDao_members;
import com.example.demo.dao.IDao_seceded_member;
import com.example.demo.dto.dto_seceded_member;

@Service
public class Service_seceded_member {

	@Autowired
	IDao_seceded_member dao_seded_member;
	@Autowired
	IDao_members dao_member;
	
	@Autowired
	PlatformTransactionManager transactionManager;
	@Autowired
	TransactionDefinition definition;
	
	public int leave_member( Map<String, String> map ) {
		
		TransactionStatus status = transactionManager.getTransaction(definition);
	
		try {
			dao_seded_member.leave_member(map);
			dao_member.delete_member( map.get("user_id") );
			
			transactionManager.commit(status);
			return 1;
		} catch(Exception e) {
			transactionManager.rollback(status);
			return 0;
		}
	}
	
	public List<dto_seceded_member> list(){
		return dao_seded_member.list();
	}
	
	public int count() {
		return dao_seded_member.count();
	}
	
	
	
	
}
