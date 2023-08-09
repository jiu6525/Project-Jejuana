package com.team6.jejuana.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDTO {
    private int place_no;
    private String place_name;
    private String place_addr;
    private double latitude;
    private double longitude;
    private String content;
    private double rate;
    private String writedate;
    private String id;
    private int activated;
    private String thumbnail;


}