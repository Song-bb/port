package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_payment;

@Mapper
public interface IDao_payment {

	public int addPayment1(Map<String, String> map);
	public int addPayment2(Map<String, String> map);
	public int addPayment3(Map<String, String> map);
	public int addPayment4(Map<String, String> map);
	public int addPayment5(Map<String, String> map);
	public List<dto_payment> view(String user_id);
	
}
