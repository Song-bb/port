package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_banner_img;
import com.example.demo.dto.dto_banner_img;

@Service
public class Service_banner_img {

	@Autowired
	IDao_banner_img dao_banner;
	
	
	/*  배너 이미지 관련  */
	public dto_banner_img viewBanner() {
		return dao_banner.viewDao();
	}
	
	
	
}
