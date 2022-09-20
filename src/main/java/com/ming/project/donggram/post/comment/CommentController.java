package com.ming.project.donggram.post.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.donggram.post.bo.PostBO;
import com.ming.project.donggram.post.comment.model.Comment;

@Controller
@RequestMapping("/")
public class CommentController {

	@Autowired
	private PostBO postBO;

	
}
