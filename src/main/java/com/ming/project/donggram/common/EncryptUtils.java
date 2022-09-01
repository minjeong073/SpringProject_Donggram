package com.ming.project.donggram.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {

	public static String md5(String message) {
		
		String resultData = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			// str -> byte -> update -> digest -> HexStr
			byte[] bytes = message.getBytes();
			
			md.update(bytes);
			
			byte[] digest = md.digest();
			
			for (int i = 0; i < digest.length; i++) {
				resultData += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return resultData;
	}
}
