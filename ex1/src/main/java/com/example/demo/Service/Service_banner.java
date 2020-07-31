package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_banner;
import com.example.demo.dto.dto_banner;

@Service
public class Service_banner {

	@Autowired
	IDao_banner dao_banner;
	
	//배너 리스트
	public List<dto_banner> banner_list() {
		return dao_banner.banner_listDao();
	}
	
	//배너 생성
	public int banner_write(Map<String, String> map) {
		int nResult = dao_banner.banner_writeDao(map);
		return nResult;
	}
	
	//배너 수정
	public List<dto_banner> banner_update(String banner_index){
		return dao_banner.banner_updateDao(banner_index);
	}
	
	//배너 수정확인
	public int banner_updateok(Map<String, String> map){
		int nResult = dao_banner.banner_updateokDao(map);
		return nResult;
	}
	
	//배너 삭제
	public int banner_delete (String banner_index) {
		int nResult = dao_banner.banner_deleteDao(banner_index);
		return nResult;
	}
	
	
}
