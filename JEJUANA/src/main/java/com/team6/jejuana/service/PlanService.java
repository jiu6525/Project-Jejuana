package com.team6.jejuana.service;

import com.team6.jejuana.dto.CourseDTO;
import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;

import java.util.List;

public interface PlanService {
    public int planSave(PlanDTO dto);
    public List<PlaceDTO> placeAllList();
    public List<PlaceDTO> placeSelectList(String searchWord, int pageNo);
    public List<PlaceDTO> bookmarkList(String searchWord,int pageNo, String userid);
    public PlaceDTO selectedPlace(int place_no);
    public int courseSave(List<CourseDTO> list);
    public List<PlanDTO> planList(String userid);
    public List<CourseDTO> courseSelect(int plan_no);
    public int planUpdate(PlanDTO dto);
    public int courseDel(int plan_no);
    public double takeRate(int place_no);
    public int checkRate(int place_no);


}