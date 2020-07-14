package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import com.example.demo.dto.dto_members;
import com.example.demo.dto.dto_noticeBoard;

public interface IMyService {
	
	public List<dto_members> login( Map<String, String> map );
	public int join_ok ( Map<String, String> map );
	
	public List<dto_noticeBoard> list1();
	public int count();
	
}

