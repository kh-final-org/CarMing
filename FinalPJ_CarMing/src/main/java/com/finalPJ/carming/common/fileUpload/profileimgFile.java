package com.finalPJ.carming.common.fileUpload;

import org.springframework.web.multipart.MultipartFile;

public class profileimgFile {
	private String name;
	private MultipartFile mpfile;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getMpfile() {
		return mpfile;
	}
	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}
	
	
}