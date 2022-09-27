package com.ming.project.donggram.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.donggram.post.bo.PostBO;
import com.ming.project.donggram.post.model.Post;
import com.ming.project.donggram.user.bo.UserBO;
import com.ming.project.donggram.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;

	@Autowired
	private PostBO postBO;
	
	@GetMapping("/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	@GetMapping("/signin/view")
	public String signinView() {
		return "user/signin";
	}
	
	@GetMapping("/signin/findId/view")
	public String findIdView() {
		return "user/findId";
	}
	
	@GetMapping("/signin/findPw/view")
	public String findPwView() {
		return "user/findPw";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/signin/view";
	}
	
	@GetMapping("/feed/view")
	public String feedView(@RequestParam("id") int id
			, Model model) {
		
		User user = userBO.getUserById(id);
		List<Post> postList = postBO.getPostByUserId(id);
		
		model.addAttribute("user", user);
		model.addAttribute("postList", postList);
		
		return "user/feed";
	}
}
