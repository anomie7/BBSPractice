package dbconn;

public class FreeBoard {
	private int id;
	private String email;
	private String subject;
	private String name;
	private String inputdate;
	private int readcount;
	private String content;
	
	public FreeBoard(String name, String inputdate, int readcount, String content, String subject) {
		super();
		this.name = name;
		this.inputdate = inputdate;
		this.readcount = readcount;
		this.content = content;
		this.subject = subject;
	}
	
	

	public FreeBoard(String email, String subject, String name, String content) {
		super();
		this.email = email;
		this.subject = subject;
		this.name = name;
		this.content = content;
	}

	public FreeBoard(int id, String subject, String name, String inputdate, int readcount) {
		this.id = id;
		this.subject = subject;
		this.name = name;
		this.inputdate = inputdate;
		this.readcount = readcount;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}
	
}
