package com.ming.project.donggram.post.like.model;

import com.ming.project.donggram.user.model.User;

public class LikeDetail {

	private Like like;
	private User user;
	
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
