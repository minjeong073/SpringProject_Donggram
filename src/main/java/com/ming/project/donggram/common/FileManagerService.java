package com.ming.project.donggram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\민정이\\spring\\donggram_upload";
	
	// console 에 log 찍기
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
		// FILE_UPLOAD_PATH 밑에 directory 생성
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);	// file 객체 생성
		
		if (directory.mkdir() == false) {	// directory 생성 실패
			
			// 실패 log 추가
			logger.error("FileManagerService - saveFile : file 디렉토리 생성 에러 " + filePath);
			return null;
		}
		
		// 생성된 경로에 file 저장
		try {
			byte[] bytes = file.getBytes();
			
			// file 전체 경로
			String fileFullPath = filePath + file.getOriginalFilename();
			
			Path path = Paths.get(fileFullPath);	// file 경로 관리하는 path 객체 생성
			
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			// file 저장 실패 log 추가
			logger.error("FileManagerService - saveFile : 파일 저장 실패");
			return null;
		}
		
		// 클라이언트에서 접근 가능한 경로 설정
		return "/images" + directoryName + file.getOriginalFilename();
	}

}
