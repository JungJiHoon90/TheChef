package com.kosta.project.dto;

import java.util.Date;

public class CookReviewDTO {
	private String k_no;
	private String id;
	private Date reg_date;
	private int score;
	private String k_review;
	private String k_title;
	
	public CookReviewDTO() {}

	public CookReviewDTO(String k_no, String id, Date reg_date, int score, String k_review, String k_title) {
		this.k_no = k_no;
		this.id = id;
		this.reg_date = reg_date;
		this.score = score;
		this.k_review = k_review;
		this.k_title = k_title;
	}

	public String getK_no() {
		return k_no;
	}

	public void setK_no(String k_no) {
		this.k_no = k_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getK_review() {
		return k_review;
	}

	public void setK_review(String k_review) {
		this.k_review = k_review;
	}

	public String getK_title() {
		return k_title;
	}

	public void setK_title(String k_title) {
		this.k_title = k_title;
	}
	
	
}
