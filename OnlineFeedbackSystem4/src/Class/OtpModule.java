package Class;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;    
public class OtpModule{  
    public static String send(String to,String sub,String msg){  
          //Get properties object    
    	  String  from="saurabhabic@gmail.com";
    	  String password="9910648703";
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          
        
          
          
          //get Session   
           Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           //message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
          // message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(to));
           message.setSubject(sub);    
           message.setText(msg);    
           //send message  
           Transport.send(message);    
               
          } catch (MessagingException e) {throw new RuntimeException(e);}    
          System.out.println("send");
     return "send";        
    }  
   public static void main(String[] args) {    
        //from,password,to,subject,message  
    	
       OtpModule.send("saurabhabic@gmail.com","hello javatpoint","abssss");  
        //change from, password and to  
    } 
}  
  