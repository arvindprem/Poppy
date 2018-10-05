package com.ipsos.poppy.userdocument;

import java.util.List;

import com.ipsos.poppy.entity.Document;


 
public interface UserDocumentService {
 
    Document findById(int id);
 
    List<Document> findAll();
     
   
     
    void saveDocument(Document document);
     
    void deleteById(int id);
}