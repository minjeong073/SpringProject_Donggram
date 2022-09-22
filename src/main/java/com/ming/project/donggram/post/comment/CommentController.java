package com.ming.project.donggram.post.comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.donggram.post.bo.PostBO;
import com.ming.project.donggram.post.comment.bo.CommentBO;
import com.ming.project.donggram.post.comment.model.Comment;
import com.ming.project.donggram.post.model.PostDetail;

@Controller
public class CommentController {

	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private PostBO postBO;
	
	// 댓글 창 보기
	@GetMapping("/post/detail/comment/view")
	public String commentView(
			@RequestParam("postId") int postId
			, Model model
			, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		int userId = (Integer) session.getAttribute("userId");

		List<PostDetail> postDetailList = postBO.getPostList(userId);
		for(PostDetail postDetail : postDetailList) {
			if (postDetail.getPost().getId() == postId) {
				model.addAttribute("postDetail", postDetail);
			}
		}
		
		return "post/comment";
	}
}
