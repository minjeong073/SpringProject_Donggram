package com.ming.project.donggram.post.model;

import java.util.List;

import com.ming.project.donggram.post.comment.model.CommentDetail;
import com.ming.project.donggram.post.like.model.LikeDetail;
import com.ming.project.donggram.user.model.User;

public class PostDetail {

	private Post post;
	private User user;
	private List<CommentDetail> commentDetailList;
	private int likeCount;
	private boolean isLike;
	private List<LikeDetail> likeDetailList;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<CommentDetail> getCommentDetailList() {
		return commentDetailList;
	}
	public void setCommentDetailList(List<CommentDetail> commentDetailList) {
		this.commentDetailList = commentDetailList;
	}
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
	public List<LikeDetail> getLikeDetailList() {
		return likeDetailList;
	}
	public void setLikeDetailList(List<LikeDetail> likeDetailList) {
		this.likeDetailList = likeDetailList;
	}
	
	
}
