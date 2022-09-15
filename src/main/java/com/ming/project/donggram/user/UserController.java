package com.ming.project.donggram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

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
	public String feedView() {
		return "user/feed";
	}
}
