package com.ming.project.donggram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ming.project.donggram.post.bo.PostBO;
import com.ming.project.donggram.post.comment.bo.CommentBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	// 게시물 작성 기능
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest req) {
		
		Map<String, String> result = new HashMap<>();
		
		HttpSession session = req.getSession();
		 
		int userId = (Integer) session.getAttribute("userId");
		
		int count = postBO.addPost(userId, content, file);
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 게시물 수정
	@PostMapping("/detail/update")
	public Map<String, String> updatePost(
			@RequestParam("postId") int postId
			, @RequestParam("content") String content) {
			// , @RequestParam("file") MultipartFile file) {
		// file 수정할 경우 ?
		// file 수정 없이 글만 수정할 경우 ?
		
		int count = postBO.updatePost(postId, content);
		
		Map<String, String> result = new HashMap<>();
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 게시물 삭제
	@GetMapping("/delete")
	public Map<String, String> deletePost(
			@RequestParam("postId") int postId
			, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		int count = postBO.deletePost(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
