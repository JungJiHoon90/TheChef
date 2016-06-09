package com.kosta.project.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class CookRecipeDto {
	String k_title, id, k_no, k_contentFile, k_thumbFile, k_category;
	Date k_regdate;
	String k_src;
	
	// constructor
	public CookRecipeDto() {}

	public CookRecipeDto(String k_title, String id, String k_no, String k_contentFile, String k_thumbFile, String k_category, Date k_regdate, String k_src, List<CommonsMultipartFile> files) {
		this.k_title = k_title;
		this.id = id;
		this.k_no = k_no;
		this.k_contentFile = k_contentFile;
		this.k_thumbFile = k_thumbFile;
		this.k_category = k_category;
		this.k_regdate = k_regdate;
		this.k_src = k_src;
		this.files = files;
	}

	//////////////////////////////////////////////////////////////////
	//다중 파일 업로드 upload CommonsMultipartFile 하나이상 필요////
	private List<CommonsMultipartFile> files;
	
	public List<CommonsMultipartFile> getFiles(){ // get 메소드
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files){ // set 메소드
		this.files = files;
	}
	//////////////////////////////////////////////////////////////////////


	//setter, getter
	public String getK_title() {
		return k_title;
	}

	public void setK_title(String k_title) {
		this.k_title = k_title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getK_no() {
		return k_no;
	}

	public void setK_no(String k_no) {
		this.k_no = k_no;
	}

	public String getK_contentFile() {
		return k_contentFile;
	}

	public void setK_contentFile(String k_contentFile) {
		this.k_contentFile = k_contentFile;
	}

	public String getK_thumbFile() {
		return k_thumbFile;
	}

	public void setK_thumbFile(String k_thumbFile) {
		this.k_thumbFile = k_thumbFile;
	}

	public String getK_category1() {
		return k_category;
	}

	public void setK_category(String k_category) {
		this.k_category = k_category;
	}

	public Date getK_regdate() {
		return k_regdate;
	}

	public void setK_regdate(Date k_regdate) {
		this.k_regdate = k_regdate;
	}

	public String getK_src() {
		return k_src;
	}

	public void setK_src(String k_src) {
		this.k_src = k_src;
	}
}
