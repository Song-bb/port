package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_seceded_member;

@Mapper
public interface IDao_seceded_member {

	public int leave_member( Map<String, String> map );
	public List<dto_seceded_member> list();
	
}
