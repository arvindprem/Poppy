package com.ipsos.poppy.userdocument;



import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.ipsos.poppy.entity.Document;
 

 
@Repository("userDocumentDao")
public class UserDocumentDaoImpl extends AbstractDao<Integer, Document> implements UserDocumentDao{
 
    @SuppressWarnings("unchecked")
    public List<Document> findAll() {
        Criteria crit = createEntityCriteria();
        return (List<Document>)crit.list();
    }
 
    public void save(Document document) {
        persist(document);
    }
 
     
    public Document findById(int id) {
        return getByKey(id);
    }
    public void deleteById(int id) {
        Document document =  getByKey(id);
        delete(document);
    }
 
}