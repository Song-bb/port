package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_banner_img;

@Mapper
public interface IDao_banner_img {

	public dto_banner_img viewDao();
	
}
