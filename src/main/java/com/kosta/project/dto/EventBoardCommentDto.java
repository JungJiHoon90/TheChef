package com.kosta.project.dto;

import java.util.Date;

public class EventBoardCommentDto {
	
	private String e_no;
	private String comment_seq;
	private String comment_name;
	private String comment_comm;
	private Date comment_regdate;
	public String getE_no() {
		return e_no;
	}
	public void setE_no(String e_no) {
		this.e_no = e_no;
	}
	public String getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(String comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getComment_name() {
		return comment_name;
	}
	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}
	public String getComment_comm() {
		return comment_comm;
	}
	public void setComment_comm(String comment_comm) {
		this.comment_comm = comment_comm;
	}
	public Date getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	
}
