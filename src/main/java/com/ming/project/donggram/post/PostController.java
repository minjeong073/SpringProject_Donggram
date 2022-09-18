package com.ming.project.donggram.post;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ming.project.donggram.post.bo.PostBO;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline/view")
	public String timelineView(
			HttpServletRequest req
			, Model model) {
		
		HttpSession session = req.getSession();
		
		int userId = (Integer) session.getAttribute("userId");
		
		List<Map<String, Object>> postUserList = postBO.getPostUser(userId);
		model.addAttribute("postUserList", postUserList);
		
		return "post/timeline";
	}
	
	@GetMapping("/create/view")
	public String postCreateView() {
		return "post/create";
	}
}
