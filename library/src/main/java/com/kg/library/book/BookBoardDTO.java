package com.kg.library.book;

/*
 * 순서 - 번호(1),카테고리(2),제목(3),저작자(4),발행자(5),발행년도(6),비치일(7),이미지(8) 

create table book_board(
no number not null,
category varchar2(50),
title_info varchar2(50),
author_info varchar2(30),
pub_info varchar2(30),
pub_year_info varchar2(50),
reg_date varchar2(50),
image varchar2(255));
 * 
 * 
 */


public class BookBoardDTO {

	private int no;
	private String category;
	private String title_info;
	private String author_info;
	private String pub_info;
	private String pub_year_info;
	private String reg_date;
	private String image;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle_info() {
		return title_info;
	}
	public void setTitle_info(String title_info) {
		this.title_info = title_info;
	}
	public String getAuthor_info() {
		return author_info;
	}
	public void setAuthor_info(String author_info) {
		this.author_info = author_info;
	}
	public String getPub_info() {
		return pub_info;
	}
	public void setPub_info(String pub_info) {
		this.pub_info = pub_info;
	}
	public String getPub_year_info() {
		return pub_year_info;
	}
	public void setPub_year_info(String pub_year_info) {
		this.pub_year_info = pub_year_info;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
