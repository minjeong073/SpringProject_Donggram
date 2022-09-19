package com.ming.project.donggram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.donggram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);

	public List<Object> selectPostUser(
			@Param("userId") int userId);
	
	public Post selectPostById(
			@Param("id") int id);
	
	public List<Post> selectPostList();
}
