package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_myPage;
import com.example.demo.dto.dto_myPage;

@Service
public class Service_myPage {

	@Autowired
	IDao_myPage dao_myPage;
	
	/*  마이페이지  */
	/* 마이오더-리스트 */

	public List<dto_myPage> order_list_main(String user_id){
		return dao_myPage.myOrder(user_id);
	}
	
	public int countOrder(String user_id) {
		return dao_myPage.countOrder(user_id);
	}
	
	public List<dto_myPage> order_list(String user_id, int year, int page) {
		int newYear = year;
		String newYear_min;
		String newYear_max;
		if( year == 2018 ) {
			newYear_min = "2018-01-01";
			newYear_max = "2018-12-31";
		} else if( year == 2019) {
			newYear_min = "2019-01-01";
			newYear_max = "2019-12-31";
		} else if( year == 2020 ) {
			newYear_min = "2020-01-01";
			newYear_max = "2020-12-31";
		} else {
			if( page == 1 ) {
				return dao_myPage.myOrder(user_id);
			} else {
				int newPage = (page-1) * 10;
				return dao_myPage.manager_view_page_userId(user_id, newPage);
			}
		}
		if( page == 1 ) {
			return dao_myPage.manager_view_yearId(user_id, newYear_min, newYear_max);
		} else {
			int newPage = (page-1) * 10;
			return dao_myPage.manager_view_page_yearId(user_id, newYear_min, newYear_max, newPage);
		}
	}

	public List<dto_myPage> manager_view() {
		return dao_myPage.manager_view();
	}
	
	public List<dto_myPage> manager_view(int page) {
		if( page == 1 ) {
			return dao_myPage.manager_view();
		} else {
			int newPage = (page-1) * 10;
			return dao_myPage.manager_view_page(newPage);
		}
	}
	
	public List<dto_myPage> manager_view_year(int page, int year) {
		int newYear = year;
		String newYear_min;
		String newYear_max;
		if( year == 2018 ) {
			newYear_min = "2018-01-01";
			newYear_max = "2018-12-31";
		} else if( year == 2019) {
			newYear_min = "2019-01-01";
			newYear_max = "2019-12-31";
		} else if( year == 2020 ) {
			newYear_min = "2020-01-01";
			newYear_max = "2020-12-31";
		} else {
			if( page == 1 ) {
				return dao_myPage.manager_view();
			} else {
				int newPage = (page-1) * 10;
				return dao_myPage.manager_view_page(newPage);
			}
		}
		if( page == 1 ) {
			return dao_myPage.manager_view_year(newYear_min, newYear_max);
		} else {
			int newPage = (page-1) * 10;
			return dao_myPage.manager_view_page_year(newYear_min, newYear_max, newPage);
		}
	}
	
	public int manager_viewCount() {
		return dao_myPage.manager_viewCount();
	}
	
	public int manager_viewCount_year(int year) {
		int newYear = year;
		String newYear_min;
		String newYear_max;
		if( year == 2018 ) {
			newYear_min = "2018-01-01";
			newYear_max = "2018-12-31";
		} else if( year == 2019) {
			newYear_min = "2019-01-01";
			newYear_max = "2019-12-31";
		} else if( year == 2020 ) {
			newYear_min = "2020-01-01";
			newYear_max = "2020-12-31";
		} else {
			return dao_myPage.manager_viewCount();
		}
		return dao_myPage.manager_view_year_count(newYear_min, newYear_max);
	}
	
	public List<dto_myPage> myPoint(String user_id) {
		return dao_myPage.myPoint(user_id);
	}
	
	public List<dto_myPage> myOrder_review(int orderNumber) {
		return dao_myPage.myOrder_review(orderNumber);
	}
	
	
	
	
}
