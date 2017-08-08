package chap09_model;

public class GuestBoard {
	String name;
	String email;
	String subject;
	String content;
	String ymd;
	
	public GuestBoard(String name, String email, String subject, String content) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.content = content;
		ymd = new MyNowTime().toString();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}

	public String getYmd() {
		return ymd;
	}

	public void setYmd(String ymd) {
		this.ymd = ymd;
	}
	
	
}
