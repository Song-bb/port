package com.example.demo.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IDao_seceded_member {

	public int leave_member( Map<String, String> map );
	
}
