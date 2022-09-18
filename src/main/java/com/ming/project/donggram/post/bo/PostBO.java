package com.ming.project.donggram.post.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
	
	// 타임라인 게시물 불러오기
	public List<Map<String, Object>> getPostUser(int userId) {
		
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = new ArrayList<>();

		List<Object> obj = postDAO.selectPostUser(userId);
		Iterator<Object> iter = obj.iterator();
		
		while(iter.hasNext()) {
			map.put("id", obj.get(0));
			map.put("imagePath", obj.get(1));
			map.put("contents", obj.get(2));
			map.put("userId", obj.get(3));
			map.put("name", obj.get(4));
			list.add(map);
		}
		
		
		return list;
	}
	
}
