package com.ming.project.donggram.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ming.project.donggram.post.comment.bo.CommentBO;

@RestController
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	// 댓글 작성
	@PostMapping("/post/comment/create")
	public Map<String, String> addComment(
			@RequestParam("postId") int postId
			, @RequestParam("comment") String comment
			, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		int count = commentBO.addComment(postId, userId, comment);
		
		Map<String, String> result = new HashMap<>();
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
