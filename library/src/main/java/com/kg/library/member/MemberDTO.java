package com.kg.library.member;
/*
* 회원가입(member)
*회원가입 순서 - 번호(1),이름(2),아이디(3),비밀번호(4),연락처(5),Email(6),주소(7),대여도서(8),스터디룸(9)

(예시

-oracle_ver-
create table member(
no number not null,
name varchar2(30) not null,
id varchar2(20) not null primary key,
pw varchar2(12) not null,
confirm varchar2(12) not null,
tel varchar2(20) not null,
email varchar2(50) not null,
address varchar2(50),
book varchar2(50),
studyroom varchar2(50));
*/

public class MemberDTO {
	private int no;
	private String name;
	private String id;
	private String pw;
	private String confirm;
	private String tel;
	private String email;
	private String address;
	private String book;
	private String studyroom;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getStudyroom() {
		return studyroom;
	}
	public void setStudyroom(String studyroom) {
		this.studyroom = studyroom;
	}
	
	
}
