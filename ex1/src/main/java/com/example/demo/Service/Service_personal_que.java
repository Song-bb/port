package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_personal_question;
import com.example.demo.dto.dto_personal_question;

@Service
public class Service_personal_que {

	@Autowired
	IDao_personal_question dao_personal_que;
	
	
	/*  1:1 문의  */
	/* 글쓰기 */
	public int personal_write_ok(Map<String, String> map) {
		int nResult = dao_personal_que.personal_write_ok(map);
		return nResult;
	}
	
	// 글목록
	public List<dto_personal_question> list(String user_id){
		return dao_personal_que.listDao(user_id);
	}
	
	// 해당 유저가 작성한 글 수
	public int countlist( String user_id ) {
		return dao_personal_que.countDao(user_id);
	}

	
	
	
	
	
	
	
	
}
