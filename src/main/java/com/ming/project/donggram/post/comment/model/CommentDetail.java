package com.ming.project.donggram.post.comment.model;

import com.ming.project.donggram.user.model.User;

public class CommentDetail {

	private Comment comment;
	private User user;
	
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
