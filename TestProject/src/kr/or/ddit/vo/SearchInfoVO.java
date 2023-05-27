package kr.or.ddit.vo;

public class SearchInfoVO {
	private String field;
	private String searchWord;
	private int page;
	private int startNum;
	private int lastNum;
	
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	
	
}
