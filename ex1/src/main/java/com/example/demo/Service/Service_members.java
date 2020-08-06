package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import com.example.demo.dao.IDao_members;
import com.example.demo.dto.dto_members;

@Service
public class Service_members {

	@Autowired
	IDao_members dao_member;

	@Autowired
	PlatformTransactionManager transactionManager;
	@Autowired
	TransactionDefinition definition;
	
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
	public List<dto_members> list_page_2( String nextPage ) {
		int nextCount = (Integer.parseInt(nextPage) - 1) * 10;
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
	public List<dto_members> detail_search( Map<String, String> map, int page ){
		if( map.get("grade").toString().equals("null")) {
			return dao_member.detail_search2(map); // 등급 null 일때
		} else {
			return dao_member.detail_search1(map); // 등급 지정시
		}
	}
	
	/* 회원 조건검색 - 다음페이지 */
	public List<dto_members> detail_search2( Map<String, String> map, int page ){
		String date_min = map.get("date_min").toString();
		String date_max = map.get("date_max").toString();
		String buying_min = map.get("buying_min").toString();
		String buying_max = map.get("buying_max").toString();
		String grade = map.get("grade").toString();
		String point_min = map.get("point_min").toString();
		String point_max = map.get("point_max").toString();
		if( page == 1) { // 첫페이지
			if( map.get("grade").toString().equals("null")) {
				return dao_member.detail_search2_1(date_min, date_max, buying_min, buying_max, grade, point_min, point_max); // 등급 null 일때
			} else {
				return dao_member.detail_search1_1(date_min, date_max, buying_min, buying_max, grade, point_min, point_max); // 등급 지정시
			}
		} else { // 다음페이지
			int nextCount = (page - 1) * 10;
			if( map.get("grade").toString().equals("null")) {
				return dao_member.detail_search2_page( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, nextCount ); // 등급 null 일때
			} else {
				return dao_member.detail_search1_page( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, nextCount ); // 등급 지정시
			}
		}
	}
	
	/* 회원 조건검색 카운트 */
	public int detail_search_count1( Map<String, String> map ) {
		if( map.get("grade").toString().equals("null")) {
			return dao_member.detail_search_count2( map ); // 등급 null 일때
		} else {
			return dao_member.detail_search_count1( map ); // 등급 지정시
		}
	}
	
	/* 회원 조건검색 + 검색어 추가 - 첫페이지 */
	public List<dto_members> member_search( Map<String, String> map ) {
		if( map.get("search_text").toString().equals("null")) { // 검색어 없으면 검색X, 회원조건검색 그대로 출력
			if( map.get("grade").toString().equals("null")) {
				return dao_member.detail_search2(map); // 등급 null 일때
			} else {
				return dao_member.detail_search1(map); // 등급 지정시
			}
		} else { // 검색어 있으면 카테고리 확인, 없으면 user_name 이 default
			if(map.get("member_categori").toString().equals("null") || map.get("member_categori").toString().equals("user_name") ){
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_name, 등급 null일때 - 첫페이지 10개
					return dao_member.detail_search_name1( map );
				} else { // 카테고리 user_name, 등급 조건 추가 - 첫페이지 10개
					return dao_member.detail_search_name2( map );
				}
			} else if( map.get("member_categori").toString().equals("user_id") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_id, 등급 null일때 - 첫페이지 10개
					return dao_member.detail_search_id1( map );
				} else { // 카테고리 user_id, 등급 조건 추가 - 첫페이지 10개
					return dao_member.detail_search_id2( map );
				}
			} else if( map.get("member_categori").toString().equals("user_phone") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_phone, 등급 null일때 - 첫페이지 10개
					return dao_member.detail_search_phone1( map );
				} else { // 카테고리 user_phone, 등급 조건 추가 - 첫페이지 10개
					return dao_member.detail_search_phone2( map );
				}
			} else if( map.get("member_categori").toString().equals("user_birth") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_birth, 등급 null일때 - 첫페이지 10개
					return dao_member.detail_search_birth1( map );
				} else { // 카테고리 user_birth, 등급 조건 추가 - 첫페이지 10개
					return dao_member.detail_search_birth2( map );
				}
			} else {
				return dao_member.detail_search2(map);
			}
		}
	}
	
	/* 회원 조건검색 + 검색어 추가 - 다음페이지 */
	public List<dto_members> member_search_next( int page, Map<String, String> map ) {
		String date_min = map.get("date_min").toString();
		String date_max = map.get("date_max").toString();
		String buying_min = map.get("buying_min").toString();
		String buying_max = map.get("buying_max").toString();
		String grade = map.get("grade").toString();
		String point_min = map.get("point_min").toString();
		String point_max = map.get("point_max").toString();
		String member_categori = map.get("member_categori").toString();
		String search_text = map.get("search_text").toString();
		int nextCount = (page - 1) * 10;
		if( search_text.equals("null")) { // 검색어 없으면 검색X, 회원조건검색 그대로 출력
			if( page == 1) { // 첫페이지
				if( grade.equals("null")) {
					return dao_member.detail_search2_1(date_min, date_max, buying_min, buying_max, grade, point_min, point_max); // 등급 null 일때
				} else {
					return dao_member.detail_search1_1(date_min, date_max, buying_min, buying_max, grade, point_min, point_max); // 등급 지정시
				}
			} else { // 다음페이지
				if( grade.equals("null")) {
					return dao_member.detail_search2_page( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, nextCount ); // 등급 null 일때
				} else {
					return dao_member.detail_search1_page( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, nextCount ); // 등급 지정시
				}
			}
		} else { // 검색어 있으면 카테고리 확인, 없으면 user_name 이 default
			if(member_categori.equals("null") || member_categori.equals("user_name") ){
				if( grade.equals("null") ) { 
					if( page == 1 ) { // 카테고리 user_name, 등급 null일때 - 첫페이지 10개
						return dao_member.detail_search_name1_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					} else { // 카테고리 user_name, 등급 null일때 - 다음페이지 10개
						return dao_member.detail_search_name1_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				} else { 
					if( page == 1 ) { // 카테고리 user_name, 등급 조건 추가 - 첫페이지 10개
						return dao_member.detail_search_name2_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					} else { // 카테고리 user_name, 등급 조건 추가 - 다음페이지 10개
						return dao_member.detail_search_name2_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				}
			} else if( member_categori.equals("user_id") ) { 
				if( grade.equals("null") ) { 
					if( page == 1 ) { // 카테고리 user_id, 등급 null일때 - 첫페이지 10개
						return dao_member.detail_search_id1_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					} else { // 카테고리 user_id, 등급 null일때 - 다음페이지 10개
						return dao_member.detail_search_id1_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				} else { 
					if( page == 1 ) { // 카테고리 user_id, 등급 조건 추가 - 첫페이지 10개
						return dao_member.detail_search_id2_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					}else { // 카테고리 user_id, 등급 조건 추가 - 다음페이지 10개
						return dao_member.detail_search_id2_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				}
			} else if( member_categori.equals("user_phone") ) { 
				if( grade.equals("null") ) { 
					if( page == 1 ) { // 카테고리 user_phone, 등급 null일때 - 첫페이지 10개
						return dao_member.detail_search_phone1_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					} else { // // 카테고리 user_phone, 등급 null일때 - 다음페이지 10개
						return dao_member.detail_search_phone1_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				} else { 
					if( page == 1 ) { // 카테고리 user_phone, 등급 조건 추가 - 첫페이지 10개
						return dao_member.detail_search_phone2_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					} else { // 카테고리 user_phone, 등급 조건 추가 - 다음페이지 10개
						return dao_member.detail_search_phone2_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				}
			} else if( member_categori.equals("user_birth") ) { 
				if( grade.toString().equals("null") ) { 
					if( page == 1 ) { // 카테고리 user_birth, 등급 null일때 - 첫페이지 10개
						return dao_member.detail_search_birth1_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					} else { // 카테고리 user_birth, 등급 null일때 - 다음페이지 10개
						return dao_member.detail_search_birth1_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				} else { 
					if( page == 1 ) { // 카테고리 user_birth, 등급 조건 추가 - 첫페이지 10개
						return dao_member.detail_search_birth2_next1( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text );
					} else { // 카테고리 user_birth, 등급 조건 추가 - 다음페이지 10개
						return dao_member.detail_search_birth2_next2( date_min, date_max, buying_min, buying_max, grade, point_min, point_max, member_categori, search_text , nextCount );
					}
				}
			} else {
				return dao_member.detail_search2_1(date_min, date_max, buying_min, buying_max, grade, point_min, point_max);
			}
		}
	}
	
	/* 회원 조건 + 검색어 검색 카운트 */
	public int detail_search_count3( Map<String, String> map ) {
		if( map.get("search_text").toString().equals("null")) { // 검색어 없으면 검색X, 회원조건검색 그대로 출력
			if( map.get("grade").toString().equals("null")) {
				return dao_member.detail_search_count2( map ); // 등급 null 일때
			} else {
				return dao_member.detail_search_count1( map ); // 등급 지정시
			}
		} else { // 검색어 있으면 카테고리 확인, 없으면 user_name 이 default
			if(map.get("member_categori").toString().equals("null") || map.get("member_categori").toString().equals("user_name") ){
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_name, 등급 null일때
					return dao_member.detail_search_name_count1( map );
				} else { // 카테고리 user_name, 등급 조건 추가
					return dao_member.detail_search_name_count2( map );
				}
			} else if( map.get("member_categori").toString().equals("user_id") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_id, 등급 null일때
					return dao_member.detail_search_id_count1( map );
				} else { // 카테고리 user_id, 등급 조건 추가
					return dao_member.detail_search_id_count2( map );
				}
			} else if( map.get("member_categori").toString().equals("user_phone") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_phone, 등급 null일때
					return dao_member.detail_search_phone_count1( map );
				} else { // 카테고리 user_phone, 등급 조건 추가
					return dao_member.detail_search_phone_count2( map );
				}
			} else if( map.get("member_categori").toString().equals("user_birth") ) { 
				if( map.get("grade").toString().equals("null") ) { // 카테고리 user_birth, 등급 null일때
					return dao_member.detail_search_birth_count1( map );
				} else { // 카테고리 user_birth, 등급 조건 추가
					return dao_member.detail_search_birth_count2( map );
				}
			} else {
				return dao_member.detail_search_count2( map );
			}
		}
	}

	/* 회원 상세보기 */
	public List<dto_members> member_detail(String user_index) {
		return dao_member.member_detail( user_index );
	}
	
	/* 회원 적립금 추가/삭제 */
	public int update_point( String member_index, String point ) {
		return dao_member.update_point(member_index, point);
	}
	
	/* 회원 등급 변경 */
	public int update_grade( String member_index, String grade ) {
		return dao_member.update_grade(member_index, grade);
	}
	
	public List<dto_members> memberDetail(String user_id){
		return dao_member.memberDetail(user_id);
	}
	
	/* 회원정보수정 */
	public int updateMember( Map<String, String> map ) {
		TransactionStatus status = transactionManager.getTransaction(definition);
		String user_id = map.get("user_id").toString();
		try {
			if( !(map.get("user_pw").equals("null")) ) { // 비밀번호 변경
				String user_pw = map.get("user_pw").toString();
				dao_member.update_userId(user_id, user_pw);
			}
			if( !(map.get("user_email").equals("null")) ) { // 이메일 변경
				String user_email = map.get("user_email").toString();
				dao_member.update_userEmail(user_id, user_email);
			}
			if( !(map.get("user_name").equals("null")) ) { // 이름 변경
				String user_name = map.get("user_name").toString();
				dao_member.update_userName(user_id, user_name);
			}
			if( !(map.get("phone").equals("null")) ) { // 폰번호 변경
				String phone = map.get("phone").toString();
				dao_member.update_userPhone(user_id, phone);
			}
			if( !(map.get("postcode").equals("null")) ) { // 우편번호 변경
				String postcode = map.get("postcode").toString();
				dao_member.update_userPostcode(user_id, postcode);
			}
			if( !(map.get("address").equals("")) ) { // 주소 변경
				String address = map.get("address").toString();
				dao_member.update_userAddress(user_id, address);
			}
			if( !(map.get("user_gender").equals("null")) ) { // 성별 변경
				String user_gender = map.get("user_gender").toString();
				dao_member.update_userGender(user_id, user_gender);
			}
			if( !(map.get("user_birth").equals("null")) ) { // 생일 변경
				String user_birth = map.get("user_birth").toString();
				dao_member.update_userBirth(user_id, user_birth);
			}
			transactionManager.commit(status);
			return 1;
		} catch(Exception e) {
			transactionManager.rollback(status);
			return 0;
		}
	}
	
	
	

	
}
