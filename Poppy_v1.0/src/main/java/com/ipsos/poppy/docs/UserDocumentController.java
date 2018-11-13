package com.ipsos.poppy.docs;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.Document;

@RestController
public class UserDocumentController {
	@Autowired
	private UserDocumentService userDocumentService;

	@GetMapping("/ManageDocument")
	public ModelAndView userDocument() {
		return new ModelAndView("ManageDocs");
	}

	@GetMapping("/AddDoc")
	public ModelAndView addDoc() {
		return new ModelAndView("AddDoc");
	}

	@PostMapping(value = "/AddNewDoc", produces = "application/json")
	public boolean uploadDoc(@RequestParam("Doc") MultipartFile multiPartFile, @ModelAttribute Document doc) {
		try {
			
			System.out.println(multiPartFile.getBytes().length);
			doc.setContent(multiPartFile.getBytes());
			doc.setType(multiPartFile.getContentType());
			doc.setExtension(multiPartFile.getOriginalFilename()
					.substring(multiPartFile.getOriginalFilename().lastIndexOf('.')));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userDocumentService.uploadDocument(doc);
	}

	@PostMapping(value = "/GetAllDoc", produces = "application/json")
	public String getUploadDoc() {
		return userDocumentService.getUploadedDoc();
	}

	@PostMapping(value = "/DeleteFile")
	public boolean deleteFile(@RequestParam("FileId") String fileId) {
		return userDocumentService.deleteFile(fileId);
	}
//
//	@GetMapping(value = "/DownloadFile")
//	public void downloadFile(@RequestParam("FileId") String fileId, HttpServletResponse response) {
//		try {
//			Document doc = userDocumentService.downloadFile(fileId);
//			response.setContentType(doc.getType());
//			response.setHeader(HttpHeaders.CONTENT_DISPOSITION,
//					"attachment;filename=" + doc.getName() + doc.getExtension());
//			ServletOutputStream outStream = response.getOutputStream();
//			System.out.println(doc.getContent().length);
//			outStream.write(doc.getContent());
//			outStream.flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}

}