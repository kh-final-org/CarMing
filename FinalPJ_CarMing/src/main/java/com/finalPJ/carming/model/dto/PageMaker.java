package com.finalPJ.carming.model.dto;

public class PageMaker {
	private Pagination pag;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum=5;
	
	public Pagination getPag() {
		return pag;
	}
	
	public void setPag(Pagination pag) {
		this.pag=pag;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		calcData();
	}
	private void calcData() {
		
		//endPage : 끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수 
		endPage = (int)(Math.ceil(pag.getPage() / (double)displayPageNum)*displayPageNum);
		
		startPage = (endPage - displayPageNum)+1;
		if(startPage <= 0) {
			startPage = 1;
		}
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)pag.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = (startPage == 1? false : true);
		next = (endPage*pag.getPerPageNum() < totalCount ? true : false);
	}
	   public int getStartPage() {
	        return startPage;
	    }
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public void setEndPage(int endPage) {
	        this.endPage = endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public void setPrev(boolean prev) {
	        this.prev = prev;
	    }
	    public boolean isNext() {
	        return next;
	    }
	    public void setNext(boolean next) {
	        this.next = next;
	    }
	    public int getDisplayPageNum() {
	        return displayPageNum;
	    }
	    public void setDisplayPageNum(int displayPageNum) {
	        this.displayPageNum = displayPageNum;
	    }

}
