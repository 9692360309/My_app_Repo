package com.csmtech.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DownloadController{
       
	private final int ARBITARY_SIZE = 1048;

    @RequestMapping(value = "/download")
    protected void downloadFile(@RequestParam(name = "file_path" ) String fPath, HttpServletRequest req, HttpServletResponse resp) 
      throws ServletException, IOException {
    	
    	File f=new File(fPath);
    	
    	
        resp.setHeader("Content-disposition", "attachment; filename="+ f);

        try(FileInputStream in = new FileInputStream(f);
          OutputStream out = resp.getOutputStream()) {

            byte[] buffer = new byte[ARBITARY_SIZE];
        
            int numBytesRead;
            while ((numBytesRead = in.read(buffer)) > 0) {
                out.write(buffer, 0, numBytesRead);
            }
        }
    }

}





/*
 * @WebServlet("/download") public class Download extends HttpServlet { private
 * static final long serialVersionUID = 1L;
 * 
 * private final int ARBITARY_SIZE = 1048;
 * 
 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException { String
 * fPath=req.getParameter("file_path").trim(); File f=new File(fPath);
 * resp.setHeader("Content-disposition", "attachment; filename="+fPath);
 * 
 * try(FileInputStream in = new FileInputStream(f); OutputStream out =
 * resp.getOutputStream()) {
 * 
 * byte[] buffer = new byte[ARBITARY_SIZE];
 * 
 * int numBytesRead; while ((numBytesRead = in.read(buffer)) > 0) {
 * out.write(buffer, 0, numBytesRead); } } }
 * 
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { doGet(request, response); }
 * 
 * }
 */