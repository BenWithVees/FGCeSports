package com.markham.DAO;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.markham.tables.User;

public class Email implements EmailManager {

	private MailSender mailSender;
	private SimpleMailMessage templateMessage;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setTemplateMessage(SimpleMailMessage templateMessage) {
		this.templateMessage = templateMessage;
	}

	/**
	 * This method constructs a mail template to send for a new user 
	 */
	public void placeOrder(User user) {
		SimpleMailMessage msg = new SimpleMailMessage(this.templateMessage);

		String message = "Hello " + user.getUsername() + ",\n\nThank you for joining FGCeSports!";

		msg.setText(message);
		msg.setTo(user.getEmail());

		try {
			this.mailSender.send(msg);
		} catch (MailException ex) {
			ex.printStackTrace(System.out);
		}
	}

}
