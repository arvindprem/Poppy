package com.ipsos.poppy.docs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.Document;

@Service
public class UserDocumentService {
	@Autowired
	private UserDocumentRepository userDocumentRepository;

	public boolean uploadDocument(Document doc) {
		return userDocumentRepository.uploadDoc(doc);
	}

	public String getUploadedDoc() {
		return userDocumentRepository.getUploadedDoc();
	}

	public boolean deleteFile(String fileId) {
		return  userDocumentRepository.deleteFile(fileId);
	}

	public Document downloadFile(String fileId) {
		return  userDocumentRepository.downloadFile(fileId);
		
	}

}