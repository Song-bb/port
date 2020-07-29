package com.example.demo.Service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileuploadService_event {

	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
	private static String SAVE_PATH = "/upload_event/"; //디폴트는 C:/upload폴더에 생성됨.
	private static String PREFIX_URL = "/upload_event/";
	
	public String restore(MultipartFile multipartFile) {
		
		String url = null;
		String src = null;
		
		try {	
			
			String savepath = ResourceUtils.getFile("classpath:static/upload_event/").toPath().toString();
			savepath = savepath.replace("\\", "/");
			//파일경로변경(bin>src)
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static");
			
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;
			
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);	
			src = "upload_event/" + saveFileName;
			
			writeFile(multipartFile, saveFileName);
			

		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return src;
	}
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		
		String fileName = "";
		//랜덤파일명 uuid
		String uuid = UUID.randomUUID().toString();
		fileName += uuid;
		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private void writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		/*System.out.println("savefile:" + SAVE_PATH + "/" + saveFileName ); */
		
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return;
	}
	
	
}
