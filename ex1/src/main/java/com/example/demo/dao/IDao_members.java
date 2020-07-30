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
	public List<dto_members> list_page_1();
	public List<dto_members> list_page_2( int nextCount );
	public int delete_member( String user_id );
	public int count_total();
	public int count_1();
	public int count_2();
	public int count_3();
	public int count_4();
	public int detail_search_count1( Map<String, String> map ); // 회원조건검색 카운트 - 등급지정시
	public int detail_search_count2( Map<String, String> map ); // 회원조건검색 카운트 - 등급없음
	public List<dto_members> detail_search1( Map<String, String> map ); // 최초회원조건검색 등급 지정시 - 첫페이지 10개씩만
	public List<dto_members> detail_search2( Map<String, String> map ); // 최초회원조건검색 등급 null 일때 - 첫페이지 10개씩만
	public List<dto_members> detail_search1_1( String date_min, String date_max, String buying_min, String buying_max, String grade, String point_min, String point_max ); // 최초회원조건에서 클릭 등급 지정시 - 첫 페이지 10개씩
	public List<dto_members> detail_search2_1( String date_min, String date_max, String buying_min, String buying_max, String grade, String point_min, String point_max ); // 최초회원조건에서 클릭 등급 null 일때 - 첫 페이지 10개씩
	public List<dto_members> detail_search1_page( String date_min, String date_max, String buying_min, String buying_max, String grade, String point_min, String point_max, int nextPage ); // 최초회원조건에서 클릭 등급 지정시 - 다음페이지 10개씩
	public List<dto_members> detail_search2_page( String date_min, String date_max, String buying_min, String buying_max, String grade, String point_min, String point_max, int nextPage ); // 최초회원조건에서 클릭 등급 null 일때 - 다음페이지 10개씩
	public List<dto_members> detail_search_name1( Map<String, String> map ); // 카테고리 user_name, 등급 null일때 - 첫페이지 10개
	public List<dto_members> detail_search_name2( Map<String, String> map ); // 카테고리 user_name, 등급 조건 추가 - 첫페이지 10개
	public List<dto_members> detail_search_id1( Map<String, String> map ); // 카테고리 user_id, 등급 null일때 - 첫페이지 10개
	public List<dto_members> detail_search_id2( Map<String, String> map ); // 카테고리 user_id, 등급 조건 추가 - 첫페이지 10개
	public List<dto_members> detail_search_phone1( Map<String, String> map ); // 카테고리 user_phone, 등급 null일때 - 첫페이지 10개
	public List<dto_members> detail_search_phone2( Map<String, String> map ); // 카테고리 user_phone, 등급 조건 추가 - 첫페이지 10개
	public List<dto_members> detail_search_birth1( Map<String, String> map ); // 카테고리 user_birth, 등급 null일때 - 첫페이지 10개
	public List<dto_members> detail_search_birth2( Map<String, String> map ); // 카테고리 user_birth, 등급 조건 추가 - 첫페이지 10개
	public int checkId( String user_id );
	public int checkEmail( String user_email );
	public List<dto_members> member_detail(String user_index);
	
	
		
}


