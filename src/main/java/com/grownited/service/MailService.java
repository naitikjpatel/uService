package com.grownited.service;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.grownited.entity.UserEntity;

@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;

	public void sendDemoMail(UserEntity userEntity) {

			String subject = "Welcome to Urban Service";
			String body = "Welcome! " + userEntity.getName() + " 😊 We're glad to have you here. "
			        + "If you need any help, feel free to ask. Enjoy your experience! 🚀 \n "
			        + "<a href='http://192.168.1.13/'>Click Here</a> to visit the application.";

			String from = "tejasshah2k19@gmail.com";
			
			SimpleMailMessage mailMessage=new SimpleMailMessage();
			mailMessage.setSubject(subject);
			mailMessage.setText(body);
			mailMessage.setFrom(from);
			mailMessage.setTo(userEntity.getEmailId());
			
			javaMailSender.send(mailMessage);
		
	}
	
}
