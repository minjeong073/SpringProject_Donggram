package com.ming.project.donggram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.donggram.post.bo.PostBO;
import com.ming.project.donggram.post.comment.bo.CommentBO;
import com.ming.project.donggram.post.comment.model.Comment;
import com.ming.project.donggram.post.model.Post;
import com.ming.project.donggram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;

	@GetMapping("/timeline/view")
	public String timelineView(
			// TODO @RequestParam("postId") int postId
			Model model) {
		
		List<PostDetail> postDetailList = postBO.getPostList();
		
		model.addAttribute("postDetailList", postDetailList);
		
		// TODO : postId 어떻게 가져올지
		// int commentCount = commentBO.countComment(postId);
		
		// model.addAttribute("commentCount", commentCount);
		
		return "post/timeline";
	}
	
	@GetMapping("/create/view")
	public String postCreateView() {
		return "post/create";
	}
	
	@GetMapping("/detail/view")
	public String postDetailView(
			@RequestParam("id") int id
			, Model model) {
		
		Post post = postBO.getPostById(id);
		
		model.addAttribute("post", post);
		
		return "post/detail";
	}
	
	@GetMapping("/detail/comment/view")
	public String commentView(
			@RequestParam("postId") int postId
			, Model model) {
		
		List<Comment> commentList = commentBO.getComment(postId);
		
		model.addAttribute("commentList", commentList);
		
		return "post/comment";
	}
	
}
