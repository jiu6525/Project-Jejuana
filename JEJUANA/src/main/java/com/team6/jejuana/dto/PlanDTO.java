package com.team6.jejuana.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlanDTO {
    private int plan_no; //플랜 번호
    private String plan_name; // 플랜이름
    private String start_date; //일정 시작일
    private String end_date;   // 일정 종료일
    private String transport;  // 교통수단 public/ownCar
    private int number_person;  // 모집인원수
    private int participants;  // 참가인원수
    private String temp;  // 임시저장여부
    private String id;  //작성자
    private int days;   //기간
    private int activated; // 비활성 여부

    private int d_day;
	private int review_date;
	
	//여러 개의 레코드 한번에 삭제할 때 필요한 레코드 번호
	private List<Integer> noPList;

	@Override
	public String toString() {
		return "PlanDTO [plan_no=" + plan_no + ", plan_name=" + plan_name + ", start_date=" + start_date + ", end_date="
				+ end_date + ", transport=" + transport + ", number_person=" + number_person + ", participants="
				+ participants + ", temp=" + temp + ", id=" + id + ", days=" + days + ", activated=" + activated
				+ ", d_day=" + d_day + ", review_date=" + review_date + "]";
	}

	public int getPlan_no() {
		return plan_no;
	}

	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) throws ParseException {
		this.start_date = start_date;
		
		//d-day계산

		String todayFm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				 
		Date date = new Date(dateFormat.parse(start_date).getTime());
		Date today = new Date(dateFormat.parse(todayFm).getTime());
				
		long calculate = date.getTime() - today.getTime();
				
		int Days = (int)(calculate/(24*60*60*1000));
				
		d_day = Days;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) throws ParseException {
		this.end_date = end_date;
		
		String todayFm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				 
		Date date = new Date(dateFormat.parse(end_date).getTime());
		Date today = new Date(dateFormat.parse(todayFm).getTime());
				
		long calculate = date.getTime() - today.getTime();
		
		int Days = (int)(calculate/(24*60*60*1000));
		
		review_date = Days;
		
	}

	public String getTransport() {
		return transport;
	}

	public void setTransport(String transport) {
		this.transport = transport;
	}

	public int getNumber_person() {
		return number_person;
	}

	public void setNumber_person(int number_person) {
		this.number_person = number_person;
	}

	public int getParticipants() {
		return participants;
	}

	public void setParticipants(int participants) {
		this.participants = participants;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public int getActivated() {
		return activated;
	}

	public void setActivated(int activated) {
		this.activated = activated;
	}

	public int getD_day() {
		return d_day;
	}

	public void setD_day(int d_day) {
		this.d_day = d_day;
	}

	public int getReview_date() {
		return review_date;
	}

	public void setReview_date(int review_date) {
		this.review_date = review_date;
	}

	public List<Integer> getNoPList() {
		return noPList;
	}

	public void setNoPList(List<Integer> noPList) {
		this.noPList = noPList;
	}
	
}