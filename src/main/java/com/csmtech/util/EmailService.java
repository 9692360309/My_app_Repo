package com.csmtech.util;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.csmtech.controller.CandidateController;
import com.csmtech.model.Candidate;
import com.csmtech.model.Configure;

public class EmailService {
	
	public static final String username = "meghacsm2001@gmail.com";
    public static final String password = "tjenfvtbycoqiqky";
	
	public static void sendEmailGmailTLS(List<Candidate> cand, Configure config) {
	    
	        
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
	        
	       
         String tDate= config.getTestDate().toString();
         String[] tDate1 = tDate.split(" ");
         String newDate = tDate1[0];
         
         LocalDate date = LocalDate.parse(newDate);
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy", Locale.ENGLISH);
         String formattedDate = date.format(formatter); 
         String dayOfWeek = date.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
         
         for (Candidate x : cand) {
	        
	        try {
	        	Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress("meghacsm2001@gmail.com"));
                message.setRecipients(
                        Message.RecipientType.TO,
                        InternetAddress.parse(x.getCandidateemail())
                );
                message.setSubject("Online Written Test For 'Junior Software Developer' position");
                //message.setText("Dear  "+x.getCandFirstname()+",\n \n"+" Thank you for applying for the position of 'Junior Software Engineer' at CSM Technologies, Bhubneswar.\n  Please appear the Online Written Test as per below schedule & other details."
                	//	+ "\n "+formattedDate+" ,"+ dayOfWeek+"\n Login Time:"+config.getLoginTime()+" ");
                
                String pass = CandidateController.decodeText(x.getCandpassword());
                System.out.println("send password"+pass);
                String msg = "Dear " + x.getCandFirstname() +"<br>"
                		+ "Thank you for applying for the position of 'Junior Software Engineer' at CSM Technologies, Bhubneswar."+"<br>"
                		+ "Please appear the Online Written Test as per below schedule & other details."
                		+ "<div class='container' style='border:1px solid #e2e2e2; padding:20px'>" + "<b>" +"Login Date :" + " </b>              " + formattedDate+ "," + dayOfWeek+ "<br>"
                		+ "<b>" + "Login Time :" + "</b>               " +config.getLoginTime() + "<br>"
                		+ "<b>" + "Start Time :" + "</b>               " +config.getStartTime() + "<br>"
                		+ "<b>" + "User Id :" + "</b>               Your mail Id is Your User Id"  + "<br>"
                		+ "<b>" + "Password :" + "</b>               " +pass + "<br>"
                		+ "<b>" + "Test Link :" + "</b>               " + "<br>"
                		+ "</div>" + "<br>"
                		+ "Please refer the enclosed document for guidelines related to the online written test."+"<br>"
                		+ "Based on the test scores, selected candidates will be scheduled for technical interviews." + "<br>"
                		+ "<br>" + "<br>"
                		+ "<b>" + "Note :" + "</b>"
                		+ "1.   Time deviation is not allowed. Candidates will be allowed to appear test as per their Test Timing Only." + "<br>" + "<br>"
                		+ "2.   If you fail to attend the above written test; there will be no further test scheduled for you." + "<br>" + "<br>"
                		+ "3.   Neither CSM Technologies nor any of its employees is charging any monetary amount for these Fresher hiring." + "<br>" + "<br>"
                		+ "With Warm Regards," + "<br>"
                		+ "Team HR" + "<br>"
                		+ "CSM Technologies (A CMMI ML5 Company)" + "<br>" + "<br>"
                		+ "A: Level-6, OCAC Tower, Bhubaneswar-13, Odisha, India" + "<br>"
                		+ "https://www.csm.tech/" + "<br>" + "<br>" + "<br>"
                		+ "Creating a value rich experience" + "<br>"
                		+ "IT Consultancy | Business Solutions | Outsourcing" + "<br>"
                		+ "<hr>" + "<br>" + "<br>"
                		+ "The information contained in this e-mail message and/or attachments to it may contain confidential or privileged information. If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the information contained in this email message and/or attachments to it are strictly prohibited. If you have received this communication in error, please notify us by reply e-mail or telephone and immediately and permanently delete the message and any attachments. Thank you"
                		+ "<br>";
                
                message.setContent(msg, "text/html");
                Transport.send(message);
                System.out.println("Mail Sent Successfully.");
	           
	        } catch (MessagingException ex) {
	            ex.printStackTrace();
	        }
	    }
	}
	
	public static void sendEmails(List<Candidate> candidates,Configure config) {
		for(Candidate candidate : candidates) {
		Thread emailThread = new Thread(() ->{
		sendEmailGmailTLS(candidates, config);
		});
		emailThread.start();
		}
		}

}
