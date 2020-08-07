package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_regular_order;

@Mapper
public interface IDao_regular_order {
	
	public List<dto_regular_order> regular_order_list(String user_id);
	public int regular_order_insert(Map<String, String> map);

}
