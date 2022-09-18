package com.ming.project.donggram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.donggram.common.EncryptUtils;
import com.ming.project.donggram.user.dao.UserDAO;
import com.ming.project.donggram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	// 회원 가입 정보를 user 테이블에 저장
	public int addUser(String loginId, String password, String name, String email) {
		
		// 암호화
		String encryptPassword = EncryptUtils.md5(password);
				
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	// 아이디 중복 확인
	public boolean checkDuplicateId(String loginId) {
		// count = 0 이면 중복 없음 -> return false
		return userDAO.selectCountLoginId(loginId) != 0;
	}
	
	// 로그인
	public User getUser(String loginId, String loginPw) {
		
		// 비밀번호 암호화 후 조회
		String encryptPassword = EncryptUtils.md5(loginPw);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	// 아이디 찾기
	public User getUserId(String name, String email) {
		return userDAO.selectUserId(name, email);
	}
}
