package com.ming.project.donggram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.donggram.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("comment") String comment);
	
	public List<Comment> selectCommentList(@Param("postId") int postId);
	
}
