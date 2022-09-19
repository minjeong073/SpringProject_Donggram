package com.ming.project.donggram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.donggram.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
	
	public int selectCountLoginId(@Param("loginId") String loginId);
	
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("loginPw") String loginPw);
	
	public User selectUserId(
			@Param("name") String name
			, @Param("email") String email);
	
	public User selectUserById(@Param("id") int id);
	
}
