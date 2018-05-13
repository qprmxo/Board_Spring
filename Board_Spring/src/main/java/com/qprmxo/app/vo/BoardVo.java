package com.qprmxo.app.vo;

import java.sql.Date;

public class BoardVo {
	private int num;
	private String title;
	private String content;
	private Date regdate;
	
	public BoardVo() {}
	public BoardVo(int num, String title, String content, Date regdate) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	
	
	public BoardVo(int num, String title, String content) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
	}
	public BoardVo(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
