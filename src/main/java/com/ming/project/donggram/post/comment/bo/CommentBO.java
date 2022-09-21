package com.ming.project.donggram.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.donggram.post.comment.dao.CommentDAO;
import com.ming.project.donggram.post.comment.model.Comment;
import com.ming.project.donggram.post.comment.model.CommentDetail;
import com.ming.project.donggram.post.dao.PostDAO;
import com.ming.project.donggram.user.bo.UserBO;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	// 댓글 달기
	public int addComment(int postId, int userId, String comment) {
		return commentDAO.insertComment(postId, userId, comment);
	}
	
	// 댓글 개수
	public int countComment(int postId) {
		return commentDAO.countComment(postId);
	}
	
	// 댓글 보기
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectComment(postId);
	}
	
	
}
