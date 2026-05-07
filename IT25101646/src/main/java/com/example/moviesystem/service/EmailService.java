package com.example.moviesystem.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

    @Service
    public class EmailService {

        @Autowired
        private JavaMailSender mailSender;

        public void sendResetCode(String toEmail, String code) {

            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(toEmail);
            message.setSubject("Password Reset Code");
            message.setText("Your reset code is: " + code);

            mailSender.send(message);
        }
    }


