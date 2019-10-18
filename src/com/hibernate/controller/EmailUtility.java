
package com.hibernate.controller;

import com.sun.mail.imap.IMAPFolder;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Address;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import com.hibernate.been.UtilityMailMessage;
import com.hibernate.been.TemporaryMessageMail;

public class EmailUtility {

	// add user email
    final String userNameEmail = "";
    // add password email 
    final String userPassEmail = ""; 
    private static EmailUtility instance;
    final int MAIL_PER_PAGE = 7;
    private static int numPages;
    private static TemporaryMessageMail[] temporaryMessageMails;
    
    
    private EmailUtility() {
    }

    public static EmailUtility getInstance() {
        if (instance == null) {
            instance = new EmailUtility();
        }
        return instance;
    }

    public void sendEmail(UtilityMailMessage mailMessage) throws AddressException, MessagingException {
        
    	Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userNameEmail, userPassEmail);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(userNameEmail));
        message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(mailMessage.getMailto()));
        message.setRecipients(Message.RecipientType.CC,InternetAddress.parse(mailMessage.getMailcc()));
        message.setSubject(mailMessage.getMailsubject());
        message.setContent(mailMessage.getMailcontent(),"text/html; charset=utf-8");
        
        // sends the e-mail
        Transport.send(message);
    }

    public void downloadEmails(int downloadIndex, String downloadType) throws MessagingException, Exception {
        
        IMAPFolder folder = null;
        Store store = null;
        
        try {
            Properties properties = System.getProperties();
            properties.setProperty("mail.store.protocol", "imaps");

            Session session = Session.getDefaultInstance(properties, null);

            store = session.getStore("imaps");
            store.connect("imap.googlemail.com", userNameEmail, userPassEmail);

            folder = (IMAPFolder) store.getFolder("INBOX");

            if (!folder.isOpen()) {
                folder.open(Folder.READ_ONLY);
            }
            Message[] message;
            message = folder.getMessages();
            if(downloadType.equalsIgnoreCase("page")){
                getMailByPage(message, downloadIndex);
            } else {
                getEmailByIndex(message, downloadIndex);
            }
        } catch (MessagingException ex) {
            Logger.getLogger(EmailUtility.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (folder != null && folder.isOpen()) {
                folder.close(true);
            }
            if (store != null) {
                store.close();
            }
        }
    }

    private void getMailByPage(Message[] message, int indexPage) throws MessagingException, Exception {
        
    	if(message == null || message.length == 0) return;
        int length = message.length;
        int notMailForm, notMailTo;
        numPages = length / MAIL_PER_PAGE;
        if(length % MAIL_PER_PAGE > 0) {
            numPages += 1;
        }
        if(indexPage > 0) indexPage--;
        if(indexPage < 0) indexPage = 0;
        if (numPages >= indexPage) {
            notMailForm = length - (MAIL_PER_PAGE * indexPage + 1);
            notMailTo = length - (MAIL_PER_PAGE * indexPage + MAIL_PER_PAGE);

        } else {
            notMailForm = length - 1;
            notMailTo = length - MAIL_PER_PAGE;
        }
        if (notMailTo < 0) {
            notMailTo = 0;
        }
       
        temporaryMessageMails = new TemporaryMessageMail[notMailForm - notMailTo + 1];
        String subject, from, to, content;
        Date date;
        int sizeChars;
        
        for (int i = notMailForm; i >= notMailTo; i--) {
            subject = message[i].getSubject();
            from = message[i].getFrom()[0].toString();
            to = message[i].getAllRecipients()[0].toString();
            content = getContentMessage(message[i]);
            date = message[i].getReceivedDate();
            sizeChars = message[i].getSize();
            
            temporaryMessageMails[i - notMailTo] = new TemporaryMessageMail(message[i].getSubject(),
                    message[i].getFrom()[0].toString(),
                    message[i].getAllRecipients()[0].toString(),
                    "none",
                    message[i].getReceivedDate(),
                    i);
        }
    }

    private void getEmailByIndex(Message[] message, int i) throws IOException, MessagingException, Exception {
        
        if(message == null) return;
        
        temporaryMessageMails = new TemporaryMessageMail[1];
        temporaryMessageMails[0] = new TemporaryMessageMail(message[i].getSubject(),
                    message[i].getFrom()[0].toString(),
                    message[i].getAllRecipients()[0].toString(),
                    getContentMessage(message[i]),
                    message[i].getReceivedDate(),
                    i);
    }

    public static int getNumPages() {
        return numPages;
    }

    public static TemporaryMessageMail[] getTempMessage() {
        return temporaryMessageMails;
    }
    
    // get content message
    public String getContentMessage(Part part) throws Exception {
        String result = "";

        if (part.isMimeType("text/plain")) {
            result = (String) part.getContent();
        } 
        else if (part.isMimeType("multipart/*")) {
            Multipart multipart = (Multipart) part.getContent();
            int count = multipart.getCount();
            for (int i = 0; i < count; i++) {
                result += getContentMessage(multipart.getBodyPart(i)) + "\n";
            }
        }
        else if (part.isMimeType("message/rfc822")) {
            result += getContentMessage((Part) part.getContent());
        } else {
            Object o = part.getContent();
            if (o instanceof String) {
                result += (String) o + "\n";
            } else {
                result += o.toString();
            }
        }
        return result;
    }
}
