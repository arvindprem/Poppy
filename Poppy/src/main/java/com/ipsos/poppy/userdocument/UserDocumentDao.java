package com.ipsos.poppy.userdocument;

import java.util.List;

import com.ipsos.poppy.entity.Document;


 
public interface UserDocumentDao {
 
    List<Document> findAll();
     
    Document findById(int id);
     
    void save(Document document);
     
    
    void deleteById(int id);
}