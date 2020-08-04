package com.example.demo.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_review;

@Service
public class Service_review {

	@Autowired
	IDao_review dao_review;
	
	public int addReview( Map<String, String> map ) {
		return dao_review.addReview(map);
	}
	
}
