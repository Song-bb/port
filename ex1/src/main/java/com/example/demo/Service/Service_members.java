package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_members;
import com.example.demo.dto.dto_members;

@Service
public class Service_members {

	@Autowired
	IDao_members dao_member;
	
	/* 로그인 */
	public List<dto_members> login( String user_id, String user_pw ) {
		return dao_member.login_ok( user_id, user_pw );
	}
	
	/* 회원가입 */
	public int join_ok(Map<String, String> map) {
		int nResult = dao_member.join_ok(map);
		return nResult;
	}
	
	/* 비밀번호재확인 */
	public List<dto_members> check_pw(String user_id, String user_pw) {
		return dao_member.check_pw( user_id, user_pw );
	}
	
}
