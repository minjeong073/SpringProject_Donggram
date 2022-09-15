package com.ming.project.donggram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ming.project.donggram.common.FileManagerService;
import com.ming.project.donggram.post.dao.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;

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
	
}
