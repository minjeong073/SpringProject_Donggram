package com.ming.project.donggram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.donggram.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	// 회원 가입 정보를 user 테이블에 저장
	public int addUser(String loginId, String password, String name, String email) {
		return userDAO.insertUser(loginId, password, name, email);
	}
	
	// 아이디 중복 확인
	public boolean checkDuplicateId(String loginId) {
		// count = 0 이면 중복 없음 -> return false
		return userDAO.selectCountLoginId(loginId) != 0;
	}
	
}
