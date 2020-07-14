package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_members;
import com.example.demo.dto.dto_members;

@Service
public class MyService implements IMyService {
	
	@Autowired
	IDao_members dao_member;
	
	@Override
	public List<dto_members> login( Map<String, String> map ) {
		List<dto_members> list = dao_member.login_ok( map );
		return list;
	}

	@Override
	public int join_ok(Map<String, String> map) {
		int nResult = dao_member.join_ok(map);
		return nResult;
	}


}

