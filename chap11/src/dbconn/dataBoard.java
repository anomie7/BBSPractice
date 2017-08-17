package dbconn;

public class dataBoard {
	private int id;
	private String email;
	private String subject;
	private String name;
	private String inputdate;
	private String content;
	private int readcount;
	private int step;
	private int masterid;
	private int replynum;
	private String filename;
	private int filesize;

	public dataBoard(String name, String inputdate, int readcount, String content, String subject, String filename) {
		super();
		this.name = name;
		this.inputdate = inputdate;
		this.readcount = readcount;
		this.content = content;
		this.subject = subject;
		this.filename = filename;
	}

	public dataBoard(String email, String subject, String name, String content) {
		super();
		this.email = email;
		this.subject = subject;
		this.name = name;
		this.content = content;
	}

	public dataBoard(int id, String subject, String name, String inputdate, int readcount) {
		this.id = id;
		this.subject = subject;
		this.name = name;
		this.inputdate = inputdate;
		this.readcount = readcount;
	}

	public dataBoard(int id, String subject, String name, String inputdate, int readcount, int step, String filename) {
		this.id = id;
		this.subject = subject;
		this.name = name;
		this.inputdate = inputdate;
		this.readcount = readcount;
		this.step = step;
		this.filename = filename;
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

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
