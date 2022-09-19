package com.ming.project.donggram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.donggram.post.bo.PostBO;
import com.ming.project.donggram.post.model.Post;
import com.ming.project.donggram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;

	@GetMapping("/timeline/view")
	public String timelineView(Model model) {
		
		List<PostDetail> postDetailList = postBO.getPostList();
		
		model.addAttribute("postDetailList", postDetailList);
		
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
}
