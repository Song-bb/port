package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_members;
import com.example.demo.dto.dto_members;

@Service
public class Service_members {

	@Autowired
	IDao_members dao_member;

	
	/* 로그인 */
	public List<dto_members> login( String user_id ) {
		return dao_member.login_ok( user_id );
	}
	
	/* 회원가입-아이디 중복확인 */
	public int checkId(String user_id) {
		return dao_member.checkId( user_id );
	}
	
	/* 회원가입-이메일 중복확인 */
	public int checkEmail(String user_email) {
		return dao_member.checkEmail( user_email );
	}
	
	/* 회원가입 */
	public int join_ok(Map<String, String> map) {
		int nResult = dao_member.join_ok(map);
		return nResult;
	}
	
	/* 비밀번호재확인 */
	public List<dto_members> check_pw(String user_id, String user_pw) {
		return dao_member.check_pw( user_id, user_pw );
	}
	
	/* 멤버 리스트 */
	public List<dto_members> member_list() {
		return dao_member.listDao();
	}
	
	/* 멤버 리스트 - 페이지1 */
	public List<dto_members> list_page_1() {
		return dao_member.list_page_1();
	}
	
	/* 멤버 리스트 - 페이지2 */
	public List<dto_members> list_page_2( int nextPage ) {
		int nextCount = nextPage * 10;
		return dao_member.list_page_2( nextCount );
	}
	
	/* 멤버 총인원 카운트 */
	public int count_total() {
		int nTotalCount = dao_member.count_total();
		return nTotalCount;
	}
	/* 앵두등급 카운트 */
	public int count_1() {
		int nCount = dao_member.count_1();
		return nCount;
	}
	/* 자두등급 카운트 */
	public int count_2() {
		int nCount = dao_member.count_2();
		return nCount;
	}
	/* 복숭아등급 카운트 */
	public int count_3() {
		int nCount = dao_member.count_3();
		return nCount;
	}
	/* 과일매니저 카운트 */
	public int count_4() {
		int nCount = dao_member.count_4();
		return nCount;
	}
	
	/* 회원 조건검색 */
	public List<dto_members> detail_search( Map<String, String> map ){
		if( map.get("grade").toString().equals("null")) {
			return dao_member.detail_search2( map ); // 등급 null 일때
		} else {
			return dao_member.detail_search1( map ); // 등급 지정시
		}
	}
	
	/* 회원 조건검색 + 검색어 추가 */
	public List<dto_members> member_search( Map<String, String> map ) {
		if( map.get("search_text").toString().equals("null")) { // 검색어 없으면 검색X, 회원조건검색 그대로 출력
			if( map.get("grade").toString().equals("null")) {
				return dao_member.detail_search2( map );
			} else {
				return dao_member.detail_search1( map );
			}
		} else { // 검색어 있으면
			if(map.get("member_categori").toString().equals("null") || map.get("member_categori").toString().equals("user_name") ){ // 카테고리 지정 되었는지 확인, 지정 없으면 이름이 default
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_name, 등급 null일때
					return dao_member.detail_search3( map );
				} else { // 카테고리 user_name, 등급 조건 추가
					return dao_member.detail_search4( map );
				}
			} else if( map.get("member_categori").toString().equals("user_id") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_id, 등급 null일때
					return dao_member.detail_search5( map );
				} else { // 카테고리 user_id, 등급 조건 추가
					return dao_member.detail_search6( map );
				}
			} else if( map.get("member_categori").toString().equals("user_phone") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_phone, 등급 null일때
					return dao_member.detail_search7( map );
				} else { // 카테고리 user_phone, 등급 조건 추가
					return dao_member.detail_search8( map );
				}
			} else if( map.get("member_categori").toString().equals("user_birth") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_birth, 등급 null일때
					return dao_member.detail_search9( map );
				} else { // 카테고리 user_birth, 등급 조건 추가
					return dao_member.detail_search10( map );
				}
			} else {
				return dao_member.detail_search1( map );
			}
		}
	}

	/* 회원 상세보기 */
	public List<dto_members> member_detail(String user_index) {
		return dao_member.member_detail( user_index );
	}

	
	

	
}
