package com.ipsos.poppy.userdocument;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.Document;

@Controller
@RequestMapping("/")
public class AppController {
	  @Autowired
	    UserDocumentService userDocumentService;
    
    @GetMapping("/add-document")
    public ModelAndView addDocuments(@PathVariable int id, ModelMap model) {
        
 
        FileBucket fileModel = new FileBucket();
        model.addAttribute("fileBucket", fileModel);
 
        Document documents = userDocumentService.findById( id);
        model.addAttribute("documents", documents);
         
        return new ModelAndView("/managedocuments");
    }
    @RequestMapping(value = { "/download-document-{id}-{docId}" }, method = RequestMethod.GET)
    public String downloadDocument(@PathVariable int id, @PathVariable int docId, HttpServletResponse response) throws IOException {
        Document document = userDocumentService.findById(docId);
        response.setContentType(document.getType());
        response.setContentLength(document.getContent().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getName() +"\"");
  
        FileCopyUtils.copy(document.getContent(), response.getOutputStream());
  
        return "redirect:/add-document-"+id;
    }
    @RequestMapping(value = { "/delete-document-{id}-{docId}" }, method = RequestMethod.GET)
    public String deleteDocument(@PathVariable int id, @PathVariable int docId) {
        userDocumentService.deleteById(docId);
        return "redirect:/add-document-"+id;
    }
    @RequestMapping(value = { "/add-document-{id}" }, method = RequestMethod.POST)
    public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, @PathVariable int id) throws IOException{
         
        if (result.hasErrors()) {
            System.out.println("validation errors");
           
 
            Document documents = userDocumentService.findById(id);
            model.addAttribute("documents", documents);
             
            return "managedocuments";
        } else {
             
            System.out.println("Fetching file");
         
            Document document = userDocumentService.findById(id);
            model.addAttribute("Document", document);
            saveDocument(fileBucket, document);
 
            return "redirect:/add-document-"+id;
        }
    }
     
    private void saveDocument(FileBucket fileBucket, Document document) throws IOException{
         
        Document document1 = new Document();
         
        MultipartFile multipartFile = fileBucket.getFile();
         
        document1.setName(multipartFile.getOriginalFilename());
        document1.setDescription(fileBucket.getDescription());
        document1.setType(multipartFile.getContentType());
        document1.setContent(multipartFile.getBytes());
       
        userDocumentService.saveDocument(document1);
    }
     


     
}


