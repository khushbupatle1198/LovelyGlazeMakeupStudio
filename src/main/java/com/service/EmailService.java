package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private MailSender mailSender;

    // Method 1: Send booking request email
    public void sendBookingEmail(String toEmail, String fullName, Date bookingDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        String subject = "Rental Booking Request Received";
        String formattedDate = sdf.format(bookingDate);
        String message = "Dear " + fullName + ",\n\n"
                + "We have received your booking request for:\n"
                + "Booking Date: " + formattedDate + "\n\n"
                + "Please wait for a confirmation message.\n"
                + "Our team will contact you within 12 hours.\n\n"
                + "Best wishes,\n"
                + "Lovely Glaze Beauty Studio";

        sendEmail(toEmail, subject, message);
    }

 // Method 2: Send booking confirmation email
    public void sendConfirmationEmail(String toEmail, String fullName, Date bookingDate, String productName) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        String subject = "Your Booking is Confirmed – Lovely Glaze Beauty Studio";
        String formattedDate = sdf.format(bookingDate);

        String message = "Dear " + fullName + ",\n\n"
                + "We are pleased to inform you that your booking for \"" + productName + "\" on " + formattedDate + " has been successfully confirmed.\n\n"
                + "Our team is excited to serve you and ensure you have a wonderful experience at Lovely Glaze Beauty Studio.\n\n"
                + "If you have any questions or need assistance, feel free to contact us.\n\n"
                + "Warm regards,\n"
                + "Lovely Glaze Beauty Studio";

        sendEmail(toEmail, subject, message);
    }


 // Method 3: Send booking cancellation email
    public void sendCancellationEmail(String toEmail, String fullName, Date bookingDate, String productName) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        String subject = "Your Booking Has Been Cancelled – Lovely Glaze Beauty Studio";
        String formattedDate = sdf.format(bookingDate);

        String message = "Dear " + fullName + ",\n\n"
                + "Your booking for \"" + productName + "\" on " + formattedDate + " has been cancelled as per your request or due to other circumstances.\n\n"
                + "If this was a mistake or you'd like to reschedule, please get in touch with us.\n\n"
                + "We hope to welcome you soon at Lovely Glaze Beauty Studio.\n\n"
                + "Best regards,\n"
                + "Lovely Glaze Beauty Studio";

        sendEmail(toEmail, subject, message);
    }

    public void sendServiceBookingEmail(String email, String fullname, Date bookingDate, String title) {
        // Format the booking date
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String formattedDate = sdf.format(bookingDate);

        // Construct the email subject and message
        String subject = "Service Booking Confirmation ";
        String message = "Dear " + fullname + ",\n\n"
                       + "Thank you for booking the  service with Lovely Glaze Beauty Studio.\n\n"
                       + "📅 Booking Date: " + formattedDate + "\n"
                       + "👤 Name: " + fullname + "\n"
                       + "📌 Service: " + title + "\n\n"
                       + "Our team will contact you shortly for further coordination.\n"
                       + "If you have any questions, feel free to reply to this email.\n\n"
                       + "Regards,\n"
                       + "Lovely Glaze Beauty Studio\n"
                     ;

       
        sendEmail(email, subject, message);
    }


    public void sendInqueryEmail(String email, String fullname) {
		// TODO Auto-generated method stub
		
    	 String subject = "Rental Inquiry Confirmation";
    	String messageText = "Dear " + fullname + ",\n\n"
                + "Thank you for your inquiry. We have received your request and our team will get back to you shortly.\n\n"
                + "Best Regards,\n"
                + "Rental Services Team";
    	
    	sendEmail(email, subject, messageText);
	}
    
    
    public void sendServiceConfirmationEmail(String email, String fullname, Date bookingDate) {
		// TODO Auto-generated method stub
    	String subject = "Service Booking Confirmation – Lovely Glaze Beauty Studio";
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String formattedDate = sdf.format(bookingDate);

        String messageText = "Dear " + fullname + ",\n\n"
            + "Your service has been successfully booked for " + formattedDate + ".\n"
            + "We look forward to serving you.\n\n"
            + "Thank you for choosing us!\n"
            + "Best regards,\n"
            + "Lovely Glaze Beauty Studio";
        sendEmail(email, subject, messageText);
	}
    
    public void sendServiceCancellationEmail(String email, String fullname, Date bookingDate) {
		// TODO Auto-generated method stub
    	 String subject = "Service Booking Cancelled";
    	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    	    String formattedDate = sdf.format(bookingDate);

    	    String messageText = "Dear " + fullname + ",\n\n"
    	        + "We regret to inform you that your service booking scheduled for " + formattedDate + " has been cancelled.\n"
    	        + "If you have any questions or would like to reschedule, please feel free to contact us.\n\n"
    	        + "We apologize for any inconvenience caused.\n\n"
    	        + "Sincerely,\n"
    	        + "Lovely Glaze Beauty Studio";
    	    sendEmail(email, subject, messageText);
	}
    
    // Reusable method to send emails
    private void sendEmail(String toEmail, String subject, String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(toEmail);
        mailMessage.setSubject(subject);
        mailMessage.setText(message);
        mailMessage.setFrom("mahisgallerydm@gmail.com");  // Replace with your configured email
        mailSender.send(mailMessage);
    }

	public void sendRentalInqueryEmail(String email, String fullName) {
		// TODO Auto-generated method stub
		String Subject="Rental Inquiry Confirmation";
	    String message ="Dear " + fullName + ",\n\n"
	            + "Thank you for your interest in our rental services.\n"
	            + "We have received your inquiry and our team will get back to you shortly with more details.\n\n"
	            + "If you have any urgent questions, feel free to reply to this email.\n\n"
	            + "Best regards,\n"
	            + "Lovely Glaze Beauty Studio";
	    
	    sendEmail(email, Subject, message);
	}

	public void sendServiceInqueryConfirmationEmail(String email, String fullname) {
	    String subject = "Service Inquiry Confirmation";
	    String message = "Dear " + fullname + ",\n\n"
	            + "Thank you for reaching out to us regarding our services.\n"
	            + "We have received your inquiry and our team will contact you soon with further details.\n\n"
	            + "If you have any urgent questions, feel free to reply to this email.\n\n"
	            + "Best regards,\n"
	            + "Lovely Glaze Beauty Studio";

	    sendEmail(email, subject, message);
	}

	public void sendServiceInqueryCancellationEmail(String email, String fullname) {
	    String subject = "Service Inquiry Cancellation";
	    String message = "Dear " + fullname + ",\n\n"
	            + "We would like to confirm that your service inquiry has been successfully cancelled.\n"
	            + "If this was a mistake or you would like to re-initiate your inquiry, please contact us.\n\n"
	            + "We hope to serve you in the future.\n\n"
	            + "Best regards,\n"
	            + "Lovely Glaze Beauty Studio";

	    sendEmail(email, subject, message);
	}

	public void sendRentalInqueryConfirmationEmail(String email, String fullName) {
	    String subject = "Rental Inquiry Confirmation";
	    String message = "Dear " + fullName + ",\n\n"
	            + "Thank you for your rental inquiry.\n"
	            + "We have successfully received your request and our team will contact you shortly with more details.\n\n"
	            + "If you have any urgent questions, feel free to reply to this email.\n\n"
	            + "Best regards,\n"
	            + "Lovely Glaze Beauty Studio";

	    sendEmail(email, subject, message);
	}

	public void sendRentalInqueryCancellationEmail(String email, String fullName) {
	    String subject = "Rental Inquiry Cancellation";
	    String message = "Dear " + fullName + ",\n\n"
	            + "Your rental inquiry has been successfully cancelled as per your request.\n"
	            + "If this was done in error or if you would like to make another inquiry, please don't hesitate to contact us.\n\n"
	            + "We hope to assist you in the future.\n\n"
	            + "Best regards,\n"
	            + "Lovely Glaze Beauty Studio";

	    sendEmail(email, subject, message);
	}



	
}
