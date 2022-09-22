package com.ming.project.donggram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.donggram.user.model.User;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("userId") int useId
			, @Param("postId") int postId);
	
	public int selectCountLike(@Param("postId") int postId);
	
	public int selectCountLikeByUserId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public User selectLikeUser(@Param("userId") int userId);
	
}
