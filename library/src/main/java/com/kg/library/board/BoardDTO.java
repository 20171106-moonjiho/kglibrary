package com.kg.library.board;


import java.sql.Timestamp;

/*실습에서는 board2로 함
CREATE TABLE board(
	num number(7) not null,
	writer varchar2(12) not null,
	email varchar2(30) not null,
	subject varchar2(50) not null,
	pass varchar2(10) not null,
	readcount number(5) default 0 not null,
	ref number(5) default 0 not null,
	step number(3) default 0 not null,
	depth number(3) default 0 not null,
	regdate timestamp default sysdate not null,
	ip varchar2(20) not null,
	content varchar2(4000) not null,
	CONSTRAINT board_pk PRIMARY KEY(num)
);
//실습에서는board2_seq로함
CREATE SEQUENCE board_seq START  WITH 1 INCREMENT BY 1 NOMAXVALUE NOCACHE NOCYCLE;
commit;
 */
public class BoardDTO {
	private int num;
	private String writer;
	private String email;
	private String subject;
	private String pass;
	private int readCount;
	private int ref;//답변
	private int step;//같은 계층(depth)의 답변에 대한 순서를 표현하기 위해..
	private int depth;//답변에 답변 그것에 답변...을 표현하기 위해
	private Timestamp regDate;
	private String ip;
	private String content;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}