package com.team6.jejuana.service;

import com.team6.jejuana.dao.PlanDAO;
import com.team6.jejuana.dto.CourseDTO;
import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanServiceImpl implements PlanService {
    @Autowired
    PlanDAO dao;

    public PlanServiceImpl(PlanDAO dao) {
        this.dao = dao;
    }

    @Override
    public int planSave(PlanDTO dto) {
        return dao.planSave(dto);
    }

    @Override
    public List<PlaceDTO> placeAllList() {
        return dao.placeAllList();
    }

    @Override
    public List<PlaceDTO> placeSelectList(String searchWord, int pageNo) {
        return dao.placeSelectList(searchWord, pageNo);
    }

    @Override
    public PlaceDTO selectedPlace(int place_no) {
        return dao.selectedPlace(place_no);
    }

    @Override
    public List<PlaceDTO> bookmarkList(String searchWord, int pageNo, String userid) {
        return dao.bookmarkList(searchWord, pageNo, userid);
    }

    @Override
    public int courseSave(List<CourseDTO> list) {
        return dao.courseSave(list);
    }

    @Override
    public List<PlanDTO> planList(String userid) {
        return dao.planList(userid);
    }

    @Override
    public List<CourseDTO> courseSelect(int plan_no) {
        return dao.courseSelect(plan_no);
    }

    @Override
    public int planUpdate(PlanDTO dto) {
        return dao.planUpdate(dto);
    }

    @Override
    public int courseDel(int plan_no) {
        return dao.courseDel(plan_no);
    }

    @Override
    public double takeRate(int place_no) {
        return dao.takeRate(place_no);
    }

    @Override
    public int checkRate(int place_no) {
        return dao.checkRate(place_no);
    }
}