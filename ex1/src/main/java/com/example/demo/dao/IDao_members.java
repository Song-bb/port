package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_members;

@Mapper
public interface IDao_members {
	
	public List<dto_members> login_ok( String user_id );
	public int join_ok( Map<String, String> map );
	public List<dto_members> check_pw(String user_id, String user_pw);
	public List<dto_members> listDao();
	public int delete_member( String user_id );
	public int count_total();
	public int count_1();
	public int count_2();
	public int count_3();
	public int count_4();
	public List<dto_members> detail_search1( Map<String, String> map ); // 등급 지정시
	public List<dto_members> detail_search2( Map<String, String> map ); // 등급 null 일때
	public List<dto_members> detail_search3( Map<String, String> map ); // 이름으로 찾고, 등급 null일때
	public List<dto_members> detail_search4( Map<String, String> map ); // 이름으로 찾고, 등급 조건 추가
	public List<dto_members> detail_search5( Map<String, String> map ); // 카테고리 user_id, 등급 null일때
	public List<dto_members> detail_search6( Map<String, String> map ); // 카테고리 user_id, 등급 조건 추가
	public List<dto_members> detail_search7( Map<String, String> map ); // 카테고리 user_phone, 등급 null일때
	public List<dto_members> detail_search8( Map<String, String> map ); // 카테고리 user_phone, 등급 조건 추가
	public List<dto_members> detail_search9( Map<String, String> map ); // 카테고리 user_birth, 등급 null일때
	public List<dto_members> detail_search10( Map<String, String> map ); // 카테고리 user_birth, 등급 조건 추가

	
		
}


