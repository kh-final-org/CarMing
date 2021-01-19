package com.finalPJ.carming.survey.dto;

public class SurveyDto {
	private int memno;
	private String survey1;
	private String survey2;
	private String survey3;
	private String survey4;
	private String survey5;
	
	public SurveyDto() {
		super();
	}

	public SurveyDto(int memno, String survey1, String survey2, String survey3, String survey4, String survey5) {
		super();
		this.memno = memno;
		this.survey1 = survey1;
		this.survey2 = survey2;
		this.survey3 = survey3;
		this.survey4 = survey4;
		this.survey5 = survey5;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	public String getSurvey1() {
		return survey1;
	}

	public void setSurvey1(String survey1) {
		this.survey1 = survey1;
	}

	public String getSurvey2() {
		return survey2;
	}

	public void setSurvey2(String survey2) {
		this.survey2 = survey2;
	}

	public String getSurvey3() {
		return survey3;
	}

	public void setSurvey3(String survey3) {
		this.survey3 = survey3;
	}

	public String getSurvey4() {
		return survey4;
	}

	public void setSurvey4(String survey4) {
		this.survey4 = survey4;
	}

	public String getSurvey5() {
		return survey5;
	}

	public void setSurvey5(String survey5) {
		this.survey5 = survey5;
	}

	@Override
	public String toString() {
		return "SurveyDto [memno=" + memno + ", survey1=" + survey1 + ", survey2=" + survey2 + ", survey3=" + survey3
				+ ", survey4=" + survey4 + ", survey5=" + survey5 + "]";
	}
	
}
