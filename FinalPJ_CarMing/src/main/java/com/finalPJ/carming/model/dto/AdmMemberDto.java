package com.finalPJ.carming.model.dto;

public class AdmMemberDto {
	private int memNo;
	private String memNick;
	private String memId;
	private String memPw;
	private String memName;
	private String memAddr;
	private String memPhone;
	private String memBirth;
	private int memGender;
	private char memChk;
	private int memCode;
	private String memFile;
	
	public AdmMemberDto() {
		super();
	}

	public AdmMemberDto(int memNo, String memNick, String memId, String memPw, String memName, String memAddr,
			String memPhone, String memBirth, int memGender, char memChk, int memCode, String memFile) {
		super();
		this.memNo = memNo;
		this.memNick = memNick;
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memAddr = memAddr;
		this.memPhone = memPhone;
		this.memBirth = memBirth;
		this.memGender = memGender;
		this.memChk = memChk;
		this.memCode = memCode;
		this.memFile = memFile;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemAddr() {
		return memAddr;
	}

	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public int getMemGender() {
		return memGender;
	}

	public void setMemGender(int memGender) {
		this.memGender = memGender;
	}

	public char getMemChk() {
		return memChk;
	}

	public void setMemChk(char memChk) {
		this.memChk = memChk;
	}

	public int getMemCode() {
		return memCode;
	}

	public void setMemCode(int memCode) {
		this.memCode = memCode;
	}

	public String getMemFile() {
		return memFile;
	}

	public void setMemFile(String memFile) {
		this.memFile = memFile;
	}

	@Override
	public String toString() {
		return "AdmMemberDto [memNo=" + memNo + ", memNick=" + memNick + ", memId=" + memId + ", memPw=" + memPw
				+ ", memName=" + memName + ", memAddr=" + memAddr + ", memPhone=" + memPhone + ", memBirth=" + memBirth
				+ ", memGender=" + memGender + ", memChk=" + memChk + ", memCode=" + memCode + ", memFile=" + memFile
				+ "]";
	}
	
	

}
