package com.ming.project.donggram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.donggram.post.comment.model.Comment;
import com.ming.project.donggram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);

	public List<Object> selectPostUser(
			@Param("userId") int userId);
	
	public Post selectPostById(@Param("postId") int postId);
	
	public Post selectPostByIdAndUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public List<Post> selectPostList();
	
	public int updatePost(
			@Param("postId") int postId
			, @Param("content") String content);
			// , @Param("imagePath") String imagePath);
	
	public int deletePost(@Param("postId") int postId);
}
