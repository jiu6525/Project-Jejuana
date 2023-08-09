package com.team6.jejuana.dto;

public class ReviewSearchVO {
	//검색에 필요한 변수
	private String searchKey;
	private String searchWord;
	
	private int totalRecord; //총 레코드 수

	@Override
	public String toString() {
		return "SearchVO [searchKey=" + searchKey + ", searchWord=" + searchWord + ", totalRecord=" + totalRecord + "]";
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

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
}
