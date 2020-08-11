package com.example.demo.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_payment;

@Service
public class Service_payment {
	
	@Autowired
	IDao_payment dao_payment;


	
}
