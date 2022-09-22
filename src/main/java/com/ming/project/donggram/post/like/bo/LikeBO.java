package com.ming.project.donggram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.donggram.post.like.dao.LikeDAO;
import com.ming.project.donggram.user.model.User;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	// 게시글 별 좋아요 개수 얻는 기능
	public int getLikeCount(int postId) {
		return likeDAO.selectCountLike(postId);
	}
	
	// 특정 사용자가 특정 게시글에 좋아요 여부 확인 가능
	public boolean isLike(int userId, int postId) {
		return likeDAO.selectCountLikeByUserId(userId, postId) != 0;
	}
	
	
	
}
