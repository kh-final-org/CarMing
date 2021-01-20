package com.finalPJ.carming.model.dto;

import java.util.Date;

public class MemberDto {
	   private int memno;
	   private String memnick;
	   private String memid;
	   private String mempw;
	   private String memname;
	   private String memzip;
	   private String memaddr;
	   private String memaddr2;
	   private String memphone;
	   private Date membirth;
	   private int memgender;
	   private String memchk;
	   private int memcode;
	   private String memfile;
	   public MemberDto() {
	      super();
	      // TODO Auto-generated constructor stub
	   }


	   public MemberDto(int memno, String memnick, String memid, String mempw, String memname, String memzip,
	         String memaddr, String memaddr2, String memphone, Date membirth, int memgender, String memchk, int memcode,
	         String memfile) {
	      super();
	      this.memno = memno;
	      this.memnick = memnick;
	      this.memid = memid;
	      this.mempw = mempw;
	      this.memname = memname;
	      this.memzip = memzip;
	      this.memaddr = memaddr;
	      this.memaddr2 = memaddr2;
	      this.memphone = memphone;
	      this.membirth = membirth;
	      this.memgender = memgender;
	      this.memchk = memchk;
	      this.memcode = memcode;
	      this.memfile = memfile;
	   }


	   public String getMemid() {
	      return memid;
	   }

	   public void setMemid(String memid) {
	      this.memid = memid;
	   }
	   public int getMemno() {
	      return memno;
	   }
	   public void setMemno(int memno) {
	      this.memno = memno;
	   }
	   public String getMemnick() {
	      return memnick;
	   }
	   public void setMemnick(String memnick) {
	      this.memnick = memnick;
	   }
	   public String getMempw() {
	      return mempw;
	   }
	   public void setMempw(String mempw) {
	      this.mempw = mempw;
	   }
	   public String getMemname() {
	      return memname;
	   }
	   public void setMemname(String memname) {
	      this.memname = memname;
	   }
	   public String getMemzip() {
	      return memzip;
	   }
	   public void setMemzip(String memzip) {
	      this.memzip = memzip;
	   }
	   public String getMemaddr() {
	      return memaddr;
	   }
	   public void setMemaddr(String memaddr) {
	      this.memaddr = memaddr;
	   }
	   public String getMemaddr2() {
	      return memaddr2;
	   }
	   public void setMemaddr2(String memaddr2) {
	      this.memaddr2 = memaddr2;
	   }
	   public String getMemphone() {
	      return memphone;
	   }
	   public void setMemphone(String memphone) {
	      this.memphone = memphone;
	   }
	   public Date getMembirth() {
	      return membirth;
	   }
	   public void setMembirth(Date membirth) {
	      this.membirth = membirth;
	   }
	   public int getMemgender() {
	      return memgender;
	   }
	   public void setMemgender(int memgender) {
	      this.memgender = memgender;
	   }
	   public String getMemchk() {
	      return memchk;
	   }
	   public void setMemchk(String memchk) {
	      this.memchk = memchk;
	   }
	   public int getMemcode() {
	      return memcode;
	   }
	   public void setMemcode(int memcode) {
	      this.memcode = memcode;
	   }
	   public String getMemfile() {
	      return memfile;
	   }
	   public void setMemfile(String memfile) {
	      this.memfile = memfile;
	   }
	   
	   

}
