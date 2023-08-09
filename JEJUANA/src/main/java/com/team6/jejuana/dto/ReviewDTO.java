package com.team6.jejuana.dto;

import java.util.Arrays;
import java.util.List;

public class ReviewDTO {
	private int plan_no; //�÷���ȣ
	private String review_subject; //����
	private String review_content; //����
	private int review_hit; //��ȸ��
	private String id; //�ۼ���
	private String nickname; //�ۼ��� �г���
	private String writedate; //�����
	private int activated; //Ȱ��ȭ
	private String ip;
	private String thumbnail;
	private int joayo_hit;
	
	//�±�
	private String tag_content;
	private String tagArr[];
	private String tag;
	
	//������
	private int place_no; //��������ȣ
	private String place_name; //�������̸�
	private int rate; //����
	private int rate_count; //���� �� ��� ��
			
	//�÷�
	private int days;//��¥��
			
	//�ڽ�
	private int days_order; //��° ��¥
	private int course_order; //����
	
	//���� ���� ���ڵ� �ѹ��� ������ �� �ʿ��� ���ڵ� ��ȣ
	private List<Integer> noList;
	
	//���������� �ϸ�ũ
	private int book_no;
	private int target_no;
	
	@Override
	public String toString() {
		return "ReviewDTO [plan_no=" + plan_no + ", review_subject=" + review_subject + ", review_content="
				+ review_content + ", review_hit=" + review_hit + ", id=" + id + ", nickname=" + nickname
				+ ", writedate=" + writedate + ", activated=" + activated + ", ip=" + ip + ", thumbnail=" + thumbnail
				+ ", joayo_hit=" + joayo_hit + ", tag_content=" + tag_content + ", tagArr=" + Arrays.toString(tagArr)
				+ ", tag=" + tag + ", place_no=" + place_no + ", place_name=" + place_name + ", rate=" + rate
				+ ", rate_count=" + rate_count + ", days=" + days + ", days_order=" + days_order + ", course_order="
				+ course_order + "]";
	}
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_hit() {
		return review_hit;
	}
	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getActivated() {
		return activated;
	}
	public void setActivated(int activated) {
		this.activated = activated;
	}
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getTag_content() {
		return tag_content;
	}

	public void setTag_content(String tag_content) {
		this.tag_content = tag_content;
	}

	public String[] getTagArr() {
		return tagArr;
	}

	public void setTagArr(String[] tagArr) {
		this.tagArr = tagArr;
	}

	public String getTag() {
		//�迭�� �±׸� ���ڿ��� ��ȯ
		String tagStr = Arrays.toString(tagArr);
		tagStr = tagStr.substring(1, tagStr.length()-1);
		tagStr = tagStr.replaceAll(", ", "/");
		tag = tagStr;
		return tag;
	}

	public void setTag(String tag) {
		this.tag += tag_content;
		tagArr = tag.split("/");
	}
	
	public int getJoayo_hit() {
		return joayo_hit;
	}
	
	public void setJoayo_hit(int joayo_hit) {
		this.joayo_hit = joayo_hit;
	}
	
	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getPlace_no() {
		return place_no;
	}

	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public int getRate_count() {
		return rate_count;
	}

	public void setRate_count(int rate_count) {
		this.rate_count = rate_count;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public int getDays_order() {
		return days_order;
	}

	public void setDays_order(int day) {
		this.days_order = day;
	}

	public int getCourse_order() {
		return course_order;
	}

	public void setCourse_order(int course_order) {
		this.course_order = course_order;
	}
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noRList) {
		this.noList = noRList;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public int getTarget_no() {
		return target_no;
	}
	public void setTarget_no(int target_no) {
		this.target_no = target_no;
	}
	
}
