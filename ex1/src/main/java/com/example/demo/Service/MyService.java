package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_members;
import com.example.demo.dto.dto_members;

@Service
public class MyService implements IMyService {
	
	@Autowired
	IDao_members dao_member;

	@Override
	public List<dto_members> list() {
		return dao_member.listDao_member();
	}
	
	@Override
	public List<dto_members> login(String user_id, String user_pw) {
		List<dto_members> list = dao_member.login(user_id, user_pw);
		return list;
	}


}

