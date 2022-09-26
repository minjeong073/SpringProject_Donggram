package com.ming.project.donggram.post.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.donggram.post.like.model.Like;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("userId") int useId
			, @Param("postId") int postId);
	
	public int deleteLike(
			@Param("userId") int uesrId
			, @Param("postId") int postId);
	
	public int selectCountLike(@Param("postId") int postId);

	public int selectCountLikeByUserId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public List<Like> selectLikeList(@Param("postId") int postId);
	
	public int deleteLikeByPostId(@Param("postId") int postId);
}
