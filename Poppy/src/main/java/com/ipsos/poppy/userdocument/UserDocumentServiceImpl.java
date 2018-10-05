package com.ipsos.poppy.userdocument;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ipsos.poppy.entity.Document;
 

@Service("userDocumentService")
@Transactional
public class UserDocumentServiceImpl implements UserDocumentService{
 
    @Autowired
    UserDocumentDao dao;
 
    public Document findById(int id) {
        return dao.findById(id);
    }
 
    public List<Document> findAll() {
        return dao.findAll();
    }
 
    
    public void saveDocument(Document document){
        dao.save(document);
    }
 
    public void deleteById(int id){
        dao.deleteById(id);
    }
     
}
