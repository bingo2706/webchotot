package com.laptrinhjavaweb.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.FileNotFoundException;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

@Component
public class UploadFileUtils {
	public final String root = "C:/Users/ASUS/git/webChotot-Springmvc/spring-mvc-template-bootstrap-spring-mvc/src/main/webapp/template/admin";
		
	    public void writeOrUpdate(byte[] bytes, String path) {
	        File file = new File(StringUtils.substringBeforeLast(root + path, "/"));
	        if (!file.exists()) {
	            file.mkdir();
	        }
	        try(FileOutputStream fileOutputStream = new FileOutputStream(new File(root + path))) {
	            fileOutputStream.write(bytes);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
}
