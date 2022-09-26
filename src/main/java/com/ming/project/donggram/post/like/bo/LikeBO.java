package com.ming.project.donggram.post.like.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.donggram.post.like.dao.LikeDAO;
import com.ming.project.donggram.post.like.model.Like;
import com.ming.project.donggram.post.like.model.LikeDetail;
import com.ming.project.donggram.user.bo.UserBO;
import com.ming.project.donggram.user.model.User;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 게시글 좋아요 저장
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	// 좋아요 취소
	public int deleteLike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
	
	// 게시글 별 좋아요 개수 얻는 기능
	public int getLikeCount(int postId) {
		return likeDAO.selectCountLike(postId);
	}
	
	// 특정 사용자가 특정 게시글에 좋아요 여부 확인 가능
	public boolean isLike(int userId, int postId) {
		return likeDAO.selectCountLikeByUserId(userId, postId) != 0;
	}
	
	
	// + 좋아요 누른 사용자 정보 같이 가져오기
	public List<LikeDetail> getLikeDetailList(int postId) {
		
		List<LikeDetail> likeDetailList = new ArrayList<>();
		
		for(Like like : likeDAO.selectLikeList(postId)) {
			User likeUser = userBO.getUserById(like.getUserId());
			
			LikeDetail likeDetail = new LikeDetail();
			
			likeDetail.setUser(likeUser);
			likeDetail.setLike(like);
			
			likeDetailList.add(likeDetail);
		}
		
		return likeDetailList;
	}

	// 해당 게시물의 좋아요 삭제
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}
	
}
