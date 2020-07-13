package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import com.example.demo.dto.dto_members;

public interface IMyService {
	
	public List<dto_members> list();
	public List<dto_members> login(String user_id, String user_pw);
	
}

