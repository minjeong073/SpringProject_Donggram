package com.ming.project.donggram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.donggram.post.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
}
