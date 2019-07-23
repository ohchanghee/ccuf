package com.solrecipe.recipe.user.email.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	
	
//	public void setJavaMailSender(JavaMailSender javaMailSender) {
//		this.javaMailSender = javaMailSender;
//	}

	public void MailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}


	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setSubject(subject);
			helper.setText(text);
			helper.setFrom(from);
			helper.setTo(to);
			
			//파일 처리 
			if(filePath != null) {
				File file = new File(filePath);
				if(file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			
			javaMailSender.send(message);
			return true;
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		
		return false;
	}


}
