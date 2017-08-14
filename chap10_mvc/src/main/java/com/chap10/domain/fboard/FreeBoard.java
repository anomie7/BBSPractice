package com.chap10.domain.fboard;

public class FreeBoard {
	private int id;
	private String password;
	private String email;
	private String subject;
	private String name;
	private String inputdate;
	private String content;
	private int readcount;
	private int step;
	private int masterid;
	private int replynum;
	
	
	
	public FreeBoard(int id, String password, String email, String subject, String name, String inputdate,
			String content, int masterid) {
		this.id = id;
		this.password = password;
		this.email = email;
		this.subject = subject;
		this.name = name;
		this.inputdate = inputdate;
		this.content = content;
		this.masterid = masterid;
	}


	public FreeBoard(int id, String password, String email, String subject, String name, String inputdate,
			String content, int readcount, int step, int masterid, int replynum) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.subject = subject;
		this.name = name;
		this.inputdate = inputdate;
		this.content = content;
		this.readcount = readcount;
		this.step = step;
		this.masterid = masterid;
		this.replynum = replynum;
	}


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
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



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getInputdate() {
		return inputdate;
	}



	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public int getReadcount() {
		return readcount;
	}



	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}



	public int getStep() {
		return step;
	}



	public void setStep(int step) {
		this.step = step;
	}



	public int getMasterid() {
		return masterid;
	}



	public void setMasterid(int masterid) {
		this.masterid = masterid;
	}



	public int getReplynum() {
		return replynum;
	}



	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
		result = prime * result + ((inputdate == null) ? 0 : inputdate.hashCode());
		result = prime * result + masterid;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + readcount;
		result = prime * result + replynum;
		result = prime * result + step;
		result = prime * result + ((subject == null) ? 0 : subject.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FreeBoard other = (FreeBoard) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id != other.id)
			return false;
		if (inputdate == null) {
			if (other.inputdate != null)
				return false;
		} else if (!inputdate.equals(other.inputdate))
			return false;
		if (masterid != other.masterid)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (readcount != other.readcount)
			return false;
		if (replynum != other.replynum)
			return false;
		if (step != other.step)
			return false;
		if (subject == null) {
			if (other.subject != null)
				return false;
		} else if (!subject.equals(other.subject))
			return false;
		return true;
	}
	
}
