package com.csmtech.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.MultipartFile;

import com.csmtech.controller.CandidateController;
import com.csmtech.model.Candidate;
import com.csmtech.model.CommunicationMaster;
import com.csmtech.model.Configure;
import com.csmtech.model.TestTaker;

public class EmailServiceMessage {
	public static final String username = "meghacsm2001@gmail.com";
    public static final String password = "tjenfvtbycoqiqky";
    
    
    
    
	public static void sendEmailGmailTLS(TestTaker testTaker,CommunicationMaster c) throws IllegalStateException, IOException {
	    
        
		 Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                        }
                });
	        
	       
       
        String to= testTaker.getOfficerEmail();
               
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("meghacsm2001@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Online Written Test For 'Junior Software Developer' position");
            message.setText(c.getMessage());
            
            // Create a multipart message to combine the main message and attachment

            MimeMultipart mimeMultipart = new MimeMultipart();
            MimeBodyPart textMime = new MimeBodyPart();
           // MimeBodyPart fileMime = new MimeBodyPart();

            textMime.setText(c.getMessage());
            mimeMultipart.addBodyPart(textMime);
            // Attach the file from the file path
//            String filePath = c.getFilePath();
//            File file = new File(filePath);
//            fileMime.attachFile(file);

           
//            mimeMultipart.addBodyPart(fileMime);
            List<String> filePaths = c.getFilePaths();// Assuming you have a method to get the list of file paths
            for (String filePath : filePaths) {
                MimeBodyPart fileMime = new MimeBodyPart();
                File file = new File(filePath);
                fileMime.attachFile(file);
                mimeMultipart.addBodyPart(fileMime);
            }
            
            // Set the content of the message to the multipart
            message.setContent(mimeMultipart);

            Transport.send(message);
            System.out.println("Mail Sent Successfully.");
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
	    
	}


	
}



