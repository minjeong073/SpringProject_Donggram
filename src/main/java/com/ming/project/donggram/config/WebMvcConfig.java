package com.ming.project.donggram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ming.project.donggram.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	// 서버에 지정된 경로 파일을 외부에서 접근 가능 하도록 경로 설정
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}
	

}
