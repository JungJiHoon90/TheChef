package com.kosta.project.dto;

import java.util.Date;

public class TalkBoardDto {
	private int t_no;
	private String t_title;
	private String t_writer;
	private Date t_regdate;
	private int t_hit;
	private String t_contents;
	
	public TalkBoardDto() {
		super();
	}
	public TalkBoardDto(int t_no, String t_title, String t_writer, Date t_regdate, int t_hit, String t_contents) {
		super();
		this.t_no = t_no;
		this.t_title = t_title;
		this.t_writer = t_writer;
		this.t_regdate = t_regdate;
		this.t_hit = t_hit;
		this.t_contents = t_contents;
	}
	public int getT_no() {
		return t_no;
	}
	public void setT_no(int t_no) {
		this.t_no = t_no;
	}
	public String getT_title() {
		return t_title;
	}
	public void setT_title(String t_title) {
		this.t_title = t_title;
	}
	public String getT_writer() {
		return t_writer;
	}
	public void setT_writer(String t_writer) {
		this.t_writer = t_writer;
	}
	public Date getT_regdate() {
		return t_regdate;
	}
	public void setT_regdate(Date t_regdate) {
		this.t_regdate = t_regdate;
	}
	public int getT_hit() {
		return t_hit;
	}
	public void setT_hit(int t_hit) {
		this.t_hit = t_hit;
	}
	public String getT_contents() {
		return t_contents;
	}
	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}
	
	
	
}
