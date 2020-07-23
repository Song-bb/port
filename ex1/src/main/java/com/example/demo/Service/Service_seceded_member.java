package com.example.demo.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_seceded_member;

@Service
public class Service_seceded_member {

	@Autowired
	IDao_seceded_member dao_seded_member;
	
	public int leave_member( Map<String, String> map ) {
		int nResult = dao_seded_member.leave_member(map);
		return nResult;
	
	}
	
}
