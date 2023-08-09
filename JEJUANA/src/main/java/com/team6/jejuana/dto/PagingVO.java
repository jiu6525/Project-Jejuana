package com.team6.jejuana.dto;

public class PagingVO {
	
	private int nowPage = 1;
	private int onePageRecord = 5;
	private int totalRecord;
	private int totalPage;
	private int lastPageRecord = 0;
	
	private int onePageNumCount = 5;
	private int startPageNum = 1;
	
	//검색에 필요한 변수들
	private String searchKey;
	private String searchWord;
	
	private String id;
	
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", onePageRecord=" + onePageRecord + ", totalRecord=" + totalRecord
				+ ", totalPage=" + totalPage + ", lastPageRecord=" + lastPageRecord + ", onePageNumCount="
				+ onePageNumCount + ", startPageNum=" + startPageNum + ", searchKey=" + searchKey + ", searchWord="
				+ searchWord + "]";
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		startPageNum = ((nowPage-1)/onePageNumCount)*onePageNumCount+1;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		totalPage = (int)Math.ceil((double)totalRecord/onePageRecord);
		
		lastPageRecord = onePageRecord;
		if(nowPage==totalPage) {
			if(totalRecord%onePageRecord==0){
				lastPageRecord = onePageRecord;
			}else{
				lastPageRecord = totalRecord%onePageRecord;
			}
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
	public int getOnePageNumCount() {
		return onePageNumCount;
	}
	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
