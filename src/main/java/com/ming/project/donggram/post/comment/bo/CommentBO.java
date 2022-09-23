package com.ming.project.donggram.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.donggram.post.comment.dao.CommentDAO;
import com.ming.project.donggram.post.comment.model.Comment;
import com.ming.project.donggram.post.comment.model.CommentDetail;
import com.ming.project.donggram.user.bo.UserBO;
import com.ming.project.donggram.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 댓글 달기
	public int addComment(int postId, int userId, String comment) {
		return commentDAO.insertComment(postId, userId, comment);
	}
	
	// 댓글 보기
	public List<CommentDetail> getCommentList(int postId) {
		
		List<Comment> commentList = commentDAO.selectCommentList(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for (Comment comment : commentList) {
			User commentUser = userBO.getUserById(comment.getUserId());
			
			CommentDetail commentDetail = new CommentDetail();

			commentDetail.setUser(commentUser);
			commentDetail.setComment(comment);
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
	}
	
	
}
