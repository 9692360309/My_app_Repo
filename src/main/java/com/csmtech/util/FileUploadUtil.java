package com.csmtech.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {

	public static List<String> getFilePath(MultipartFile[] attachment) {
	
		 List<String> filePaths = new ArrayList<>();

		    try {
		        for (MultipartFile attachments : attachment) {
		            String fileName = attachments.getOriginalFilename();
		            File fileDirectory = new File("d:/utf/");
		            if (!fileDirectory.isDirectory()) {
		                fileDirectory.mkdir();
		            }
			
		            String finalFilePath = "d:/utf/" + fileName;
		            File file = new File(finalFilePath);
		            InputStream in = attachments.getInputStream();
		            FileOutputStream fos = new FileOutputStream(file);
		            byte[] bytes = new byte[(int) attachments.getSize()];
		            in.read(bytes);
		            fos.write(bytes);
		            in.close();
		            fos.close();

		            filePaths.add(finalFilePath);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return filePaths;
		}



}
