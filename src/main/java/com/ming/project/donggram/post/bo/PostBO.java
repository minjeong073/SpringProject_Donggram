package com.ming.project.donggram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ming.project.donggram.common.FileManagerService;
import com.ming.project.donggram.post.comment.bo.CommentBO;
import com.ming.project.donggram.post.comment.model.Comment;
import com.ming.project.donggram.post.comment.model.CommentDetail;
import com.ming.project.donggram.post.dao.PostDAO;
import com.ming.project.donggram.post.like.bo.LikeBO;
import com.ming.project.donggram.post.model.Post;
import com.ming.project.donggram.post.model.PostDetail;
import com.ming.project.donggram.user.bo.UserBO;
import com.ming.project.donggram.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;

	// 게시물 작성
	public int addPost(int userId, String content, MultipartFile file) {
		
		// file 을 서버에 저장하고 접근 경로를 dao 에 전달
		String imagePath = null;
		
		// file 이 있으면 경로 설정
		if (file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			
			// null 일 경우 insert 하면 안됨
			if (imagePath == null) {
				return -1;
			}
		}
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	// 타임라인 게시물 불러오기
	// + Controller 에서 loginUserId 를 전달 받도록!!
	public List<PostDetail> getPostList(int loginUserId) {
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for (Post post : postList) {
			
			int userId = post.getUserId();
			int postId = post.getId();
			
			// 조회한 post 와 user 가 하나의 묶음이 되어서 저장 리턴 되어야 함
			PostDetail postDetail = new PostDetail();

			
			// userId 로 User 테이블 조회해서 사용자 정보 가져오기 (게시물 작성자 정보)
			// -> userBO 를 통해
			User user = userBO.getUserById(userId);
			
			// + postId 로 like 개수 가져오기
			int likeCount = likeBO.getLikeCount(postId);
			
			// + postId, userId 로 like 정보 가져오기
			// userId 는 param 으로 받아옴
			boolean isLike = likeBO.isLike(loginUserId, postId);
			
			
			postDetail.setPost(post);
			postDetail.setUser(user);
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			
			// + postId 로 Comment 테이블 조회해서 댓글, 댓글 작성자 정보 가져오기
			
			List<CommentDetail> commentDetailList = new ArrayList<>();
			List<Comment> commentList = commentBO.getCommentList(postId);
			
			// 댓글에 해당하는 작성자 정보 하나씩 가져오기
			for(Comment comment : commentList) {
				int commentUserId = comment.getUserId();
				User commentUser = userBO.getUserById(commentUserId);
				CommentDetail commentDetail = new CommentDetail();

				commentDetail.setUser(commentUser);
				commentDetail.setComment(comment);
				commentDetailList.add(commentDetail);
			}
			postDetail.setCommentDetailList(commentDetailList);
			
			// 최종 list 에 넣기
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	// 게시물 보기
	public Post getPostById(int id) {
		return postDAO.selectPostById(id);
	}
	
	// 게시물 삭제
	
	
}
