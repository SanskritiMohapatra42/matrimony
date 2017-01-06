package mm.db;

public class MatrimonyMail {
	String sender,receiver,subject,message,msgdate,name;
	
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getSender() {
		return sender;
	}
	
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceiver() {
		return receiver;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSubject() {
		return subject;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
	
	public void setMsgDate(String msgdate) {
		this.msgdate = msgdate;
	}
	public String getMsgDate() {
		return msgdate;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}

}
