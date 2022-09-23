package com.ming.project.donggram.post.like.model;

import com.ming.project.donggram.user.model.User;

public class LikeDetail {

	private int likeCount;
	private boolean isLike;
	private Like like;
	private User user;

	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
