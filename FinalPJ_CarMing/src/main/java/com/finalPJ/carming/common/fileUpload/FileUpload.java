package com.finalPJ.carming.common.fileUpload;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	private String name;
	private MultipartFile prFile;
	private MultipartFile prFile2;
	private MultipartFile prFile3;
	private MultipartFile prDesc;
	
	public FileUpload() {
		super();
	}

	public FileUpload(String name, MultipartFile prFile, MultipartFile prFile2, MultipartFile prFile3, MultipartFile prDesc) {
		super();
		this.name = name;
		this.prFile = prFile;
		this.prFile2 = prFile2;
		this.prFile3 = prFile3;
		this.prDesc = prDesc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getprFile() {
		return prFile;
	}

	public void setprFile(MultipartFile pFile) {
		this.prFile = pFile;
	}

	public MultipartFile getprFile2() {
		return prFile2;
	}

	public void setprFile2(MultipartFile pFile2) {
		this.prFile2 = pFile2;
	}

	public MultipartFile getprFile3() {
		return prFile3;
	}

	public void setprFile3(MultipartFile pFile3) {
		this.prFile3 = pFile3;
	}

	public MultipartFile getprDesc() {
		return prDesc;
	}

	public void setprDesc(MultipartFile pDesc) {
		this.prDesc = pDesc;
	}
	
	
}
