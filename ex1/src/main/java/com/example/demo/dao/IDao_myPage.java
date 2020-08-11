package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_myPage;
import com.example.demo.dto.dto_user_point;

@Mapper
public interface IDao_myPage {
	
	public List<dto_myPage> myOrder(String user_id);
	public int countOrder(String user_id);
	public List<dto_myPage> manager_view();
	public List<dto_myPage> manager_view_page(int page);
	public List<dto_myPage> manager_view_year(String newYear_min, String newYear_max);
	public List<dto_myPage> manager_view_page_year(String newYear_min, String newYear_max, int page);
	public int manager_viewCount();
	public int manager_view_year_count(String newYear_min, String newYear_max);
	public List<dto_myPage> manager_view_page_userId(String user_id, int newPage);
	public List<dto_myPage> manager_view_yearId(String user_id, String newYear_min, String newYear_max);
	public List<dto_myPage> manager_view_page_yearId(String user_id, String newYear_min, String newYear_max, int page);
	public List<dto_myPage> myOrder_review(String orderNumber);
	public List<dto_user_point> pointList(String user_id);
	public List<dto_myPage> orderDetail(String orderNumber);
	public int editPoint(String user_id, String order_number, String item_name, String total_price, String used_point, String result_point);
	
	
}
