package com.team6.jejuana.dto;

public class PagingDTO {
	//페이징처리시 필요한 변수들
	private int nowPage = 1;
	private int onePageRecord = 4;//한페이지에 표시할 레코드 수
	private int totalRecord;//총레코드 수
	private int totalPage;//총페이지수
	private int lastPageRecord;//마지막 페이지에 남아 있는 레코드 수
	
	private int onePageNumCount=4;//한페이지당 페이지 갯수
	private int startPageNum = 1;
	
	
	
	//검색에 필요한 변수들
	private String searchKey;
	private String searchWord;
	
	//-------------------------------------------------------------------
	

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
		
		//출력할 페이지 시작번호를 계산
		//((현재페이지-1)/표시할페이지수)*표시할 페이지수+1
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
		
		//총레코드수를 이용하여 총페이지 수를 구하기
		totalPage = (int) Math.ceil((double)totalRecord/onePageRecord);
		
		//마지막페이지에 남아 있는 레코드 수
		lastPageRecord = onePageRecord;
		if(nowPage==totalPage) {
			if(totalRecord%onePageRecord==0) {//나머지 0일경우는 lastPageRecord <- onePageRecord
				lastPageRecord = onePageRecord;
			}else {//나머지가 있을 경우 남아있는 레코드수를 lastPageRecord
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
	
	
	
}
