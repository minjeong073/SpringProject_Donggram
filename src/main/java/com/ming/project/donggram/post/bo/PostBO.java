package com.ming.project.donggram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ming.project.donggram.common.FileManagerService;
import com.ming.project.donggram.post.dao.PostDAO;
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
	public List<PostDetail> getPostList() {
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for (Post post : postList) {
			int userId = post.getUserId();
			
			// userId 로 User 테이블 조회해서 사용자 정보 가져오기
			// -> userBO 를 통해
			User user = userBO.getUserById(userId);
			
			// 조회한 post 와 user 가 하나의 묶음이 되어서 저장 리턴 되어야 함
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	// 게시물 보기
	public Post getPostById(int id) {
		return postDAO.selectPostById(id);
	}
}
