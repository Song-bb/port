package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_banner;

@Mapper
public interface IDao_banner {
	
	//메인 배너 리스트
	public List<dto_banner> banner_listDao();
	
	//게시물 생성
	public int banner_writeDao(Map<String, String> map);
	//게시물 수정
	public List<dto_banner> banner_updateDao(String banner_index);
	//게시물 수정확인
	public int banner_updateokDao(Map<String, String> map);
	//게시물 삭제
	public int banner_deleteDao(String banner_index);
	

}
