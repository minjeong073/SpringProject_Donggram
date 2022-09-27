package com.ming.project.donggram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest req
			, HttpServletResponse resp
			, Object handler) throws IOException {
		
		HttpSession session = req.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		String uri = req.getRequestURI();
		
		if (userId != null) {
			
			// 로그인 되어있는 경우
			// /user/signin/view
			// /user/signup/view
			// 접속하면 메모 리스트 페이지로 이동
			
			if (uri.startsWith("/user")) {
				resp.sendRedirect("/post/timeline/view");
				return false;
			}
		}
		else {
			// 로그인 되어있지 않은 경우
			
			if (uri.startsWith("/post")) {
				resp.sendRedirect("/user/signin/view");
				return false;
			}
		}
		
		return true;
	}
	
	@Override
	public void postHandle(
			HttpServletRequest req
			, HttpServletResponse resp
			, Object handler
			, ModelAndView modelAndView) {
		
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest req
			, HttpServletResponse resp
			, Object handler
			, Exception ex) {
		
	}
}
